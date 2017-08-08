//
//  PartyContactsViewController.m
//  PartyContacts
//
//  Created by Michael on 11/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "PartyContactsViewController.h"

#import "MessageTableViewCell.h"

static NSString *const kMessageTableViewCell = @"MessageTableViewCell";

@interface PartyContactsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PartyContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"组织人员";
    
    [self setupTableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"支部领导";
    }
    return @"支部成员";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMessageTableViewCell];
    cell.image = [UIImage imageNamed:@"灰色个人默认头像"];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.title = @"书记：胡文辉";
            cell.detail = @"13422456789";
        }
        if (indexPath.row == 1) {
            cell.title = @"组织委员：叶天宽";
            cell.detail = @"13503049811";
        }
        if (indexPath.row == 2) {
            cell.title = @"宣传委员：杨汉坤";
            cell.detail = @"13825567663";
        }
    } else {
        cell.title = @"曹总";
        cell.detail = @"13802882135";
    }

    return cell;
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kMessageTableViewCell bundle:nil] forCellReuseIdentifier:kMessageTableViewCell];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(self.view.bounds)-154) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
