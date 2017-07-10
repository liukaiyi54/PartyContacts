//
//  HomeService.m
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "HomeService.h"
#import "BannerAPI.h"
#import "Banner.h"

@implementation HomeService

+ (instancetype)sharedManager {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initPrivate];
    });
    return instance;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"IllegalAccessException" reason:@"Use `+ (instancetype)sharedManager` instead" userInfo:nil];
}

- (instancetype)initPrivate {
    self = [super init];
    return self;
}

- (void)queryHomeBannersWithCompletion:(QueryBannersCompletionBlock)completion {
    [self queryHomeBannersIgnoreCache:NO completion:completion];
}

- (void)queryHomeBannersIgnoreCache:(BOOL)ignoreCache completion:(QueryBannersCompletionBlock)completion {
    BannerAPI *api = [[BannerAPI alloc] init];
    void (^convertDataToModelBlock)(ServerAPIResponse *) = ^(ServerAPIResponse *response) {
        NSArray *array = @[];
        if (response.success) {
            array = [[Banner mj_objectArrayWithKeyValuesArray:response.data[@"banners"]] copy];
        }
        if (completion) {
            completion(array, response.error);
        }
    };
    
    if (!ignoreCache && api.cacheResponse) {
        convertDataToModelBlock(api.cacheResponse);
    }
    [api doRequestWithCompletion:convertDataToModelBlock];
    
    [self.allServices addObject:api.dataTask];
}

@end
