//
//  ErrorUtils.m
//  PartyContacts
//
//  Created by Michael on 07/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ErrorUtils.h"
#import "ServerAPIConstants.h"

NSString *const kErrorUserInfoErrorMessageKey = @"kErrorUserInfoErrorMessageKey";

NSString *const kErrorDomainServerAPIBusinessError = @"kErrorDomainServerAPIBusinessError";
NSString *const kErrorDomainLocationServiceError = @"kErrorDomainLocationServiceError";
NSString *const kErrorDomainDoorControlServiceError = @"kErrorDomainDoorControlServiceError";

@implementation ErrorUtils

+ (NSString *)errorTips:(NSError *)error {
    NSString *errorMessage = error.userInfo[kErrorUserInfoErrorMessageKey];
    if (errorMessage.length == 0) {
        errorMessage = @"未知错误";
    }
    return errorMessage;
}

+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code message:(NSString *)message {
    if (!message) {
        message = @"";
    }
    return [NSError errorWithDomain:domain code:code userInfo:@{kErrorUserInfoErrorMessageKey: message}];
}

+ (BOOL)isNotLoggedInError:(NSError *)error {
    if ([error.domain isEqualToString:kErrorDomainServerAPIBusinessError] && error.code == kServerAPICodeNotLoggedIn) {
        return YES;
    }
    return NO;
}

@end
