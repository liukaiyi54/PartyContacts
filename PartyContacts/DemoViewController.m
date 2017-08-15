//
//  DemoViewController.m
//  PartyContacts
//
//  Created by Michael on 14/08/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "DemoViewController.h"
#import "PartyContactsViewController.h"
#import "BaseNavigationViewController.h"
#import "CallSelectionViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RCTextMessage *content = [RCTextMessage messageWithContent:@"收到了，我马上过来"] ;
    RCMessage *message = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_RECEIVE messageId:666 content:content];
    RCMessageModel *model = [[RCMessageModel alloc] initWithMessage:message];
    self.conversationDataRepository = [@[model] mutableCopy];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_拨打线"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapCall:)];
//    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"灰色多人默认头像"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapMember:)];
    self.navigationItem.rightBarButtonItems = @[item];
    
    self.title = @"群聊";
}

- (void)didTapCall:(id)sender {
    CallSelectionViewController *vc = [[CallSelectionViewController alloc] init];
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didTapMember:(id)sender {
    
}

@end
