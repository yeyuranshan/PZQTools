//
//  UIView+UiVew_Category.m
//  tools
//
//  Created by 潘振权 on 2017/11/10.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import "UIView+UiVew_Category.h"

@implementation UIView (UiVew_Category)
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
- (void) showInWindow{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.frame = CGRectMake(0, 0, CGRectGetWidth(window.bounds), CGRectGetHeight(window.bounds));
    
    [window addSubview:self];
}
+ (void)matchingPhoneNumber:(UILabel *)label{
    NSString *contentStr = label.text;
    //获取字符串中的电话号码
    NSString *regulaStr = @"\\d{3,4}[- ]?\\d{7,8}";
    NSRange stringRange = NSMakeRange(0, contentStr.length);
    //正则匹配
    NSError *error;
    NSRegularExpression *regexps = [NSRegularExpression regularExpressionWithPattern:regulaStr options:0 error:&error];
    if (!error && regexps != nil) {
        [regexps enumerateMatchesInString:contentStr options:0 range:stringRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            
            NSRange phoneRange = result.range;
            // NSString *iphoneStr = [contentStr substringWithRange:phoneRange];
            //设置文本中的电话号码显示为蓝色
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:phoneRange];
            
            label.attributedText = str;
            
            
        }];
    }
}
+ (CGFloat)heightWithWidth:(CGFloat)width font:(CGFloat)font str:(NSString *)string{
    UIFont *fonts = [UIFont systemFontOfSize:font];
    CGSize textSize  =CGSizeMake(width, MAXFLOAT);
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName, nil];
    CGSize size = [string boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size.height;
}
+ (void)copyTextInfomation:(UILabel *)label{
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.string = label.text;
    NSLog(@"复制成功");
    
}
@end
