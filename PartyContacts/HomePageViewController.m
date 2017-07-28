//
//  HomePageViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "HomePageViewController.h"
#import "GroupNoticeViewController.h"
#import "MeetingsViewController.h"
#import "VoteViewController.h"
#import "ActivityViewController.h"
#import "PaymentViewController.h"

#import "InfinitePageView.h"
#import "HomePageCollectionViewCell.h"
#import "WebViewController.h"
#import "Banner.h"

#import "HomeService.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *const kCollectionViewCell = @"kCollectionViewCell";
static CGFloat const kTabHeight = 50.0f;

@interface HomePageViewController () <InfinitePageViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) NSArray<Banner *> *banners;
@property (nonatomic, strong) InfinitePageView *pageView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"党支部通讯录";
    
    [self queryData];
    [self configureCollectionView];
    
    [self.view addSubview:self.pageView];
    [self.view addSubview:self.collectionView];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor flatRedColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - InfinitePageViewDataSource
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

#pragma mark - UICollectionViewDelegate & etc
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = SCREEN_WIDTH/3-0.5;
    CGFloat height = (SCREEN_HEIGHT-ceil(SCREEN_WIDTH/1.7)-kTabHeight-64)/3;
    return CGSizeMake(width, height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCell forIndexPath:indexPath];
    cell.name = [self names][indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row <= 3) {
        MeetingsViewController *vc = [[MeetingsViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 4) {
        PaymentViewController *vc = [[PaymentViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 5) {
        GroupNoticeViewController *vc = [[GroupNoticeViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 6) {
        VoteViewController *vc = [[VoteViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 7) {
        ActivityViewController *vc = [[ActivityViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - private
- (void)configureCollectionView {
    NSString *nibName = NSStringFromClass([HomePageCollectionViewCell class]);
    [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:kCollectionViewCell];
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
        CGFloat aspectRatio = 1.7;
        CGFloat height = ceilf(SCREEN_WIDTH/aspectRatio);
        _pageView = [[InfinitePageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
        _pageView.dataSource = self;
    }
    return _pageView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0.5f;
        layout.minimumInteritemSpacing = 0.5f;
        
        CGFloat height = ceil(SCREEN_WIDTH/1.7);
        CGRect frame = CGRectMake(0, height, SCREEN_WIDTH, SCREEN_HEIGHT-height-kTabHeight-64);
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = UIColorFromRGB(0xf8f8f8);
    }
    return _collectionView;
}

- (NSArray *)names {
    return @[@"支部党员大会", @"支部委员会", @"党小组会", @"党课", @"党费缴纳", @"群通知", @"投票", @"组织活动"];
}

@end
