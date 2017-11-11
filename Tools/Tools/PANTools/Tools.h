//
//  Tools.h
//  tools
//
//  Created by 潘振权 on 2017/11/9.
//  Copyright © 2017年 潘振权. All rights reserved.
//  工具类

#import <Foundation/Foundation.h>
@interface Tools : NSObject
/**
 判断是否为空
 */
+ (BOOL)isEmpty:(NSString *)aString;
/**
 时间戳转换为时间
 */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
/**
 判断是否为电话号码
 */
+ (BOOL)isTelephone:(NSString*)candidate;
/**
 判断是否是邮箱格式
 */
+ (BOOL)isEmail:(NSString*)candidate;
/**
 判断是否是身份证格式
 */
+ (BOOL)isIdNum:(NSString *)candidate;

@end
