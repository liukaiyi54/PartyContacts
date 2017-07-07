//
//  ServerAPIResponse.h
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerAPIResponse : NSObject

@property (nonatomic, assign, readonly) NSInteger code;
@property (nonatomic, copy, readonly) NSString *message;
@property (nonatomic, strong, readonly) id data;
@property (nonatomic, assign, readonly) BOOL success;

- (instancetype)initWithDictionary:(NSDictionary *)dict NS_DESIGNATED_INITIALIZER;

@end

@interface ServerAPIResponse(Error)

- (NSString *)errorMessage;
- (NSError *)error;

+ (instancetype)responseForNetworkErrorWithMessage:(NSString *)message;
+ (instancetype)responseForMalformedResponseErrorWithMessage:(NSString *)message;

@end
