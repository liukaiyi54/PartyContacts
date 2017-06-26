//
//  MainViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MainViewController.h"
#import "HomePageViewController.h"
#import "MessageViewController.h"
#import "ContactsViewController.h"
#import "MineViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.viewControllers = [self viewControllers];
}

- (NSArray *)viewControllers {
    return @[[HomePageViewController class], [MessageViewController class], [ContactsViewController class], [MineViewController class]];
}

@end
