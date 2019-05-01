//
//  UIView+Category.h
//  Tools
//
//  Created by 潘振权 on 2017/12/8.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

/**
 根据XIB创建UIView

 @return 创建的View
 */
+ (id) creatFromNib;
/**
 寻找当前View的父窗口

 @return View的控制器
 */
- (UIViewController *) parentVC;
@end
