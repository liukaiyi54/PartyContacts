//
//  HeaderView.h
//  PartyContacts
//
//  Created by Michael on 24/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeaderView;
@protocol HeaderViewDelegate <NSObject>

- (void)headerViewDidTapAvatar:(HeaderView *)headerView;

@end

@interface HeaderView : UIView

@property (nonatomic, copy) NSString *photoUrl;

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

@end
