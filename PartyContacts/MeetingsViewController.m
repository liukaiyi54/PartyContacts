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
@property (nonatomic, copy) NSArray *data;

@end

@implementation MeetingsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (instancetype)initWithData:(NSArray<MeetingCellModel *> *)data {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        self.data = [data copy];
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
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 94;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeetingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMeetingViewCell];
    
    MeetingCellModel *model = self.data[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WebViewController *webVC = [[WebViewController alloc] init];
//    webVC.url = [NSURL URLWithString:@"http://shuoke.autohome.com.cn/article/552749.html#pvareaid=101730"];
    webVC.url = [NSURL URLWithString:@"https://github.com/liukaiyi54/CheckList/blob/master/README.md"];
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
