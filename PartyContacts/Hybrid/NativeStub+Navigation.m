//
//  NativeStub+Navigation.m
//  PartyContacts
//
//  Created by Michael on 12/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "NativeStub+Navigation.h"
#import <objc/runtime.h>

static const void *const kNavButtonCallbackAssociatedKey = &kNavButtonCallbackAssociatedKey;

@implementation NativeStub (Navigation)

- (void)closeWebBrowser {
    WeakSelf;
    void (^closeBlock)() = ^() {
        if (weakSelf.viewController.presentingViewController) {
            [weakSelf.viewController dismissViewControllerAnimated:YES completion:nil];
            return;
        }
        
        UINavigationController *navController = weakSelf.viewController.navigationController;
        if (navController.viewControllers.count > 0 && [navController.viewControllers lastObject] == weakSelf.viewController) {
            [navController popViewControllerAnimated:YES];
        }
    };
    DISPATCH_MAIN_SAFE_ASYNC(closeBlock);
}

- (void)goBack {
    WeakSelf;
    void (^goBackBlock)() = ^() {
        if (weakSelf.webView.canGoBack) {
            [weakSelf.webView goBack];
        } else {
            [weakSelf closeWebBrowser];
        }
    };
    DISPATCH_MAIN_SAFE_ASYNC(goBackBlock);
}

@end
