//
//  LGFtitle_button.m
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
    button.title_button.tag = index;
    button.style = style;
    [button.title_button setTitle:title forState:UIControlStateNormal];
    // 获取字体宽度
    CGSize title_size = [LGFMethod sizeWithString:button.title_button.titleLabel.text font:button.title_button.titleLabel.font maxSize:CGSizeMake(CGFLOAT_MAX, style.page_title_view.height)];
    CGFloat title_x = 0.0;
    if (index > 0) {
        UIView *subview = style.page_title_view.subviews[index - 1];
        title_x = subview.x + subview.width;
    } else {
        title_x = button.style.title_spacing;
    }
    // 设置每一个标宽度
    button.frame = CGRectMake(title_x, 0, title_size.width + (button.style.title_spacing * 2) + (style.left_image_width > 0.0 ? button.style.title_spacing + button.left_image_spacing.constant + button.left_image_width.constant : 0.0) + (style.right_image_width > 0.0 ? button.style.title_spacing + button.right_image_spacing.constant + button.right_image_width.constant : 0.0), style.page_title_view.height);
    [style.page_title_view addSubview:button];
    return button;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}

- (NSMutableArray *)select_image_names {
    if (!_select_image_names) {
        _select_image_names = [NSMutableArray new];
    }
    return _select_image_names;
}

- (NSMutableArray *)un_select_image_names {
    if (!_un_select_image_names) {
        _un_select_image_names = [NSMutableArray new];
    }
    return _un_select_image_names;
}

- (void)setStyle:(LGFPageTitleStyle *)style {
    _style = style;
    [self.title_button setTitleColor:style.un_select_color forState:UIControlStateNormal];
    self.title_button.titleLabel.font = style.un_select_title_font;
    
    // 如果设置了都是相同标图片, 那么就强制转成全部相同图片
    if (style.same_select_image_name && style.same_select_image_name.length > 0 && style.same_un_select_image_name && style.same_un_select_image_name.length > 0) {
        [style.titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.select_image_names addObject:style.same_select_image_name];
            [self.un_select_image_names addObject:style.same_un_select_image_name];
        }];
        style.select_image_names = self.select_image_names;
        style.un_select_image_names = self.un_select_image_names;
    }
    
    // 是否需要显示标图片
    if (!style.select_image_names || (style.select_image_names.count < style.titles.count) || !style.un_select_image_names || (style.un_select_image_names.count < style.titles.count)) {
        self.is_have_image = NO;
        self.left_image_width.constant = 0.0;
        self.right_image_width.constant = 0.0;
        self.left_image_spacing.constant = 0.0;
        self.right_image_spacing.constant = 0.0;
        self.left_image = nil;
        self.right_image = nil;
        [self setNeedsLayout];
        [self layoutIfNeeded];
        return;
    }
    
    self.is_have_image = YES;
    
    NSAssert(style.title_image_bundel, @"为了获取正确的图片 - 请设置 (NSBundle *)style.title_image_bundel");
    
    // 只要有宽度，允许左右两边都设置图片
    if (style.left_image_width > 0.0) {
        self.left_image_left.constant = style.title_spacing;
        self.left_image_spacing.constant = style.image_spacing;
        self.left_image_width.constant = MIN(style.left_image_width ?: 0.0, style.page_title_view.height);
        self.left_image_height.constant = MIN(style.left_image_height ?: 0.0, style.page_title_view.height);
        [self.left_image setImage:[UIImage imageNamed:style.un_select_image_names[self.title_button.tag] inBundle:style.title_image_bundel compatibleWithTraitCollection:nil]];
    } else {
        LGFLog(@"如果要显示左边图标，请给 left_image_width 赋值");
    }
    
    if (style.right_image_width > 0.0) {
        self.right_image_right.constant = style.title_spacing;
        self.right_image_spacing.constant = style.image_spacing;
        self.right_image_width.constant = MIN(style.right_image_width ?: 0.0, style.page_title_view.height);
        self.right_image_height.constant = MIN(style.right_image_height ?: 0.0, style.page_title_view.height);
        [self.right_image setImage:[UIImage imageNamed:style.un_select_image_names[self.title_button.tag] inBundle:style.title_image_bundel compatibleWithTraitCollection:nil]];
    } else {
        LGFLog(@"如果要显示右边图标，请给 left_image_width 赋值");
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setCurrentTransformSx:(CGFloat)currentTransformSx {
    _currentTransformSx = currentTransformSx;
    self.transform = CGAffineTransformMakeScale(currentTransformSx, currentTransformSx);
}

@end
