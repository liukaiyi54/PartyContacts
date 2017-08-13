//
//  MeetingViewCell.h
//  PartyContacts
//
//  Created by Michael on 08/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PriorityNormal,
    PriorityImportant,
    PriorityEmergency,
} MeetingPriority;

@interface MeetingCellModel : NSObject

@property (nonatomic, assign) MeetingPriority priority;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sponser;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, assign) BOOL isOutOfDate;

@end

@interface MeetingViewCell : UITableViewCell

@property (nonatomic, strong) MeetingCellModel *model;

@end
