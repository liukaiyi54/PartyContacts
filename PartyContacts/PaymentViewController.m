//
//  PaymentViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "PaymentViewController.h"
#import "PaymentUnpaidViewController.h"
#import "PaymentPaidViewController.h"
#import "CAPSPageMenu.h"

static NSString *const kTableViewCellIdentifier = @"kTableViewCellIdentifier";

@interface PaymentViewController ()

@property (nonatomic, strong) CAPSPageMenu *pageMenu;

@end

@implementation PaymentViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"党费缴纳";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xDF3031);
    
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
        PaymentUnpaidViewController *partyVC = [[PaymentUnpaidViewController alloc] init];
        partyVC.title = @"未缴";
        PaymentPaidViewController *localVC = [[PaymentPaidViewController alloc] init];
        localVC.title = @"已缴";
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
                                     CAPSPageMenuOptionBottomMenuHairlineColor: UIColorFromRGB(0x999999),
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
