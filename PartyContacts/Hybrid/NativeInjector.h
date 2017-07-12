//
//  NativeInjector.h
//  PartyContacts
//
//  Created by Michael on 11/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NativeInjector : NSObject

+ (void)injectNativeStubForWebView:(UIWebView *)webView;
+ (void)injectNativeStubForWebView:(UIWebView *)webView viewController:(UIViewController *)viewController;
+ (void)cleanNativeStubForWebView:(UIWebView *)webView;

@end
