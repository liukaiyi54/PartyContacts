//
//  MeetingViewCell.m
//  PartyContacts
//
//  Created by Michael on 08/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MeetingViewCell.h"

@interface MeetingViewCell()
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sponserLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *outOfDateImageView;

@end

@implementation MeetingViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    self.titleLabel.text = _title;
}

- (void)setPriority:(MeetingPriority)priority {
    switch (priority) {
        case PriorityNormal:
            self.priorityLabel.text = @"[一般]";
            self.priorityLabel.textColor = UIColorFromRGB(0x151515);
            break;
        case PriorityImportant:
            self.priorityLabel.text = @"[重要]";
            self.priorityLabel.textColor = UIColorFromRGB(0xDF3031);
            break;
        case PriorityEmergency:
            self.priorityLabel.text = @"[紧急]";
            self.priorityLabel.textColor = UIColorFromRGB(0xDF3031);
            break;
            
        default:
            break;
    }
}

- (void)setSponser:(NSString *)sponser {
    _sponser = [sponser copy];
    self.sponserLabel.text = _sponser;
}

- (void)setDate:(NSString *)date {
    _date = [date copy];
    self.dateLabel.text = _date;
}

- (void)setIsOutOfDate:(BOOL)isOutOfDate {
    _isOutOfDate = isOutOfDate;
    if (_isOutOfDate) {
        self.outOfDateImageView.hidden = NO;
        self.priorityLabel.textColor = UIColorFromRGB(0x999999);
        self.titleLabel.textColor = UIColorFromRGB(0x999999);
    } else {
        self.outOfDateImageView.hidden = YES;
        self.titleLabel.textColor = UIColorFromRGB(0x151515);
        self.priorityLabel.textColor = self.priority == PriorityNormal ? UIColorFromRGB(0x151515) : UIColorFromRGB(0xDF3031);
    }
}

- (void)setStatus:(NSString *)status {
    _status = [status copy];
    self.statusLabel.text = _status;
}

@end
