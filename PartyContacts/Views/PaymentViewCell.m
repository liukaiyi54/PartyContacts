//
//  PaymentViewCell.m
//  PartyContacts
//
//  Created by Michael on 09/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "PaymentViewCell.h"

@interface PaymentViewCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end

@implementation PaymentViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)didTapSelect:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)setDate:(NSString *)date {
    _date = [date copy];
    self.dateLabel.text = _date;
}

- (void)setSum:(NSString *)sum {
    _sum = [sum copy];
    self.moneyLabel.text = _sum;
}

- (void)setShowSelectButton:(BOOL)showSelectButton {
    _showSelectButton = showSelectButton;
    self.selectButton.hidden = !_showSelectButton;
}


@end
