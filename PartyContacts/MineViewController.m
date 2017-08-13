//
//  MineViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MineViewController.h"

#import "HeaderView.h"

static NSString *const kTableViewCellIdentifier = @"kTableViewCellIdentifier";

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HeaderView *headerView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
    self.navigationController.navigationBarHidden = YES;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    [self.view addSubview:self.tableView];
    
    [self setupTableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kTableViewCellIdentifier];
    cell.userInteractionEnabled = NO;
    
    cell.textLabel.text = [self titles][indexPath.row];
    cell.detailTextLabel.text = [self fakes][indexPath.row];
    
    return cell;
}

#pragma mark - private
- (void)setupTableView {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifier];
    self.tableView.tableHeaderView = self.headerView;
}

#pragma mark - getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.rowHeight = 60;
    }
    return _tableView;
}

- (HeaderView *)headerView {
    if (!_headerView) {
        _headerView = [HeaderView loadInstanceFromNib];
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/1.7);
//        _headerView.photoUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1064702232,2761286487&fm=175&s=D93A66DA74F3B1C00A84870C0300F0D6&w=550&h=447&img.JPEG";
    }
    return _headerView;
}

- (NSArray *)titles {
    return @[@"姓名", @"所属支部", @"党龄", @"民族"];
}

- (NSArray *)fakes {
    return @[@"曾小箭", @"中移互联网有限公司党支部", @"10年", @"汉族"];
}

@end
