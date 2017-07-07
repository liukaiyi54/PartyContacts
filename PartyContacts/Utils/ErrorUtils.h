//
//  ErrorUtils.h
//  PartyContacts
//
//  Created by Michael on 07/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kErrorUserInfoErrorMessageKey;
extern NSString *const kErrorDomainServerAPIBusinessError;
extern NSString *const kErrorDomainLocationServiceError;
extern NSString *const kErrorDomainDoorControlServiceError;

@interface ErrorUtils : NSObject

+ (NSString *)errorTips:(NSError *)error;
+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code message:(NSString *)message;
+ (BOOL)isNotLoggedInError:(NSError *)error;

@end
