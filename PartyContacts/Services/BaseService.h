//
//  BaseService.h
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ErrorHandlerCompletion)(NSError *error);

@interface BaseService : NSObject

@property (nonatomic, strong) NSMutableArray *allServices;

- (void)removeAllServices;

@end
