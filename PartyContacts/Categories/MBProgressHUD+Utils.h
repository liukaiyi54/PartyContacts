//
//  MBProgressHUD+Utils.h
//  PartyContacts
//
//  Created by Michael on 23/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Utils)

+ (MBProgressHUD *)showLoadingMessage:(NSString *)message;
+ (MBProgressHUD *)showFleetingMessage:(NSString *)message;
+ (MBProgressHUD *)showFleetingMessage:(NSString *)message image:(UIImage *)image;

- (void)showLoadingMessage:(NSString *)message;
- (void)showFleetingMessage:(NSString *)message;
- (void)showFleetingMessage:(NSString *)message image:(UIImage *)image;

@end
