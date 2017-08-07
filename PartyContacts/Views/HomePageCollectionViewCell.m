//
//  HomePageCollectionViewCell.m
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "HomePageCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HomePageCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation HomePageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setName:(NSString *)name {
    _name = [name copy];
    self.label.text = _name;
}

- (void)setPhotoUrl:(NSString *)photoUrl {
    _photoUrl = [photoUrl copy];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_photoUrl]];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = _image;
}

@end
