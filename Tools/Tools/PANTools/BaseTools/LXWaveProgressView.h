//
//  LXWaveProgressView.h
//  LXWaveProgressDemo
//
//  Created by liuxin on 16/8/1.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "M_GrowUp.h"

@interface LXWaveProgressView : UIView
/**
 *  进度 0-1
 */
@property (nonatomic,assign)CGFloat progress;

/**
 成长值
 */
@property(nonatomic ,strong) M_GrowUp *growUp;

/**
 *  波动速度，默认 1
 */
@property (nonatomic,assign)CGFloat speed;

/**
 *  波纹填充颜色
 */
@property (nonatomic,strong)UIColor * firstWaveColor;
@property (nonatomic,strong)UIColor * secondWaveColor;

/**
 *  波动幅度，默认 5
 */
@property (nonatomic,assign)CGFloat waveHeight;

/**
 *  进度文字
 */
@property (nonatomic,strong)UILabel * progressLabel;

/**
 *  是否显示单层波浪，默认NO
 */
@property (nonatomic,assign)BOOL isShowSingleWave;

- (void)stopWaveAnimation;
@end
