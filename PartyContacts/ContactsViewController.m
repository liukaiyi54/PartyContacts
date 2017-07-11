//
//  ContactsViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"组织";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor flatRedColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
}

@end
