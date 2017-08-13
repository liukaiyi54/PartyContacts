//
//  MeetingsViewController.h
//  PartyContacts
//
//  Created by Michael on 28/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeetingViewCell.h"

@interface MeetingsViewController : UIViewController

- (instancetype)initWithData:(NSArray<MeetingCellModel *> *)data;

@end
