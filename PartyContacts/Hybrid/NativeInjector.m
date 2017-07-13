//
//  NativeInjector.m
//  PartyContacts
//
//  Created by Michael on 11/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "NativeInjector.h"
#import "NativeStub.h"
#import "NativeStub+Navigation.h"
#import <JavaScriptCore/JavaScriptCore.h>

static const void *const kAssociatedNativeStubKey = &kAssociatedNativeStubKey;
static NSString *const kNativeProperty = @"partyContactsNative";

@implementation NativeInjector

+ (void)injectNativeStubForWebView:(UIWebView *)webView {
    [self injectNativeStubForWebView:webView viewController:nil];
}

+ (void)injectNativeStubForWebView:(UIWebView *)webView viewController:(UIViewController *)viewController {
    // get JSContext from UIWebView instance
    JSContext *context = [self webviewJSContext:webView];
    
    // 给 window 对象增加一个属性 cloudoorNative，用于 js 调用objc代码
    NativeStub *native = [self nativeStubForWebView:webView controller:viewController];
    
    __weak typeof(native) weakNative = native;
    NSMutableDictionary *partyContactsNative =
    [@{
       @"closeWebBrowser": ^() {
            [weakNative closeWebBrowser];
        },
       @"goBack": ^() {
            [weakNative goBack];
        }
       } mutableCopy];
    
    [context.globalObject setValue:[partyContactsNative copy] forProperty:kNativeProperty];
}

+ (void)cleanNativeStubForWebView:(UIWebView *)webView {
    JSContext *context = [self webviewJSContext:webView];
    [context.globalObject setValue:nil forProperty:kNativeProperty];
    objc_setAssociatedObject(webView, kAssociatedNativeStubKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NativeStub *)nativeStubForWebView:(UIWebView *)webView {
    return [self nativeStubForWebView:webView controller:nil];
}

+ (NativeStub *)nativeStubForWebView:(UIWebView *)webView controller:(UIViewController *)controller{
    if (!webView) {
        return nil;
    }
    
    [self cleanNativeStubForWebView:webView];
    
    NativeStub *native = [[NativeStub alloc] init];
    objc_setAssociatedObject(webView, kAssociatedNativeStubKey, native, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    native.webView = webView;
    native.viewController = controller;
    return native;
}

+ (JSContext *)webviewJSContext:(UIWebView *)webView {
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    return context;
}

+ (NSString *)webviewHost:(UIWebView *)webView {
    NSString *host = [webView stringByEvaluatingJavaScriptFromString:@"document.domain"];
    return host;
}

@end
