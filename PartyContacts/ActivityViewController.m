//
//  ActivityViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ActivityViewController.h"

#import "VoteViewCell.h"

static NSString *const kVoteViewCell = @"VoteViewCell";

@interface ActivityViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ActivityViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"活动";
    [self.view addSubview:self.tableView];
    [self setupTableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 94;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VoteViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVoteViewCell];
    if (indexPath.row == 0) {
        cell.date = @"2017.5.20";
        cell.number = @"已有12人报名";
        cell.sponser = @"吕伟";
        cell.title = @"2017年5月22日  公司端午户外徒步活动报名";
    } else {
        cell.date = @"2017.3.5";
        cell.number = @"已有15人报名";
        cell.sponser = @"吕伟";
        cell.title = @"关于收集\"三八妇女节系列活动名单\"";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kVoteViewCell bundle:nil] forCellReuseIdentifier:kVoteViewCell];
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
