//
//  LGFTitleButton.h
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGFTitles.h"

@interface LGFTitleButton : UIButton

/**
 配置用模型
 */
@property (strong, nonatomic) LGFPageTitleStyle *style;

/**
 放大缩小倍数
 */
@property (assign, nonatomic) CGFloat currentTransformSx;

/**
 标初始化

 @param title 标文字
 @param index 在LGFPageTitleView中的位置下标
 @param style 配置用模型
 @return LGFTitleButton
 */
+ (instancetype)title:(NSString *)title index:(NSInteger)index style:(LGFPageTitleStyle *)style;
@end
