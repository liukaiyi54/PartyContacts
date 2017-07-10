//
//  DeviceUtils.h
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceUtils : NSObject

+ (NSString *)macString;
+ (NSString *)idfaString;
+ (NSString *)idfvString;
+ (BOOL)hasCellularCoverage;
+ (NSString *)userAgent;
+ (NSString *)modelName;

@end
