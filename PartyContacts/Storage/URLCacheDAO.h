//
//  URLCacheDAO.h
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerAPIResponse.h"
#import "BaseRequest.h"

@interface URLCacheDAO : NSObject

+ (instancetype)sharedManager;
- (NSString *)urlCacheResponseJsonForRequest:(BaseRequest *)request;
- (void)storeUrlCacheResponseJson:(NSString *)responseJson forRequest:(BaseRequest *)request;
- (NSString *)cacheBasePath;

@end
