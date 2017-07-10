//
//  HomePageViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomeService.h"

@interface HomePageViewController ()

@property (nonatomic, copy) NSArray *banners;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"党支部通讯录";
    
    [[HomeService sharedManager] queryHomeBannersWithCompletion:^(NSArray *banners, NSError *error) {
        self.banners = [banners copy];
    }];
}

@end
