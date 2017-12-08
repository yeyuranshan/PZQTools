//
//  Tools.m
//  tools
//
//  Created by 潘振权 on 2017/11/9.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+ (BOOL)isEmpty:(NSString *)aString {
    if (aString == nil || aString == NULL){
        return YES;
    }
    if ([aString isKindOfClass:[NSNull class]]){
        return YES;
    }
    if ([[aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0){
        return YES;
    }
    return NO;
    
}

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/1000];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}



+ (BOOL)isTelephone:(NSString*)candidate
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:candidate]   ||
    [regextestphs evaluateWithObject:candidate]      ||
    [regextestct evaluateWithObject:candidate]       ||
    [regextestcu evaluateWithObject:candidate]       ||
    [regextestcm evaluateWithObject:candidate];
}

+ (BOOL)isEmail:(NSString*)candidate
{
    NSString *      regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:candidate];
}
+ (BOOL)isIdNum:(NSString *)candidate {
    static NSPredicate *predicate;
    if (predicate == nil) {
        predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^\\d{17}(\\d|X|x)$"];
    }
    //通过验证，说明身份证格式正确，但是还需计算
    if (![predicate evaluateWithObject:candidate]) return NO;
    /********开始计算********/
    //17位加权因子
    NSArray *coefficientArray = [NSArray arrayWithObjects:@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2", nil];
    // 余数数组
    NSArray *idCardModArray = [NSArray arrayWithObjects:@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2", nil];
    // 每一位身份证号码和对应系数相乘之后相加所得的和
    NSInteger idCardWithCofficientSum = 0;
    for (int i = 0; i < 17; i++) {
        NSInteger subStrIndex = [[candidate substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger cofficient = [[coefficientArray objectAtIndex:i] integerValue];
        idCardWithCofficientSum += subStrIndex * cofficient;
    }
    
    //找出余数对应的元素
    NSString *str = idCardModArray[(idCardWithCofficientSum % 11)];
    //    //获取最后一位身份证号码
    NSString *idCardLast = [candidate substringWithRange:NSMakeRange(17, 1)];
    // 如果这个数字和身份证最后一位相同,则符合国家标准,返回YES
    if ([str isEqualToString:idCardLast]) {
        return YES;
    } else {
        return NO;
    }
    
}



@end
