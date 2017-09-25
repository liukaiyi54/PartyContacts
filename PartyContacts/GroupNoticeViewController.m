//
//  GroupNoticeViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "GroupNoticeViewController.h"
#import "DemoViewController.h"

#import "NoticeViewCell.h"

static NSString *const kNoticeViewCell = @"NoticeViewCell";
@interface GroupNoticeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GroupNoticeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"群通知";
    
    [self setupTableView];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 76;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoticeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNoticeViewCell];
    if (indexPath.row == 0) {
        cell.title = @"请各位周四前完成整治测试题目。";
        cell.date = @"上午9点30";
    }
    if (indexPath.row == 1) {
        cell.title = @"补充党员基本信息";
        cell.date = @"上午9点30";
    }
    if (indexPath.row == 2) {
        cell.title = @"紧急&重要！【反腐倡廉教育月】必修课程";
        cell.date = @"6月7日";
    }
    if (indexPath.row == 3) {
        cell.title = @"全员政治面貌排查";
        cell.date = @"5月12日";
    }
    cell.sponser = @"吕伟";
    if (indexPath.row < 3) {
        cell.showRedDot = YES;
    } else {
        cell.showRedDot = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DemoViewController *vc = [[DemoViewController alloc] init];
    vc.index = 1;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kNoticeViewCell bundle:nil] forCellReuseIdentifier:kNoticeViewCell];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}


@end
