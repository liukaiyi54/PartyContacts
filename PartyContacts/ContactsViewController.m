//
//  ContactsViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ContactsViewController.h"
#import "PartyContactsViewController.h"
#import "LocalContactsViewController.h"

#import "CAPSPageMenu.h"

@interface ContactsViewController ()

@property (nonatomic, strong) CAPSPageMenu *pageMenu;

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
    
    [self setupPageMenu];
}

- (void)setupPageMenu {
    [self.view addSubview:self.pageMenu.view];
}

- (CAPSPageMenu *)pageMenu {
    if (!_pageMenu) {
        PartyContactsViewController *partyVC = [[PartyContactsViewController alloc] init];
        partyVC.title = @"组织人员";
        LocalContactsViewController *localVC = [[LocalContactsViewController alloc] init];
        localVC.title = @"本地联系人";
        NSDictionary *parameters = @{CAPSPageMenuOptionMenuItemSeparatorWidth: @(0.5),
                                     CAPSPageMenuOptionSelectionIndicatorHeight: @(1.5),
                                     CAPSPageMenuOptionMenuHeight: @(44),
                                     CAPSPageMenuOptionMenuItemWidthBasedOnTitleTextWidth: @(YES),
                                     CAPSPageMenuOptionMenuItemFont: [UIFont systemFontOfSize:14],
                                     CAPSPageMenuOptionScrollMenuBackgroundColor: UIColorFromRGB(0xffffff),
                                     CAPSPageMenuOptionSelectionIndicatorColor: [UIColor flatRedColor],
                                     CAPSPageMenuOptionSelectedMenuItemLabelColor: [UIColor flatRedColor],
                                     CAPSPageMenuOptionUnselectedMenuItemLabelColor: UIColorFromRGB(0x999999),
                                     CAPSPageMenuOptionMenuItemSeparatorColor: UIColorFromRGB(0xe8e8e8),
                                     CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor clearColor],
                                     CAPSPageMenuOptionScrollAnimationDurationOnMenuItemTap: @(250),
                                     CAPSPageMenuOptionMenuMargin: @(36),
                                     CAPSPageMenuOptionICDMenuLeftMargin:@(20),
                                     CAPSPageMenuOptionUseMenuLikeSegmentedControl:@(YES),
                                     };
        _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:@[partyVC, localVC] frame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) options:parameters];
    }
    return _pageMenu;
}

@end
