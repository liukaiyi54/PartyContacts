//
//  HomeService.h
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "BaseService.h"

typedef void(^QueryBannersCompletionBlock)(NSArray *banners, NSError *error);

@interface HomeService : BaseService

+ (instancetype)sharedManager;

- (void)queryHomeBannersWithCompletion:(QueryBannersCompletionBlock)completion;

@end
