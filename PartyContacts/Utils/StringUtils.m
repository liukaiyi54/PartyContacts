//
//  StringUtils.m
//  PartyContacts
//
//  Created by Michael on 04/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "StringUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation StringUtils

+ (NSString *)md5StringFromString:(NSString *)string {
    if (string == nil || string.length == 0) {
        return nil;
    }
    
    const char* value = [string UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [outputString appendFormat:@"%02x", outputBuffer[i]];
    }
    return outputString;
}

+ (NSString *)trimToEmpty:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) {
        return @"";
    }
    if (string.length == 0) {
        return @"";
    }
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
