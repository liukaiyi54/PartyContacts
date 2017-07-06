//
//  BaseRequest.m
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "BaseRequest.h"
#import "URLUtils.h"
#import "ServerAPIUtils.h"
#import "URLCacheDAO.h"
#import <MJExtension.h>

@implementation BaseRequest

// to override in subclass
- (NSString *)requestURI {
    return @"";
}

- (NSString *)requestJson {
    return @"";
}

- (NSString *)requestUrl {
    NSString *url = [URLUtils normalizedURLWithURI:[self requestURI]].absoluteString;
    if (self.requestMethod == RequestMethodGET) {
        NSDictionary *params = [NSDictionary mj_objectWithKeyValues:[self requestJson]];
        url = [URLUtils normalizedURLWithURI:[self requestURI] params:params].absoluteString;
    }
    return url;
}

- (RequestMethod)requestMethod {
    return RequestMethodPOST;
}

- (BOOL)openCache {
    return NO;
}

- (NSTimeInterval)cacheValidTime {
    return 60;
}

#pragma mark - public method
- (void)doRequestWithCompletion:(ServerAPICompletion)completion {
    self.dataTask = [ServerAPIUtils doRequest:self completion:completion];
    self.completion = completion;
}

- (ServerAPIResponse *)cacheResponse {
    NSString *responseJson = [[URLCacheDAO sharedManager] urlCacheResponseJsonForRequest:self];
    return [ServerAPIResponse  mj_objectWithKeyValues:responseJson];
}

- (void)saveResponseToCacheFile:(ServerAPIResponse *)response {
    if (![self openCache] || !response.success) {
        return;
    }
    NSString *json = [response mj_JSONString];
    [[URLCacheDAO sharedManager] storeUrlCacheResponseJson:json forRequest:self];
}


@end
