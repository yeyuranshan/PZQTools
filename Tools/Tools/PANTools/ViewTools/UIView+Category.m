//
//  UIView+Category.m
//  Tools
//
//  Created by 潘振权 on 2017/12/8.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

+ (id) creatFromNib{
    
    NSString *xibName = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle]loadNibNamed:xibName owner:nil options:nil] firstObject];
}

- (UIViewController *) parentVC{
    
    id object = [self nextResponder];
    
    while (![object isKindOfClass:[UIViewController class]] && object != nil) {
        object = [object nextResponder];
    }
    
    return (UIViewController *) object;
}
@end
