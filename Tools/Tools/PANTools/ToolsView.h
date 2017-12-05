//
//  ToolsView.h
//  Tools
//
//  Created by 潘振权 on 2017/12/5.
//  Copyright © 2017年 潘振权. All rights reserved.
//

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
@end
