//
//  BaseRequest.h
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerAPIResponse.h"

typedef void (^ServerAPICompletion)(ServerAPIResponse *response);

typedef NS_ENUM(NSUInteger, RequestMethod) {
    RequestMethodPOST,
    RequestMethodGET,
};

@interface BaseRequest : NSObject

@property (nonatomic, strong) NSURLSessionDataTask *dataTask;
@property (nonatomic, copy) ServerAPICompletion completion;

- (void)doRequestWithCompletion:(ServerAPICompletion)completion;
- (ServerAPIResponse *)cacheResponse;
- (void)saveResponseToCacheFile:(ServerAPIResponse *)response;

// required
- (NSString *)requestURI;
- (NSString *)requestJson;

// optional
- (NSString *)requestUrl;
- (RequestMethod)requestMethod;
- (BOOL)openCache;
- (NSTimeInterval)cacheValidTime;

@end
