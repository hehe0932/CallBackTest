//
//  FirstViewController.m
//  Block
//
//  Created by chenlishuang on 16/8/15.
//  Copyright © 2016年 chenlishuang. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.502 alpha:1.0];
    
    UIButton *delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delegateBtn.frame = CGRectMake(50, 50, 50, 50);
    [delegateBtn setTitle:@"代理" forState:UIControlStateNormal];
    [delegateBtn addTarget:self action:@selector(delegateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delegateBtn];
    
    UIButton *blockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    blockBtn.frame = CGRectMake(150, 50, 50, 50);
    [blockBtn setTitle:@"block" forState:UIControlStateNormal];
    [blockBtn addTarget:self action:@selector(blockBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockBtn];
    
    UIButton *notificationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    notificationBtn.frame = CGRectMake(50, 150, 50, 50);
    [notificationBtn setTitle:@"通知" forState:UIControlStateNormal];
    [notificationBtn addTarget:self action:@selector(notificationBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:notificationBtn];
    
    UIButton *hehe = [UIButton buttonWithType:UIButtonTypeCustom];
    hehe.frame = CGRectMake(150, 150, 150, 50);
    [hehe setTitle:@"不管用的" forState:UIControlStateNormal];
    [hehe addTarget:self action:@selector(hehe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hehe];
}
- (void)delegateAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeViewColor)]) {
        [self.delegate changeViewColor];
    }
}

- (void)blockBtnAction{
    self.changeBlock();
}

- (void)notificationBtnAction{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeColor" object:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)hehe{
    ViewController *vc = [[ViewController alloc]init];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    NSLog(@"这不管用");
}
@end
