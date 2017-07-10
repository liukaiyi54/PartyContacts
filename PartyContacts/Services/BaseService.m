//
//  BaseService.m
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

- (void)removeAllServices {
    [self.allServices enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSURLSessionDataTask *task = (NSURLSessionDataTask *)obj;
        [task cancel];
    }];
    [self.allServices removeAllObjects];
}

- (NSMutableArray *)allServices {
    if (!_allServices) {
        _allServices = [[NSMutableArray alloc] init];
    }
    return _allServices;
}

@end
