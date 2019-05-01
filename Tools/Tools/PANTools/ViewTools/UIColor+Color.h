//
//  UIColor+Color.h
//  Tools
//
//  Created by 潘振权 on 2017/12/8.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor ()


/**
 以RGB模式设置颜色

 @param 255 R
 @param 255 G
 @param 255 B
 @return UIcolor
 */
#ifndef UIColorRGB   // e.g. UIColorRGB(255, 255, 255)
#define UIColorRGB(r, g, b)     [UIColor colorWithRed:((r) / 255.0f) green:((g) / 255.0f) blue:((b) / 255.0f) alpha:1]
#endif

/**
 以RGB模式设置颜色
 
 @param 255 R
 @param 255 G
 @param 255 B
 @param 1 A
 @return UIcolor
 */
#ifndef UIColorRGBA  // e.g. UIColorRGBA(255, 255, 255, 1)
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:((r) / 255.0f) green:((g) / 255.0f) blue:((b) / 255.0f) alpha:(a)]
#endif


/**
 以HSB模式设置颜色

 @param 0 H
 @param 1 S
 @param 0 B
 @return UIColor
 */
#ifndef UIColorHSB   // e.g. UIColorHSB(0, 1, 0, 0.5)
#define UIColorHSB(h, s, b)     [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:1]
#endif

/**
 以HSB模式设置颜色

 @param 1 H
 @param 0 S
 @param 0 B
 @param 0.5 Alpha
 @return UIColor
 */
#ifndef UIColorHSBA  // e.g. UIColorHSBA(1, 0, 0, 0.5)
#define UIColorHSBA(h, s, b, a) [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:(a)]
#endif

/**
 以HSL模式设置颜色

 @param 1 H
 @param 0 S
 @param 0.5 L
 @return UIColor
 */
#ifndef UIColorHSL   // e.g. UIColorHSL(1, 0, 0.5)
#define UIColorHSL(h, s, l)     [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:1]
#endif

/**
 以HSL模式设置颜色，多加一个透明度设置

 @param 1 H
 @param 0 S
 @param 0 L
 @param 0.5 Alpha
 @return UIColor
 */
#ifndef UIColorHSLA  // e.g. UIColorHSLA(1, 0, 0, 0.5)
#define UIColorHSLA(h, s, l, a) [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:(a)]
#endif

/**
 以CMYK模式设置颜色

 @param 0 C
 @param 0 M
 @param 1 Y
 @param 0.5 K
 @return UIColor
 */
#ifndef UIColorCMYK  // e.g. UIColorCMYK(0, 0, 1, 0.5)
#define UIColorCMYK(c, m, y, k) [UIColor colorWithCyan:(c) magenta:(m) yellow:(y) black:(k) alpha:1]
#endif

/**
 以CMYK模式设置颜色,透明度

 @param 0 C
 @param 0 M
 @param 1 Y
 @param 0 K
 @param 0.5 Alpha
 @return UIColor
 */
#ifndef UIColorCMYKA // e.g. UIColorCMYKA(0, 0, 1, 0, 0.5)
#define UIColorCMYKA(c, m, y, k, a) [UIColor colorWithCyan:(c) magenta:(m) yellow:(y) black:(k) alpha:(a)]
#endif

/**
 以16进制设置颜色

 @param rgbValue 16进制 eg:0x34abff
 @return UIColor
 */
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@end
