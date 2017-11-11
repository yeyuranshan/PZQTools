//
//  MD5Encrypt.m
//  tools
//
//  Created by 潘振权 on 2017/11/7.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import "MD5Encrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Encrypt
- (NSString *)MD5Encrypt:(NSDictionary *)params withKey:(NSString *)key{
    
    // 参数排序
    NSArray *keyArray = [params allKeys];
    NSArray *sortedKeyArray = [keyArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
        return [(NSString *)obj1 compare:(NSString *)obj2];
    }];
    
    // 组建加密串
    NSMutableString *paramsStr = [[NSMutableString alloc] init];
    for (NSString *key in sortedKeyArray) {
        id value = [params objectForKey:key];
        if ( !([value isKindOfClass:NSString.class] && [MD5Encrypt isEmpty:value])) { // value为空不参加签名
            [paramsStr appendString:[NSString stringWithFormat:@"%@=%@&", key, [params objectForKey:key]]];
        }
    }
    [paramsStr deleteCharactersInRange:NSMakeRange(paramsStr.length - 1, 1)];
    if (![MD5Encrypt isEmpty:key]) {
        [paramsStr appendString:[NSString stringWithFormat:@"&key=%@", key]];
    }
    
    //MD5加密
    const char *original_str = [paramsStr UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (int)strlen(original_str), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    [result appendFormat:@"%02x", digest[i]];
    
    return [result uppercaseString];
    
}
    //判断是否为空
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
@end
