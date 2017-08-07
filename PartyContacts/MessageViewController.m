//
//  MessageViewController.m
//  PartyContacts
//
//  Created by Michael on 26/06/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息";
    [self setupViews];
    [self connectRongIM];
    
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *vc = [[RCConversationViewController alloc] init];
    vc.conversationType = model.conversationType;
    vc.targetId = model.targetId;
    vc.title = @"聊天";
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didTapAdd:(UIBarButtonItem *)sender {
    RCConversationViewController *vc = [[RCConversationViewController alloc] init];
    vc.conversationType = ConversationType_PRIVATE;
    vc.targetId = @"userId1";
    vc.title = @"聊天";
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupViews {
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xDF3031);
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    self.conversationListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)connectRongIM {
    [[RCIM sharedRCIM] connectWithToken:@"v+gklNioiuJYvNmNtiKH9yN3jASvDhcbCbuazT3jchA88DZELMHqeaozzghAVttEMxf0Uv0198aE5FEf/S6b3g==" success:^(NSString *userId) {
        NSLog(@"success %@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"connect error");
    } tokenIncorrect:^{
        NSLog(@"token error");
    }];
}

@end
