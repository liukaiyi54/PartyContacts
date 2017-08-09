//
//  NoticeViewCell.h
//  PartyContacts
//
//  Created by Michael on 09/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticeViewCell : UITableViewCell

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sponser;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, assign) BOOL showRedDot;

@end
