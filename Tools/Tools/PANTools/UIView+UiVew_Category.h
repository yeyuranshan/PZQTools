//
//  UIView+UiVew_Category.h
//  tools
//
//  Created by 潘振权 on 2017/11/10.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UiVew_Category)
/**
 根据Xib生成View
 */
+ (id) creatFromNib;
/**
 查找View的父窗口
 */
- (UIViewController *) parentVC;
/**
 将View全屏显示在主窗口
 */
- (void) showInWindow;
/**
 设置label.text中13位数字显示为蓝色
 */
+ (void)matchingPhoneNumber:(UILabel *)label;
/**
 拷贝指定Label信息
 */

+ (void)copyTextInfomation:(UILabel *)label;
/**
 动态计算文字高度
 @prama width:显示单行宽度
 @prama font:字体大小
 @prama str:需要计算文字
 */
+ (CGFloat)heightWithWidth:(CGFloat)width font:(CGFloat)font str:(NSString *)string;

@end
