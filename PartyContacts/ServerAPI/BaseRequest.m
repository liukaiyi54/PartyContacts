//
//  BaseRequest.m
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

// to override in subclass
- (NSString *)requestURI {
    return @"";
}

- (NSString *)requestJson {
    return @"";
}




@end
