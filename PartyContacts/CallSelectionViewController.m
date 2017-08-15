//
//  CallSelectionViewController.m
//  PartyContacts
//
//  Created by Michael on 14/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "CallSelectionViewController.h"

#import "MessageTableViewCell.h"

static NSString *const kMessageTableViewCell = @"MessageTableViewCell";

@interface CallSelectionViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CallSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(didTapCancel:)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"拨打" style:UIBarButtonItemStylePlain target:self action:@selector(didTapCall:)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self setupTableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self contacts].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMessageTableViewCell];
    cell.showSelectButton = YES;
    cell.image = [UIImage imageNamed:@"灰色多人默认头像"];
    
    cell.title = [self contacts].allKeys[indexPath.row];
    cell.detail = [self contacts].allValues[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didTapCancel:(UIBarButtonItem *)item {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didTapCall:(UIBarButtonItem *)item {
    
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kMessageTableViewCell bundle:nil] forCellReuseIdentifier:kMessageTableViewCell];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (NSDictionary *)contacts {
    return @{
             @"杨正铃":@"13802885250",
             @"王绮媛":@"13802883479",
             @"黄鹤羽	":@"13902220107",
             @"贺小红	":@"13802881053",
             @"曾小箭	":@"13802881757",
             @"谭嘉妍	":@"13802882927",
             @"万倩茹	":@"13802882776",
             @"曹阳":@"13802880581",
             @"丁小波	":@"13902220461",
             @"张炜东	":@"13802883460",
             @"陈德志	":@"13802885221",
             @"欧伯武	":@"13802885101",
             @"黄浩":@"13802885391"};
}

@end
