//
//  UIView+NibLoading.m
//  PartyContacts
//
//  Created by Michael on 24/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+ (instancetype)loadInstanceFromNib {
    UIView *result = nil;
    NSArray *elements = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    for (id obj in elements) {
        if ([obj isKindOfClass:[self class]]) {
            result = obj;
            break;
        }
    }
    return result;
}

@end
