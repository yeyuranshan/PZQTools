//
//  ToolsView.m
//  Tools
//
//  Created by 潘振权 on 2017/12/5.
//  Copyright © 2017年 潘振权. All rights reserved.
//

#import "ToolsView.h"

@implementation ToolsView


/**
 压缩图片前的处理工作

 @param UIImage 需要压缩的图片
 @return 压缩后的图片
 */
- (UIImage *)scaleFromImage:(UIImage *)image
{
    if (!image)
    {
        return nil;
    }
    NSData *data =UIImagePNGRepresentation(image);
    CGFloat dataSize = data.length/1024;
    CGFloat width  = image.size.width;
    CGFloat height = image.size.height;
    CGSize size;
    
    if (dataSize<=50)//小于50k
    {
        return image;
    }
    else if (dataSize<=100)//小于100k
    {
        size = CGSizeMake(width/1.f, height/1.f);
    }
    else if (dataSize<=200)//小于200k
    {
        size = CGSizeMake(width/2.f, height/2.f);
    }
    else if (dataSize<=500)//小于500k
    {
        size = CGSizeMake(width/2.f, height/2.f);
    }
    else if (dataSize<=1000)//小于1M
    {
        size = CGSizeMake(width/2.f, height/2.f);
    }
    else if (dataSize<=2000)//小于2M
    {
        size = CGSizeMake(width/2.f, height/2.f);
    }
    else//大于2M
    {
        size = CGSizeMake(width/2.f, height/2.f);
    }
    NSLog(@"%f,%f",size.width,size.height);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (!newImage)
    {
        return image;
    }
    return [self imagesPressToLimitSize:newImage];
}

/**
 图片处理

 @param orgImage 压缩的图片
 @return 压缩过后的图片
 */
-(UIImage *)imagesPressToLimitSize:(UIImage *)orgImage
{
    
    double compression = 0.3f;
    
    NSData *orgData = UIImageJPEGRepresentation(orgImage, compression);
    
    UIImage *newImage = [UIImage imageWithData:orgData];//转成新的图片
    
    float imageSize = orgData.length/1024.0;//原始图片的大小
    
    float flag;
    
    NSLog(@"压图片处理： JPG原始图片大小：%f KB",(unsigned long)orgData.length/1024.0);
    
    
    while(![self judgeImageWhetherMeetTheRequiredSize:orgImage compression:compression])
    {
        flag = imageSize;
        compression  = compression*0.1;
        orgData = UIImageJPEGRepresentation(orgImage, compression);
        
        newImage = [UIImage imageWithData:orgData];//转成新的图片
        
        imageSize = orgData.length/1024.0;
        
        orgImage = newImage;
        
        NSLog(@"压图片处理：compression：%f",compression);
        
        NSLog(@"进行压图片处理： JPG原始图片大小：%f KB",(unsigned long)orgData.length/1024.0);
        
        if (fabsf(flag - imageSize)<0.000000001 || fabsf(imageSize - flag)<0.000000001)
        {
            break;
        }
        
    }
    UIImage * totolImage = [UIImage imageWithData:orgData];
    float newImageSize = orgData.length/1024.0;//原始图片的大小
    
    NSLog(@"压图片处理最终得到的：JPG新图片大小：%fKB",newImageSize);
    return totolImage;
}

/**
 判断图片是否符合要求，要求是大小<150

 @param orgImage 图片
 @param compression 压缩的比例
 @return YES符合，NO不符合
 */
- (BOOL)judgeImageWhetherMeetTheRequiredSize:(UIImage *)orgImage compression:(CGFloat)compression
{
    //转成data数据
    NSData * data = UIImageJPEGRepresentation(orgImage, compression);
    
    //NSLog(@"判断是否符合要求，现在图片的大小：%luBit : %fKB",(unsigned long)data.length,data.length/1024.0);
    
    float imageSize = data.length/1024.0;//原始图片的大小
    
    if (imageSize>150)
    {
        return NO;
    }
    
    return YES;
}
#pragma mark --- 将彩色图片转化成黑白图片
- (UIImage*)changeImageColor:(UIImage*)image imageViewFrame:(CGRect)frame{
    CGRect imageRect = {-1,0,frame.size.width+1,frame.size.height+1};
    
    //获得处理的上下文
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGAffineTransform flip = CGAffineTransformMakeScale(1.0, -1.0);
    CGAffineTransform fliptenShift = CGAffineTransformTranslate(flip, 0, -frame.size.height);
    CGContextConcatCTM(context, fliptenShift);
    
    CGContextDrawImage(context, imageRect, [image CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //绘制图像到一个灰度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    context = CGBitmapContextCreate(nil,
                                    frame.size.width,
                                    frame.size.height,
                                    8,
                                    0,
                                    colorSpace,
                                    (CGBitmapInfo)kCGImageAlphaNone);
    CGContextDrawImage(context, imageRect, [newImage CGImage]);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    
    return finalImage;
}
@end
