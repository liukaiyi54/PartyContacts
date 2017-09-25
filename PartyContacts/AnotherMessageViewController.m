
//
//  AnotherMessageViewController.m
//  PartyContacts
//
//  Created by Michael on 13/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "AnotherMessageViewController.h"
#import "GroupNoticeViewController.h"
#import "DemoViewController.h"

#import "MessageTableViewCell.h"

#import <RongIMKit/RongIMKit.h>

static NSString *const kMessageTableViewCell = @"MessageTableViewCell";

@interface AnotherMessageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AnotherMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息";
    
    [self setupTableView];
    [self setupViews];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMessageTableViewCell];
    cell.image = [UIImage imageNamed:@"灰色多人默认头像"];
    if (indexPath.row == 0) {
        cell.title = @"通知";
        cell.detail = @"吕伟：11点召开支部大会消息";
        cell.image = [UIImage imageNamed:@"通知头像"];
    }
    if (indexPath.row == 1) {
        cell.title = @"提醒";
        cell.detail = @"您有五月份党费未缴纳，请缴纳";
        cell.image = [UIImage imageNamed:@"提醒头像"];
    }
    if (indexPath.row == 2) {
        cell.title = @"支部大会";
        cell.detail = @"曹阳：收到了，马上过来啦";
    }
    if (indexPath.row == 3) {
        cell.title = @"党部委员会";
        cell.detail = @"黄鹤羽：已在小组内发布通知";
    }
    if (indexPath.row == 4) {
        cell.title = @"党小组会";
        cell.detail = @"曾小箭：已经完成学习进度了";
    }
    if (indexPath.row == 5) {
        cell.title = @"清远支教";
        cell.detail = @"谭嘉妍：本次组织活动不错哈";
    }
    if (indexPath.row == 6) {
        cell.title = @"党课";
        cell.detail = @"贺小红：党课进度有点不太正常";
    }
    if (indexPath.row == 7) {
        cell.title = @"延安精神";
        cell.detail = @"万倩茹：延安真是个建党的好地方";
    }
    
    return cell;
}

- (void)setupViews {
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xDF3031);
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kMessageTableViewCell bundle:nil] forCellReuseIdentifier:kMessageTableViewCell];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-48) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        return;
    }
    if (indexPath.row == 0) {
        GroupNoticeViewController *vc = [[GroupNoticeViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 2){
        DemoViewController *vc = [[DemoViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
