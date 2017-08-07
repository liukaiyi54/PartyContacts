//
//  TabBarViewController.m
//  PartyContacts
//
//  Created by Michael on 07/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

+ (void)initialize {
    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor flatRedColor]} forState:UIControlStateSelected];

    [[UITabBar appearance] setTintColor:[UIColor flatRedColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        for (UITabBarItem *tbi in self.tabBar.items) {
            tbi.image = [tbi.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
}

@end
