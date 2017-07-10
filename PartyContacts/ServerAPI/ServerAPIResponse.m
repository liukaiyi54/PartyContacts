//
//  ServerAPIResponse.m
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ServerAPIResponse.h"
#import "ServerAPIConstants.h"
#import "ErrorUtils.h"

static NSString *kUnknownError = @"未知错误";

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

+ (NSArray *)mj_ignoredPropertyNames {
    return @[@"success"];
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

+ (instancetype)responseForMalformedResponseErrorWithMessage:(NSString *)message {
    NSDictionary *dict;
    if (message) {
        dict = @{@"code": @(kServerAPICodeMalformedResponse), @"message": message};
    } else {
        dict = @{@"code": @(kServerAPICodeMalformedResponse)};
    }
    ServerAPIResponse *instance = [[ServerAPIResponse alloc] initWithDictionary:dict];
    return instance;
}

- (NSError *)error {
    if ([self success]) {
        return nil;
    }
    NSError *error = [ErrorUtils errorWithDomain:kErrorDomainServerAPIBusinessError code:self.code message:[self errorMessage]];
    return error;
}

- (NSString *)errorMessage {
    if (self.success) {
        return nil;
    }
    NSString *errorMessage;
    if (self.code == kServerAPICodeCustomErrorMessage) {
        errorMessage = self.message;
    } else {
        errorMessage = [[[self class] errorMessageDictinary] objectForKey:@(self.code)];
    }
    if (errorMessage.length == 0) {
        errorMessage = kUnknownError;
    }
    return errorMessage;
}

+ (NSDictionary *)errorMessageDictinary {
    static NSDictionary *dict;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{
                 @(kServerAPICodeNetworkError): @"网络异常",
                 @(kServerAPICodeMalformedResponse): @"系统异常",
                 @(kServerAPICodeIllegalParameters): @"参数错误",
                 @(kServerAPICodeAuthError): @"未登录",
                 @(kServerAPICodeNotLoggedIn): @"系统错误",
                 };
    });
    return dict;
}

@end
