//
//  NativeStub.h
//  PartyContacts
//
//  Created by Michael on 12/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface NativeStub : NSObject

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) UIWebView *webView;

- (JSValue *)evaluateScript:(NSString *)script;
- (void)invokeJSCallback:(NSString *)callback retCode:(NSInteger)retCode;
- (void)invokeJSCallback:(NSString *)callback retCode:(NSInteger)retCode dataArray:(NSArray *)dataArray;

@end
