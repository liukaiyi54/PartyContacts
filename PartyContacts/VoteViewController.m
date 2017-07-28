//
//  VoteViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "VoteViewController.h"

#import "VoteTableViewCell.h"

static NSString *const kVoteTableViewCell = @"VoteTableViewCell";

@interface VoteViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation VoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"投票";
    [self setupTableView];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVoteTableViewCell];
    return cell;
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kVoteTableViewCell bundle:nil] forCellReuseIdentifier:kVoteTableViewCell];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
