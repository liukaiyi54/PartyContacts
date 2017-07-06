//
//  StringUtils.h
//  PartyContacts
//
//  Created by Michael on 04/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject

+ (NSString *)md5StringFromString:(NSString *)string;
+ (NSString *)trimToEmpty:(NSString *)string;

@end
