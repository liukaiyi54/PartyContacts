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
    
    if (self.data.count == 0) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"暂无内容";
        [label sizeToFit];
        label.center = CGPointMake(self.view.center.x, self.view.center.y-40);
        label.textColor = UIColorFromRGB(0x999999);
        [self.view addSubview:label];
    }
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
    
    if ([self.title isEqualToString:@"党课"]) {
        WebViewController *webVC = [[WebViewController alloc] init];
        NSString *path = nil;
        if (indexPath.row == 0) {
            path = [[NSBundle mainBundle] pathForResource:@"article1" ofType:@"html"];
        } else if (indexPath.row == 1) {
            path = [[NSBundle mainBundle] pathForResource:@"article2" ofType:@"html"];
        } else if (indexPath.row == 2) {
            path = [[NSBundle mainBundle] pathForResource:@"article3" ofType:@"html"];
        } else if (indexPath.row == 3) {
            path = [[NSBundle mainBundle] pathForResource:@"article4" ofType:@"html"];
        }
        webVC.path = path;
        [self.navigationController pushViewController:webVC animated:YES];
    }
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kMeetingViewCell bundle:nil] forCellReuseIdentifier:kMeetingViewCell];
    
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

@end
