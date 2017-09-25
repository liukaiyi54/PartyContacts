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
    
    if (self.index == 0) {
        RCTextMessage *content = [RCTextMessage messageWithContent:@"收到了，我马上过来"] ;
        RCMessage *message = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_RECEIVE messageId:666 content:content];
        RCMessageModel *model = [[RCMessageModel alloc] initWithMessage:message];
        
        RCTextMessage *content2 = [RCTextMessage messageWithContent:@"大家好"] ;
        RCMessage *message2 = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_RECEIVE messageId:666 content:content2];
        RCMessageModel *model2 = [[RCMessageModel alloc] initWithMessage:message2];

        RCTextMessage *content3 = [RCTextMessage messageWithContent:@"好了"] ;
        RCMessage *message3 = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_SEND messageId:666 content:content3];
        RCMessageModel *model3 = [[RCMessageModel alloc] initWithMessage:message3];

        
        self.conversationDataRepository = [@[model2, model3, model] mutableCopy];
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_拨打线"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapCall:)];
        //    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"灰色多人默认头像"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapMember:)];
        self.navigationItem.rightBarButtonItems = @[item];
        
        self.title = @"群聊";
    }
    if (self.index == 1) {
        self.title = @"群通知";
        
        RCTextMessage *content1 = [RCTextMessage messageWithContent:@"部门内全体党员同志确认自己的政治面貌，如有民主党派或共青团员的请今天下班前反馈邮件。谢谢~"];
        RCMessage *message1 = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_RECEIVE messageId:6667 content:content1];
        RCMessageModel *model1 = [[RCMessageModel alloc] initWithMessage:message1];
        
        RCTextMessage *content2 = [RCTextMessage messageWithContent:@"各位同事大家好：根据集团公司要求，所有同事均需完成反腐倡廉教育月网上大学的学习（包括党员和非党员），还请未完成的同事尽快登录网上大学完成必修课程的学习~"];
        RCMessage *message2 = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_RECEIVE messageId:66678 content:content2];
        RCMessageModel *model2 = [[RCMessageModel alloc] initWithMessage:message2];

        RCTextMessage *content3 = [RCTextMessage messageWithContent:@"[紧急]敬请各位党员补全党员基本信息"];
        RCMessage *message3 = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_RECEIVE messageId:666789 content:content3];
        RCMessageModel *model3 = [[RCMessageModel alloc] initWithMessage:message3];

        RCTextMessage *content4 = [RCTextMessage messageWithContent:@"请已完成测试的同志反馈测试成绩，为保证部门完成进度，现进行分科室督促，烦请产品室所有党员同志于本周四完成该项测试，该项工作将列为部门考核内容，请全体党员同志按时保质完成，谢谢。祝好~"];
        RCMessage *message4 = [[RCMessage alloc] initWithType:ConversationType_GROUP targetId:@"123" direction:MessageDirection_RECEIVE messageId:6667899 content:content4];
        RCMessageModel *model4 = [[RCMessageModel alloc] initWithMessage:message4];

        self.conversationDataRepository = [@[model1, model2, model3, model4] mutableCopy];
    }
    

}

- (void)didTapCall:(id)sender {
    CallSelectionViewController *vc = [[CallSelectionViewController alloc] init];
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didTapMember:(id)sender {
    
}

@end
