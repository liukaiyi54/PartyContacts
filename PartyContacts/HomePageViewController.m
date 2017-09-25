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
    
    self.title = @"首页";
    
    [self queryData];
    [self configureCollectionView];
    
    [self.view addSubview:self.pageView];
    [self.view addSubview:self.collectionView];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xDF3031);
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
//    NSMutableArray *views = [[NSMutableArray alloc] init];
//    if (self.banners.count) {
//        [self.banners enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            Banner *banner = obj;
//            UIImageView *imageView = [[UIImageView alloc] init];
//            [imageView sd_setImageWithURL:[NSURL URLWithString:banner.photoUrl]];
//            [views addObject:imageView];
//        }];
//    }
//    return views;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"两学一做图片.png"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"广告图.png"]];
    return @[imageView, imageView2];
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
    cell.image = [UIImage imageNamed:[self images][indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MeetingsViewController *vc = [[MeetingsViewController alloc] init];
        vc.title = @"支部党员大会";
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        MeetingsViewController *vc = [[MeetingsViewController alloc] init];
        vc.title = @"支部委员会";
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2) {
        MeetingsViewController *vc = [[MeetingsViewController alloc] init];
        vc.title = @"党小组会";
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 3) {
        MeetingsViewController *vc = [[MeetingsViewController alloc] initWithData:[self partyCourses]];
        vc.title = @"党课";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 4) {
        PaymentViewController *vc = [[PaymentViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 5) {
        GroupNoticeViewController *vc = [[GroupNoticeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 6) {
        VoteViewController *vc = [[VoteViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 7) {
        ActivityViewController *vc = [[ActivityViewController alloc] init];
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

- (NSArray *)images {
    return @[@"支部党员大会图标", @"支部委员会图标", @"党小组会图标", @"党课图标", @"党课缴纳图标", @"群通知图标", @"投票图标", @"组织活动图标"];
}

- (NSArray *)partyCourses {
    MeetingCellModel *model1 = [[MeetingCellModel alloc] init];
    model1.title = @"融合通信事业部党支部反腐倡廉教育月";
    model1.sponser = @"胡文辉";
    model1.date = @"2017年4月17日";
    
    MeetingCellModel *model2 = [[MeetingCellModel alloc] init];
    model2.title = @"反腐倡廉教育月——网上大学学习";
    model2.sponser = @"吕炜";
    model2.date = @"2017年4月28日";
    
    MeetingCellModel *model3 = [[MeetingCellModel alloc] init];
    model3.title = @"央企领导人员违纪违法警示录（一）";
    model3.sponser = @"吕炜";
    model3.date = @"2017年7月28日";
    
    MeetingCellModel *model4 = [[MeetingCellModel alloc] init];
    model4.title = @"\"党工团发文\"关于开展党规党纪知识测试";
    model4.sponser = @"叶天宽";
    model4.date = @"2017年8月28日";
    model4.priority = PriorityImportant;
    
    return @[model1, model2, model3, model4];
}

@end
