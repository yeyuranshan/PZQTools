//
//  TypeUsageMethod.h
//  tools
//
//  Created by 潘振权 on 2017/11/9.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TypeUsageMethod : NSObject
/**
 禁止调用该类的init方法
 */
- (instancetype)init __attribute__((unavailable("init is not avaiable in RootTabBarController, Use sharedInstance")));



@end
