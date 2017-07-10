//
//  BannerAPI.m
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "BannerAPI.h"

@implementation BannerAPI

- (NSString *)requestURI {
    return @"/app/home/getBanner.do";
}

- (NSString *)requestJson {
    return @"{}";
}

- (BOOL)openCache {
    return YES;
}

@end
