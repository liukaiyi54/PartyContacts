//
//  PaymentUnpaidViewController.m
//  PartyContacts
//
//  Created by Michael on 09/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "PaymentUnpaidViewController.h"

#import "PaymentViewCell.h"

static NSString *const kPaymentViewCell = @"PaymentViewCell";

@interface PaymentUnpaidViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PaymentUnpaidViewController

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
        cell.date = @"2017.7.18";
        cell.sum = @"10元";
        cell.showSelectButton = YES;
    }
    return cell;
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kPaymentViewCell bundle:nil] forCellReuseIdentifier:kPaymentViewCell];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH-40, 44*4) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.allowsSelection = NO;
        _tableView.layer.cornerRadius = 4.0f;
        _tableView.layer.borderWidth = 1.0f;
        _tableView.layer.borderColor = UIColorFromRGB(0xd8d8d8).CGColor;
    }
    return _tableView;
}

@end
