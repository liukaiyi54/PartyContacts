//
//  ServerAPIResponse.m
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ServerAPIResponse.h"
#import "ServerAPIConstants.h"

@implementation ServerAPIResponse: NSObject

- (instancetype)init {
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _code = [[dict objectForKey:@"code"] integerValue];
        _message = [[dict objectForKey:@"message"] copy];
        _data = [[dict objectForKey:@"data"] copy];
    }
    return self;
}

- (BOOL)success {
    return _code == kServerAPICodeSuccess;
}


@end

@implementation ServerAPIResponse(Error)

+ (instancetype)responseForNetworkErrorWithMessage:(NSString *)message {
    NSDictionary *dict;
    if (message) {
        dict = @{@"code": @(kServerAPICodeNetworkError), @"message": message};
    } else {
        dict = @{@"code": @(kServerAPICodeNetworkError)};
    }
    ServerAPIResponse *instance = [[ServerAPIResponse alloc] initWithDictionary:dict];
    return instance;
}

@end
