//
//  ViewController.m
//  Block
//
//  Created by chenlishuang on 16/8/15.
//  Copyright © 2016年 chenlishuang. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()<ChangeColorDelegate>
@property (nonatomic,strong)FirstViewController *firstVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstVC = [[FirstViewController alloc]init];
    self.firstVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2);
    self.firstVC.delegate = self;
    //block
    __weak typeof(self) wSelf = self;
    self.firstVC.changeBlock = ^(){
        wSelf.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    };
    [self.view addSubview:self.firstVC.view];
    
    //通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeViewColorNotification) name:@"changeColor" object:nil];
}
//代理方法
- (void)changeViewColor{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}
//通知方法
- (void)changeViewColorNotification{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}

@end
