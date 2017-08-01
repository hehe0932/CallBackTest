//
//  FirstViewController.h
//  Block
//
//  Created by chenlishuang on 16/8/15.
//  Copyright © 2016年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ChangeBlock)();
@protocol ChangeColorDelegate <NSObject>

- (void)changeViewColor;

@end
@interface FirstViewController : UIViewController
@property (nonatomic,weak)id<ChangeColorDelegate> delegate;
@property (nonatomic,copy)ChangeBlock changeBlock;
@end
