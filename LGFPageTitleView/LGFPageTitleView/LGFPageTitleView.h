//
//  LGFPageTitleView.h
//  LGFPageTitleView
//
//  Created by apple on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGFTitles.h"
#import "LGFPageTitleStyle.h"

@interface LGFPageTitleView : UIScrollView

/**
 配置用模型
 */
@property (strong, nonatomic) LGFPageTitleStyle *style;

/**
 初始化

 @return LGFPageTitleView
 */
+ (instancetype)na;

/**
 外部分页控件 传入 contentOffset.x

 @param contentOffset_x 外部分页控件的contentOffset.x
 */
- (void)onProgress:(CGFloat)contentOffset_x;

/**
 标自动滚动到指定位置
 */
- (void)autoScrollTitle;

/**
 配置

 @param style 配置用模型
 @param super_view 父控件
 @param page_view 外部分页控件
 @return LGFPageTitleView
 */
- (instancetype)initWithStyle:(LGFPageTitleStyle *)style super_view:(UIView *)super_view page_view:(UIScrollView *)page_view;
@end