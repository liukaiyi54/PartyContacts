//
//  PaymentViewController.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "PaymentViewController.h"

static NSString *const kTableViewCellIdentifier = @"kTableViewCellIdentifier";

@interface PaymentViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDelegea
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kTableViewCellIdentifier];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"时间";
        cell.detailTextLabel.text = @"未缴";
    } else {
        cell.textLabel.text = @"2017/6";
        cell.detailTextLabel.text = @"10";
    }
    return cell;
}

@end
