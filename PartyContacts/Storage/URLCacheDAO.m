//
//  URLCacheDAO.m
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "URLCacheDAO.h"
#import "ServerAPIConstants.h"
#import "StringUtils.h"

@implementation URLCacheDAO

+ (instancetype)sharedManager {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initPrivate];
    });
    return instance;
}

- (instancetype)initPrivate {
    self = [super init];
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"IllegalAccessException" reason:@"Use '+ (instancetype)sharedManager' instead" userInfo:nil];
}

- (NSString *)urlCacheResponseJsonForRequest:(BaseRequest *)request {
    NSString *cachedJson;
    NSDate *storedDate;
    NSString *path = [self cacheFilePath: request];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path isDirectory:nil] == YES) {
        id dic = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if ([dic isKindOfClass:[NSString class]]) {
            return nil;
        }
        if ([dic isKindOfClass:[NSDictionary class]]) {
            cachedJson = dic[@"responseJson"];
            storedDate = dic[@"storeDate"];
        }
    }
    if ([self isValidCacheOfRequest:request storeDate:storedDate]) {
        return cachedJson;
    }
    return nil;
}

- (void)storeUrlCacheResponseJson:(NSString *)responseJson forRequest:(BaseRequest *)request {
    NSDictionary *dict = @{@"responseJson": responseJson, @"storeDate": [NSDate date]};
    [NSKeyedArchiver archiveRootObject:dict toFile:[self cacheFilePath:request]];
}

- (NSString *)cacheBasePath {
    NSString *pathOfLibrary = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [pathOfLibrary stringByAppendingPathComponent:@"LazyRequestCache"];
    return path;
}

#pragma mark - private
- (NSString *)cacheFilePath:(BaseRequest *)request {
    NSString *cacheFileName = [self cacheFileName: request];
    NSString *path = [self cacheBasePath];
    path = [path stringByAppendingPathComponent:cacheFileName];
    return path;
}

- (NSString *)cacheFileName:(BaseRequest *)request {
    NSString *requestURI = request.requestURI;
    NSString *baseUrl = kServerBaseURL;
    NSString *requestJson = request.requestJson;
    NSString *requestMethod;
    if (request.requestMethod == RequestMethodGET) {
        requestMethod = @"GET";
    } else {
        requestMethod = @"POST";
    }
    
    NSString *appVersion = @"1.0.0";
    NSString *requestInfo = [NSString stringWithFormat:@"Method:%@ BaseUrl:%@ URI:%@ ArgumentJson:%@ AppVersion:%@", requestMethod, baseUrl, requestURI, requestJson, appVersion];
    
    NSString *cacheFileName = [StringUtils md5StringFromString:requestInfo];
    return cacheFileName;
}

- (BOOL)isValidCacheOfRequest:(BaseRequest *)request storeDate:(NSDate *)date {
    NSDate *now = [NSDate date];
    NSDate *invalidDate = [NSDate dateWithTimeInterval:request.cacheValidTime sinceDate:date];
    if ([[now laterDate:date] isEqualToDate:now] && [[now laterDate:invalidDate] isEqualToDate:invalidDate]) {
        return YES;
    }
    return NO;
}

@end
