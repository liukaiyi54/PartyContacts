//
//  NoticeViewCell.m
//  PartyContacts
//
//  Created by Michael on 09/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "NoticeViewCell.h"

@interface NoticeViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *redDotImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sponserLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation NoticeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    self.titleLabel.text = _title;
}

- (void)setSponser:(NSString *)sponser {
    _sponser = [sponser copy];
    self.sponserLabel.text = _sponser;
}

- (void)setDate:(NSString *)date {
    _date = [date copy];
    self.dateLabel.text = _date;
}

- (void)setShowRedDot:(BOOL)showRedDot {
    _showRedDot = showRedDot;
    self.redDotImageView.hidden = !_showRedDot;
}

@end
