//
//  MD5Encrypt.h
//  tools
//
//  Created by 潘振权 on 2017/11/7.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5Encrypt : NSObject
/*
 加密规则：
 对所有传入参数按照字段名的 ASCII 码从小到大排序(字典序) 后,使用 URL 键值 对的格式(即 key1=value1&key2=value2...)拼接成字符串 string1,注意:值为空的参数不参与签名;然后对字符串进行MD5运算
 */
- (NSString *)MD5Encrypt:(NSDictionary *)params withKey:(NSString *)key;

@end
