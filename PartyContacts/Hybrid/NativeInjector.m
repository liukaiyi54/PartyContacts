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

@implementation NativeInjector

+ (void)injectNativeStubForWebView:(UIWebView *)webView {
    [self injectNativeStubForWebView:webView viewController:nil];
}

+ (void)injectNativeStubForWebView:(UIWebView *)webView viewController:(UIViewController *)viewController {
    JSContext *context = [self webViewJSContext:webView];
//    NSString *host = [self webViewHost:webView];
    
    NativeStub *stub = [self nativeStubForWebView:webView controller:viewController];
    
    __weak typeof(stub) weakStub = stub;
    NSMutableDictionary *partyContactsNative =
    [@{
       @"closeWebBrowser": ^() {
            [weakStub closeWebBrowser];
        },
       @"goBack": ^() {
            [weakStub goBack];
        }
    } mutableCopy];
    
    [context.globalObject setValue:[partyContactsNative copy] forProperty:@"partyContactsNative"];
}

+ (void)cleanNativeStubForWebView:(UIWebView *)webView {
    JSContext *context = [self webViewJSContext:webView];
    [context.globalObject setValue:nil forKey:@"partyContactsNative"];
    objc_setAssociatedObject(webView, kAssociatedNativeStubKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NativeStub *)nativeStubForWebView:(UIWebView *)webView {
    return [self nativeStubForWebView:webView controller:nil];
}

+ (NativeStub *)nativeStubForWebView:(UIWebView *)webView controller:(UIViewController *)controller {
    if (!webView) {
        return nil;
    }
    [self cleanNativeStubForWebView:webView];
    NativeStub *stub = [[NativeStub alloc] init];
    objc_setAssociatedObject(webView, kAssociatedNativeStubKey, stub, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    stub.webView = webView;
    stub.viewController = controller;
    return stub;
}

+ (JSContext *)webViewJSContext:(UIWebView *)webView {
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    return context;
}

+ (NSString *)webViewHost:(UIWebView *)webView {
    NSString *host = [webView stringByEvaluatingJavaScriptFromString:@"document.domain"];
    return host;
}

@end
