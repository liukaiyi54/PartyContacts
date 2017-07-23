//
//  MBProgressHUD+Utils.m
//  PartyContacts
//
//  Created by Michael on 23/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MBProgressHUD+Utils.h"

@implementation MBProgressHUD (Utils)

+ (MBProgressHUD *)showLoadingMessage:(NSString *)message {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud showLoadingMessage:message];
    return hud;
}

+ (MBProgressHUD *)showFleetingMessage:(NSString *)message {
    return [self showFleetingMessage:message image:nil];
}

+ (MBProgressHUD *)showFleetingMessage:(NSString *)message image:(UIImage *)image {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud showFleetingMessage:message image:image];
    return hud;
}

- (void)showLoadingMessage:(NSString *)message {
    self.labelText = message;
    self.customView = nil;
    self.mode = MBProgressHUDModeIndeterminate;
    self.removeFromSuperViewOnHide = YES;
    self.dimBackground = YES;
    self.userInteractionEnabled = YES;
}

- (void)showFleetingMessage:(NSString *)message {
    [self showFleetingMessage:message image:nil];
}

- (void)showFleetingMessage:(NSString *)message image:(UIImage *)image {
    self.labelText = message;
    self.customView = [[UIImageView alloc] initWithImage:image];
    self.mode = MBProgressHUDModeCustomView;
    self.removeFromSuperViewOnHide = YES;
    self.dimBackground = NO;
    self.userInteractionEnabled = NO;
    
    [self hide:YES afterDelay:1.0f];
}

@end
