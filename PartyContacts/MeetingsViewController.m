//
//  MeetingsViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MeetingsViewController.h"
#import "WebViewController.h"

static NSString *const kTableViewCellIdentifier = @"kTableViewCellIdentifier";

@interface MeetingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MeetingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 16, 80, 40)];
    if (section == 0) {
        label.text = @"2017年7月";
    }
    if (section == 1) {
        label.text = @"2017年5月";
    }
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kTableViewCellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld日", indexPath.row+7];
    cell.detailTextLabel.text = indexPath.row % 2 == 0 ? @"A会议" : @"B会议";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.url = [NSURL URLWithString:@"http://shuoke.autohome.com.cn/article/552749.html#pvareaid=101730"];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

@end
