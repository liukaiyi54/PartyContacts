//
//  VoteTableViewCell.m
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "VoteTableViewCell.h"

@interface VoteTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *voteTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *initiatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation VoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setVoteTitle:(NSString *)voteTitle {
    _voteTitle = [voteTitle copy];
    self.voteTitleLabel.text = _voteTitle;
}

- (void)setInitiator:(NSString *)initiator {
    _initiator = [initiator copy];
    self.initiatorLabel.text = _initiator;
}

- (void)setTime:(NSString *)time {
    _time = [time copy];
    self.timeLabel.text = _time;
}

@end
