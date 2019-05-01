//
//  AnimationKit.h
//  FullShareTop
//
//  Created by lqq on 17/3/28.
//  Copyright © 2017年 FSB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationKit : NSObject

/**
  永久闪烁的动画

 */
+(CABasicAnimation *)opacityForeverAnimation:(float)time;
@end
