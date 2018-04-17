//
//  LGFTitleButton.h
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGFTitles.h"

@interface LGFTitleButton : UIView

/**
 标按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *title_button;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top_image_spacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom_image_spacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left_image_spacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right_image_spacing;

@property (weak, nonatomic) IBOutlet UIImageView *top_image;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top_image_top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top_image_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top_image_height;

@property (weak, nonatomic) IBOutlet UIImageView *bottom_image;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom_image_bottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom_image_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom_image_height;

@property (weak, nonatomic) IBOutlet UIImageView *left_image;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left_image_left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left_image_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left_image_height;

@property (weak, nonatomic) IBOutlet UIImageView *right_image;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right_image_right;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right_image_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right_image_height;

@property (strong, nonatomic) NSMutableArray *select_image_names;
@property (strong, nonatomic) NSMutableArray *un_select_image_names;

/**
 是否有标图片
 */
@property (assign, nonatomic) BOOL is_have_image;

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
