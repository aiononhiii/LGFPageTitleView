//
//  LGFTitleLine.h
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGFTitles.h"

@interface LGFTitleLine : UIView

/**
 配置用模型
 */
@property (strong, nonatomic) LGFPageTitleStyle *style;

/**
 标底部滚动条初始化

 @param style 配置用模型
 @return LGFTitleLine
 */
+ (instancetype)style:(LGFPageTitleStyle *)style;
@end
