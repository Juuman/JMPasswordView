//
//  JMPasswordView.h
//  JuumanUIKITDemo
//
//  Created by juuman on 14-9-22.
//  Copyright (c) 2014年 juuman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMPasswordLineLayer.h"

#define jmPointRadius 30.0//圆半径
#define jmPointBorderWidth 1.0//圆边框宽
#define jmSmallPointRadius 6.0//小圆半径
#define jmPointLeftMargin 20.0//起始margin
#define jmPointTopMargin 20.0//起始margin
#define jmPointBetweenMargin 40.0//间隔*2
#define jmPathWidth 12.0//线宽
#define jmPasswordMinLength 4//最短密码

#define jmPasswordPointColor [UIColor colorWithRed:50.0/255.0 green:200.0/255.0 blue:50.0/255.0 alpha:0.4]//圆颜色
#define jmPasswordPointBorderColor [UIColor grayColor]//圆框颜色
#define jmPasswordSmallPointColor [UIColor colorWithRed:50.0/255.0 green:145/255.0 blue:60.0/255.0 alpha:1]//小圆颜色
#define jmPasswordPointHighlightColor [UIColor orangeColor]//圆高亮色
#define jmPasswordPointBorderHighlightColor [UIColor redColor]//圆框高亮色
#define jmPasswordSmallPointHighlightColor [UIColor colorWithRed:1 green:0.0 blue:0.0 alpha:1]//小圆高亮色
#define jmPasswordLineColor [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.4]//线颜色

//密码状态
typedef enum ePasswordSate {
    ePasswordUnset,//未设置
    ePasswordRepeat,//重复输入
    ePasswordRepeatError,//重复输入出错
    ePasswordExist,//密码存在
    ePasswordError,//密码输入错误
    ePasswordSuccess//密码输入正确
}ePasswordSate;

@class JMPasswordView;
@protocol JMPasswordViewDelegate <NSObject>
#pragma mark - 输入完回掉
- (void)JMPasswordView:(JMPasswordView *)passwordView withPassword:(NSString*)password;
@end


@interface JMPasswordView : UIView{
}
@property (nonatomic,weak) id<JMPasswordViewDelegate> delegate;
@property (nonatomic,strong) NSMutableArray* pointArr;
@property (nonatomic,strong) JMPasswordLineLayer *pathLayer;

@property(nonatomic,strong)NSMutableArray *pointIDArr;//当前已输的密码
@property(nonatomic)CGPoint nowTouchPoint;//当前位置

@end
