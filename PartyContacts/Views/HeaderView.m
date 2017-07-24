//
//  HeaderView.m
//  PartyContacts
//
//  Created by Michael on 24/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "HeaderView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HeaderView()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation HeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.avatarImageView addGestureRecognizer:tap];
}

- (void)setPhotoUrl:(NSString *)photoUrl {
    _photoUrl = [photoUrl copy];
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:_photoUrl]];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:_photoUrl]];
}

- (void)tapAction {
    if ([self.delegate respondsToSelector:@selector(headerViewDidTapAvatar:)]) {
        [self.delegate headerViewDidTapAvatar:self];
    }
}

@end
