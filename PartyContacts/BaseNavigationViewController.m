//
//  BaseNavigationViewController.m
//  PartyContacts
//
//  Created by Michael on 14/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationBar.barTintColor = UIColorFromRGB(0xDF3031);
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
}


@end
