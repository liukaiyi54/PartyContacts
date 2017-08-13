//
//  VoteViewCell.m
//  PartyContacts
//
//  Created by Michael on 10/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "VoteViewCell.h"

@interface VoteViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *sponserLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation VoteViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    self.titleLabel.text = _title;
}

- (void)setNumber:(NSString *)number {
    _number = [number copy];
    self.numLabel.text = _number;
}

- (void)setSponser:(NSString *)sponser {
    _sponser = [sponser copy];
    self.sponserLabel.text = _sponser;
}

- (void)setDate:(NSString *)date {
    _date = [date copy];
    self.dateLabel.text = _date;
}


@end
