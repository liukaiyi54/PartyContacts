//
//  WebViewController.m
//  PartyContacts
//
//  Created by Michael on 12/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "WebViewController.h"
#import "NativeInjector.h"

@interface WebViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@end

@implementation WebViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupDefaultValue];
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    [self loadWebView];
}

#pragma mark - UIWebViewDelegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [NativeInjector cleanNativeStubForWebView:webView];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [NativeInjector cleanNativeStubForWebView:webView];
    self.navigationItem.rightBarButtonItems = nil;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.indicator stopAnimating];
    
    if (self.exportNativeStub) {
        [NativeInjector injectNativeStubForWebView:webView viewController:self];
        NSString *checkJSFuncExists = @"typeof(onNativeInited) === \'function\'";
        NSString *ret = [webView stringByEvaluatingJavaScriptFromString:checkJSFuncExists];
        if ([ret isEqualToString:@"true"]) {
            NSString *invokeInitedJSFunc = @"onNativeInited();";
            [webView stringByEvaluatingJavaScriptFromString:invokeInitedJSFunc];
        }
    }
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = title;
}

#pragma mark - private
- (void)setupDefaultValue {
    _exportNativeStub = YES;
}

- (void)setupViews {
    [self.view addSubview:self.webView];
    [self.view addSubview:self.indicator];
    [self.indicator autoCenterInSuperview];
}

- (void)loadWebView {
    [self.indicator startAnimating];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"html"];
    NSString *oldHtml = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *asdf = [[NSBundle mainBundle] bundlePath];


    [self.webView loadHTMLString:oldHtml baseURL:[NSURL fileURLWithPath:asdf]];
}

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _webView.delegate = self;
    }
    return _webView;
}

- (UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _indicator;
}

@end
