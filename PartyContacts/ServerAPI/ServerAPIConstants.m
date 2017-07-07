//
//  ServerAPIConstants.m
//  PartyContacts
//
//  Created by Michael on 03/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "ServerAPIConstants.h"

#if DEBUG
NSString *const kServerHostname = @"test.guiderank.org";
NSString *const kServerBaseURL = @"http://test.guiderank.org/guiderank-web";
#elif Beta
NSString *const kServerHostname = @"test.guiderank.org";
NSString *const kServerBaseURL = @"http://test.guiderank.org/guiderank-web";
#else
NSString *const kServerHostname = @"zone.guiderank.org";
NSString *const kServerBaseURL = @"http://zone.guiderank.org/guiderank-web";
#endif

const NSInteger kServerAPICodeSuccess = 1;
const NSInteger kServerAPICodeNetworkError = -1111;
const NSInteger kServerAPICodeCancelError = -999;
const NSInteger kServerAPICodeMalformedResponse = -11112;

const NSInteger kServerAPICodeIllegalParameters = -400;
const NSInteger kServerAPICodeAuthError = -401;
const NSInteger kServerAPICodeNotLoggedIn = -403;
const NSInteger kServerAPICodeCustomErrorMessage = -420;
const NSInteger kServerAPICodeServerError = -500;
