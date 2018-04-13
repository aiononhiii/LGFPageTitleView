//
//  LGFTitleButton.m
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "LGFTitleButton.h"

@implementation LGFTitleButton

+ (instancetype)title:(NSString *)title index:(NSInteger)index style:(LGFPageTitleStyle *)style {
    [style.page_title_view setNeedsLayout];
    [style.page_title_view layoutIfNeeded];
    // 初始化标
    LGFTitleButton *button = [Bundle loadNibNamed:NSStringFromClass([LGFPageTitleView class]) owner:self options:nil][1];
    button.style = style;
    button.tag = index;
    [button setTitle:title forState:UIControlStateNormal];
    // 获取字体宽度
    CGSize title_size = [LGFMethod sizeWithString:button.titleLabel.text font:button.titleLabel.font maxSize:CGSizeMake(CGFLOAT_MAX, style.page_title_view.height)];
    CGFloat title_x = 0.0;
    if (index > 0) {
        UIView *subview = style.page_title_view.subviews[index - 1];
        title_x = subview.x + subview.width;
    } else {
        title_x = button.style.title_spacing;
    }
    // 设置每一个标宽度
    button.frame = CGRectMake(title_x, 0, title_size.width + (button.style.title_spacing * 2), style.page_title_view.height);
    [style.page_title_view addSubview:button];
    return button;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}

- (void)setStyle:(LGFPageTitleStyle *)style {
    _style = style;
    [self setTitleColor:style.un_select_color forState:UIControlStateNormal];
    self.titleLabel.font = style.un_select_title_font;
}

- (void)setCurrentTransformSx:(CGFloat)currentTransformSx {
    _currentTransformSx = currentTransformSx;
    self.transform = CGAffineTransformMakeScale(currentTransformSx, currentTransformSx);
}

@end
