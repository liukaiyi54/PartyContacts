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

- (void)setModel:(MeetingCellModel *)model {
    _model = model;
    
    self.titleLabel.text = _model.title;
    switch (_model.priority) {
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
    self.sponserLabel.text = _model.sponser;
    self.dateLabel.text = _model.date;
    if (_model.isOutOfDate) {
        self.outOfDateImageView.hidden = NO;
        self.priorityLabel.textColor = UIColorFromRGB(0x999999);
        self.titleLabel.textColor = UIColorFromRGB(0x999999);
    } else {
        self.outOfDateImageView.hidden = YES;
        self.titleLabel.textColor = UIColorFromRGB(0x151515);
        self.priorityLabel.textColor = _model.priority == PriorityNormal ? UIColorFromRGB(0x151515) : UIColorFromRGB(0xDF3031);
    }
    self.statusLabel.text = _model.status;
}

@end

@implementation MeetingCellModel

@end
