//
//  ServerAPIUtils.m
//  PartyContacts
//
//  Created by Michael on 05/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ServerAPIUtils.h"
#import "ServerAPIConstants.h"
#import <AFNetworking/AFNetworking.h>

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
    
//    mutableURLReq setAllHTTPHeaderFields:
    AFHTTPSessionManager *manager = [self jsonSessionManager];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:mutableURLReq completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        ServerAPIResponse *response = nil;
        if (error) {
            if (error.code == ) {
                <#statements#>
            }
        }
    }];
}

+ (NSURLSessionDataTask *)sendGETToURL:(NSURL *)url completion:(ServerAPICompletion)completion {
    
}

+ (NSURLSessionDataTask *)sendGETToURL:(NSURL *)url request:(BaseRequest *)request completion:(ServerAPICompletion)completion {
    
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
