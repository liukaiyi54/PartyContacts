//
//  URLUtils.h
//  PartyContacts
//
//  Created by Michael on 04/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLUtils : NSObject

+ (NSURL *)normalizedURLWithURI:(NSString *)uri;
+ (NSURL *)normalizedURLWithURI:(NSString *)uri params:(NSDictionary *)params;

@end
