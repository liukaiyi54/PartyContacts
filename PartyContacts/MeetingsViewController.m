//
//  MeetingsViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MeetingsViewController.h"
#import "WebViewController.h"

#import "MeetingViewCell.h"

static NSString *const kTableViewCellIdentifier = @"kTableViewCellIdentifier";
static NSString *const kMeetingViewCell = @"MeetingViewCell";

@interface MeetingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MeetingsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self setupTableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 94;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeetingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMeetingViewCell];
    if (indexPath.row == 0) {
        cell.priority = PriorityNormal;
        cell.title = @"关于选举党员支部大会";
        cell.sponser = @"吕伟";
        cell.date = @"2017.7.31";
        cell.status = @"即将进行";
        cell.isOutOfDate = NO;
    } else if (indexPath.row == 1) {
        cell.title = @"关于选举党员支部大会";
        cell.sponser = @"吕伟";
        cell.date = @"2017.7.31";
        cell.status = @"即将进行";
        cell.isOutOfDate = NO;
        cell.priority= PriorityImportant;
    } else {
        cell.title = @"关于选举党员支部大会";
        cell.sponser = @"吕伟";
        cell.date = @"2017.7.31";
        cell.status = @"已结束";
        cell.isOutOfDate = YES;
        cell.priority = PriorityEmergency;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WebViewController *webVC = [[WebViewController alloc] init];
//    webVC.url = [NSURL URLWithString:@"http://shuoke.autohome.com.cn/article/552749.html#pvareaid=101730"];
    webVC.url = [NSURL URLWithString:@"http://liukaiyi54.github.io/osx/2017/04/12/mosaic.html"];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kMeetingViewCell bundle:nil] forCellReuseIdentifier:kMeetingViewCell];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
