//
//  ServerAPIUtils.m
//  PartyContacts
//
//  Created by Michael on 05/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ServerAPIUtils.h"
#import "ServerAPIConstants.h"
#import "DeviceUtils.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

NSString *const kNotificationServerAPIErrorOccurred = @"kNotificationServerAPIErrorOccurred";

@implementation ServerAPIUtils

+ (NSURLSessionDataTask *)doRequest:(BaseRequest *)request completion:(ServerAPICompletion)completion {
    NSString *json = request.requestJson;
    NSURL *url = [NSURL URLWithString:request.requestUrl];
    if (request.requestMethod == RequestMethodPOST) {
        return [self sendJSON:json toURL:url request:request completion:completion];
    } else {
        return [self sendGETToURL:url request:request completion:completion];
    }
}

+ (NSURLSessionDataTask *)sendJSON:(NSString *)json toURL:(NSURL *)url completion:(ServerAPICompletion)completion {
    return [self sendJSON:json toURL:url request:nil completion:completion];
}

+ (NSURLSessionDataTask *)sendJSON:(NSString *)json toURL:(NSURL *)url request:(BaseRequest *)request completion:(ServerAPICompletion)completion {
    NSMutableURLRequest *mutableURLReq = [NSMutableURLRequest requestWithURL:url];
    [mutableURLReq setHTTPMethod:@"POST"];
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    [mutableURLReq setHTTPBody:data];
    
    [mutableURLReq setAllHTTPHeaderFields:@{@"User-Agent": [DeviceUtils userAgent],
                                            @"Content-Type": @"application/json",
                                            @"Content-Length": [@(data.length) stringValue],
                                            @"FA": [DeviceUtils idfaString],
                                            @"FV": [DeviceUtils idfvString],
                                            }];
    AFHTTPSessionManager *manager = [self jsonSessionManager];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:mutableURLReq completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        ServerAPIResponse *resp = nil;
        if (error) {
            if (error.code == kServerAPICodeCancelError) {
                return;
            }
            resp = [ServerAPIResponse responseForNetworkErrorWithMessage:error.description];
        } else if (![responseObject isKindOfClass:[NSDictionary class]]) {
            resp = [ServerAPIResponse responseForMalformedResponseErrorWithMessage:nil];
        } else {
            resp = [ServerAPIResponse mj_objectWithKeyValues:responseObject];
        }
        if (!resp) {
            resp = [ServerAPIResponse responseForMalformedResponseErrorWithMessage:nil];
        }
        if (!resp.success) {
            [self notifyAPIErrorOccurredWithParameters:nil url:url response:resp error:[resp error]];
        }
        if (request) {
            [request saveResponseToCacheFile:resp];
        }
        if (completion) {
            completion(resp);
        }
    }];
    [dataTask resume];
    return dataTask;
}

+ (NSURLSessionDataTask *)sendGETToURL:(NSURL *)url completion:(ServerAPICompletion)completion {
    return [[self class] sendGETToURL:url request:nil completion:completion];
}

+ (NSURLSessionDataTask *)sendGETToURL:(NSURL *)url request:(BaseRequest *)request completion:(ServerAPICompletion)completion {
    NSMutableURLRequest *mutableURLReq = [NSMutableURLRequest requestWithURL:url];
    [mutableURLReq setHTTPMethod:@"GET"];
    [mutableURLReq setAllHTTPHeaderFields:@{@"User-Agent":[DeviceUtils userAgent],
                                            @"FA": [DeviceUtils idfaString],
                                            @"FV": [DeviceUtils idfvString],
                                            }];
    AFHTTPSessionManager *manager = [self jsonSessionManager];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:mutableURLReq completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        ServerAPIResponse *resp = nil;
        if (error) {
            if (error.code == kServerAPICodeCancelError) {
                return;
            }
            resp = [ServerAPIResponse responseForNetworkErrorWithMessage:error.description];
        } else if (![responseObject isKindOfClass:[NSDictionary class]]) {
            resp = [ServerAPIResponse responseForMalformedResponseErrorWithMessage:nil];
        } else {
            resp = [ServerAPIResponse mj_objectWithKeyValues:responseObject];
        }
        if (!resp) {
            resp = [ServerAPIResponse responseForMalformedResponseErrorWithMessage:nil];
        }
        if (!resp.success) {
            [self notifyAPIErrorOccurredWithParameters:nil url:url response:resp error:[resp error]];
        }
        if (request) {
            [request saveResponseToCacheFile:resp];
        }
        if (completion) {
            completion(resp);
        }
    }];
    [dataTask resume];
    return dataTask;
}

+ (void)cancelAllRequests {
    [[self jsonSessionManager].dataTasks enumerateObjectsUsingBlock:^(NSURLSessionDataTask * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSURLSessionDataTask *task = obj;
        [task cancel];
    }];
    [[self uploadSessionManager].dataTasks enumerateObjectsUsingBlock:^(NSURLSessionDataTask * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSURLSessionDataTask *task = obj;
        [task cancel];
    }];
}

+ (void)notifyAPIErrorOccurredWithParameters:(id)params url:(NSURL *)url response:(ServerAPIResponse *)response error:(NSError *)error {
    NSMutableDictionary *userInfo = [@{} mutableCopy];
    if (params)     userInfo[@"parameters"] = params;
    if (url)        userInfo[@"url"] = url;
    if (response)   userInfo[@"response"] = response;
    if (error)      userInfo[@"error"] = error;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationServerAPIErrorOccurred object:self userInfo:[userInfo copy]];
}

+ (AFHTTPSessionManager *)jsonSessionManager {
    static AFHTTPSessionManager *jsonSessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jsonSessionManager = [AFHTTPSessionManager manager];
        jsonSessionManager.operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    });
    return jsonSessionManager;
}

+ (AFHTTPSessionManager *)uploadSessionManager {
    static AFHTTPSessionManager *uploadSessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        uploadSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        uploadSessionManager.operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
        uploadSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return uploadSessionManager;
}
@end
