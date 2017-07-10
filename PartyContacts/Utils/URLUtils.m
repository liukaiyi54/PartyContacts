//
//  URLUtils.m
//  PartyContacts
//
//  Created by Michael on 04/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "URLUtils.h"
#import "ServerAPIConstants.h"
#import "NSURL+QueryDictionary.h"
#import "DeviceUtils.h"

@implementation URLUtils

+ (NSURL *)normalizedURLWithURI:(NSString *)uri {
    if (!uri) {
        return nil;
    }
    NSString *urlStr;
    if ([uri hasPrefix:@"http://"] || [uri hasPrefix:@"https://"]) {
        urlStr = uri;
    } else {
        urlStr = [NSString stringWithFormat:@"%@%@", kServerBaseURL, uri];
    }
    NSString *token = @"";
    NSString *idfa = [DeviceUtils idfaString];
    NSString *appVersion = [NSString stringWithFormat:@"iOS_%@", kAppVersion];
    NSURL *url = [NSURL URLWithString:urlStr];
    url = [url uq_URLByAppendingQueryDictionary:@{@"token":token,
                                                  @"ver":appVersion,
                                                  @"imei":idfa}];
    return url;
}

+ (NSURL *)normalizedURLWithURI:(NSString *)uri params:(NSDictionary *)params {
    NSURL *url = [[self class] normalizedURLWithURI:uri];
    if (!params) {
        return url;
    }
    url = [url uq_URLByAppendingQueryDictionary:params];
    return url;
}

@end
