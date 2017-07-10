//
//  HomePageViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomeService.h"
#import "InfinitePageView.h"
#import "Banner.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface HomePageViewController () <InfinitePageViewDataSource>

@property (nonatomic, copy) NSArray<Banner *> *banners;
@property (nonatomic, strong) InfinitePageView *pageView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"党支部通讯录";
    
    [self queryData];
    
    [self.view addSubview:self.pageView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
}

#pragma mark - dataSource
- (NSArray *)pageViews {
    NSMutableArray *views = [[NSMutableArray alloc] init];
    if (self.banners.count) {
        [self.banners enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Banner *banner = obj;
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:banner.photoUrl]];
            [views addObject:imageView];
        }];
    }
    return views;
}

- (void)queryData {
    __weak typeof(self) weakSelf = self;
    [[HomeService sharedManager] queryHomeBannersWithCompletion:^(NSArray *banners, NSError *error) {
        weakSelf.banners = [banners copy];
        [weakSelf.pageView reloadData];
    }];
}

- (InfinitePageView *)pageView {
    if (!_pageView) {
        _pageView = [[InfinitePageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _pageView.dataSource = self;
    }
    return _pageView;
}

@end
