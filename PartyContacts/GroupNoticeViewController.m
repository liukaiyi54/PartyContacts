//
//  GroupNoticeViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "GroupNoticeViewController.h"

#import "NoticeViewCell.h"

static NSString *const kNoticeViewCell = @"NoticeViewCell";
@interface GroupNoticeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GroupNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"群通知";
    
    [self setupTableView];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 76;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoticeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNoticeViewCell];
    cell.title = @"11点召开支部信息大会";
    cell.sponser = @"吕伟";
    cell.date = @"07-21";
    if (indexPath.row < 3) {
        cell.showRedDot = YES;
    } else {
        cell.showRedDot = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
