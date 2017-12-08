//
//  ToolsView.h
//  Tools
//
//  Created by 潘振权 on 2017/12/5.
//  Copyright © 2017年 潘振权. All rights reserved.
//  UIView相关方法

#import <UIKit/UIKit.h>

@interface ToolsView : UIView

/**
 图片压缩到200K

 @param image 需要压缩的图片
 @return 压缩后的图片
 */
- (UIImage *)scaleFromImage:(UIImage *)image;

/**
 将彩色图片换成黑白图片

 @param image 彩色图片
 @param frame 图片大小
 @return 黑白图片
 */
- (UIImage*)changeImageColor:(UIImage*)image imageViewFrame:(CGRect)frame;

/**
 将label中手机号码颜色变化

 @param label 传入的文本框
 @param labelColor 手机号码需要变化的颜色
 */
- (void)matchingPhoneNumber:(UILabel *)label color:(UIColor *)labelColor;

@end
