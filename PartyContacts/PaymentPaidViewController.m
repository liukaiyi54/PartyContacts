//
//  PaymentPaidViewController.m
//  PartyContacts
//
//  Created by Michael on 09/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "PaymentPaidViewController.h"

#import "PaymentViewCell.h"

static NSString *const kPaymentViewCell = @"PaymentViewCell";

@interface PaymentPaidViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PaymentPaidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PaymentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPaymentViewCell];
    if (indexPath.row == 0) {
        cell.date = @"时间";
        cell.sum = @"金额";
        cell.showSelectButton = NO;
    } else {
        cell.date = [NSString stringWithFormat:@"2017年%ld月", indexPath.row+1];
        cell.sum = @"50元";
        cell.showSelectButton = NO;
    }
    return cell;
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kPaymentViewCell bundle:nil] forCellReuseIdentifier:kPaymentViewCell];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

@end
