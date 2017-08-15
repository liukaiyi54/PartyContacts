//
//  MessageTableViewCell.m
//  PartyContacts
//
//  Created by Michael on 07/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MessageTableViewCell.h"

@interface MessageTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end

@implementation MessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.avatarImageView.layer.cornerRadius = 20.f;
    self.avatarImageView.clipsToBounds = YES;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.avatarImageView.image = _image;
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    self.titleLabel.text = _title;
}

- (void)setDetail:(NSString *)detail {
    _detail = [detail copy];
    self.detailLabel.text = _detail;
}

- (IBAction)didTapSelect:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)setShowSelectButton:(BOOL)showSelectButton {
    _showSelectButton = showSelectButton;
    _selectButton.hidden = !_showSelectButton;
}

@end
