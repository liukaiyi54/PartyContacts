//
//  NativeStub.m
//  PartyContacts
//
//  Created by Michael on 12/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "NativeStub.h"

@implementation NativeStub

- (JSValue *)evaluateScript:(NSString *)script {
    if (script.length == 0) {
        return nil;
    }
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    return [context evaluateScript:script];
}

- (void)invokeJSCallback:(NSString *)callback retCode:(NSInteger)retCode {
    [self invokeJSCallback:callback retCode:retCode dataArray:nil];
}

- (void)invokeJSCallback:(NSString *)callback retCode:(NSInteger)retCode dataArray:(NSArray *)dataArray {
    if (callback.length == 0) {
        return;
    }
    NSMutableString *js = [NSMutableString string];
    [js appendString:callback];
    [js appendString:@"("];
    [js appendString:[@(retCode) stringValue]];
    
    for (id data in dataArray) {
        if ([data isKindOfClass:[NSString class]]) {
            [js appendFormat:@", '%@'", data];
        } else {
            NSString *obj = [data mj_JSONString];
            [js appendFormat:@", %@", obj];
        }
    }
    [js appendString:@");"];
    [self evaluateScript:[js copy]];
}

@end
