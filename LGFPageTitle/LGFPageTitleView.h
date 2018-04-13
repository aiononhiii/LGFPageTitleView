//
//  LGFPageTitleView.h
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
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
 刷新所有标
 
 @param titles 标数组
 */
- (void)reloadAllTitles:(NSMutableArray *)titles;

/**
 滚动到指定index位置
 
 @param index 下标位置
 */
- (void)selectTitleForIndex:(NSInteger)index;

/**
 配置
 
 @param style 配置用模型
 @param super_view 父控件
 @param page_view 外部分页控件
 @return LGFPageTitleView
 */
- (instancetype)initWithStyle:(LGFPageTitleStyle *)style super_vc:(UIViewController *)super_vc super_view:(UIView *)super_view page_view:(UIScrollView *)page_view;
@end
