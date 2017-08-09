//
//  PaymentViewCell.h
//  PartyContacts
//
//  Created by Michael on 09/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentViewCell : UITableViewCell

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *sum;
@property (nonatomic, assign) BOOL showSelectButton;

@end
