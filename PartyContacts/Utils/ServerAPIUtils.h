//
//  ServerAPIUtils.h
//  PartyContacts
//
//  Created by Michael on 05/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"
#import "ServerAPIResponse.h"

typedef void(^ServerAPICompletion) (ServerAPIResponse *reponse);
typedef void(^UploadFileCompletion) (NSString *fileDownloadUrl, NSError *error);

@interface ServerAPIUtils : NSObject

+ (NSURLSessionDataTask *)doRequest:(BaseRequest *)request completion:(ServerAPICompletion)completion;
+ (NSURLSessionDataTask *)sendJSON:(NSString *)json toURL:(NSURL *)url completion:(ServerAPICompletion)completion;
+ (NSURLSessionDataTask *)sendGETToURL:(NSURL *)url completion:(ServerAPICompletion)completion;
+ (NSURLSessionDataTask *)uploadData:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType completion:(UploadFileCompletion)completion;

+ (void)cancelAllRequests;

@end
