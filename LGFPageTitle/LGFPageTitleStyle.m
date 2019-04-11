//
//  LGFPageTitleStyle.m
//  LGFPageTitleView
//
//  Created by apple on 2018/3/23.
//  Copyright © 2018年 来国锋. All rights reserved.
//

#import "LGFPageTitleStyle.h"
#import "LGFMethod.h"

@implementation LGFPageTitleStyle

- (instancetype)init {
    if (self = [super init]) {
        self.titles = [NSArray new];
        self.un_select_color = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        self.select_color = [UIColor colorWithRed:0.3 green:0.5 blue:0.8 alpha:1.0];
        self.select_title_font = [UIFont systemFontOfSize:14];
        self.un_select_title_font = [UIFont systemFontOfSize:14];
        self.sub_select_color = self.select_color;
        self.sub_un_select_color = self.un_select_color;
        self.sub_select_title_font = self.select_title_font;
        self.sub_un_select_title_font = self.un_select_title_font;
        self.title_big_scale = 1.0;
        self.title_have_animation = YES;
        self.title_backgroundColor = [UIColor clearColor];
        self.title_line_break_by_word_wrapping = NO;
        self.title_borderColor = [UIColor whiteColor];
        self.is_show_line = YES;
        self.line_color = [UIColor blueColor];
        self.line_height = 1.0;
        self.line_alpha = 1.0;
        self.line_back_image = nil;
        self.line_animation = LGFPageLineAnimationDefult;
        self.title_scroll_follow_type = LGFTitleScrollFollowDefult;
        self.page_view_animation_type = LGFPageViewAnimationNone;
        self.line_width_type = EqualTitleSTR;
        self.is_title_center = NO;
        self.is_double_title = NO;
    }
    return self;
}

- (void)setSub_select_color:(UIColor *)sub_select_color {
    _sub_select_color = [LGFMethod getColorRGBA:sub_select_color] ? sub_select_color : [LGFMethod changeUIColorToRGB:sub_select_color];
}

- (void)setSub_un_select_color:(UIColor *)sub_un_select_color {
    _sub_un_select_color = [LGFMethod getColorRGBA:sub_un_select_color] ? sub_un_select_color : [LGFMethod changeUIColorToRGB:sub_un_select_color];
}

- (void)setSelect_color:(UIColor *)select_color {
    _select_color = [LGFMethod getColorRGBA:select_color] ? select_color : [LGFMethod changeUIColorToRGB:select_color];
}

- (void)setUn_select_color:(UIColor *)un_select_color {
    _un_select_color = [LGFMethod getColorRGBA:un_select_color] ? un_select_color : [LGFMethod changeUIColorToRGB:un_select_color];
}

- (void)setLine_color:(UIColor *)line_color {
    _line_color = [LGFMethod getColorRGBA:line_color] ? line_color : [LGFMethod changeUIColorToRGB:line_color];
}

- (void)setTop_image_spacing:(CGFloat)top_image_spacing {
    _top_image_spacing = top_image_spacing;
}

- (void)setBottom_image_spacing:(CGFloat)bottom_image_spacing {
    _bottom_image_spacing = bottom_image_spacing;
}

- (void)setLeft_image_spacing:(CGFloat)left_image_spacing {
    _left_image_spacing = left_image_spacing;
}

- (void)setRight_image_spacing:(CGFloat)right_image_spacing {
    _right_image_spacing = right_image_spacing;
}

- (void)setSelect_image_names:(NSMutableArray *)select_image_names {
    _select_image_names = select_image_names;
    if (!_un_select_image_names || _un_select_image_names.count == 0) {
        _un_select_image_names = select_image_names;
    }
}

- (void)setUn_select_image_names:(NSMutableArray *)un_select_image_names {
    _un_select_image_names = un_select_image_names;
    if (!_select_image_names || _select_image_names.count == 0) {
        _select_image_names = un_select_image_names;
    }
}

- (void)setSame_select_image_name:(NSString *)same_select_image_name {
    _same_select_image_name = same_select_image_name;
    if (!_same_un_select_image_name || _same_un_select_image_name.length == 0) {
        _same_un_select_image_name = same_select_image_name;
    }
}

- (void)setSame_un_select_image_name:(NSString *)same_un_select_image_name {
    _same_un_select_image_name = same_un_select_image_name;
    if (!_same_select_image_name || _same_select_image_name.length == 0) {
        _same_select_image_name = same_un_select_image_name;
    }
}

- (void)setTop_image_height:(CGFloat)top_image_height {
    _top_image_height = top_image_height;
    if (!_top_image_width || _top_image_width == 0.0) {
        _top_image_width = top_image_height;
    }
}

- (void)setBottom_image_height:(CGFloat)bottom_image_height {
    _bottom_image_height = bottom_image_height;
    if (!_bottom_image_width || _bottom_image_width == 0.0) {
        _bottom_image_width = bottom_image_height;
    }
}

- (void)setLeft_image_height:(CGFloat)left_image_height {
    _left_image_height = left_image_height;
    if (!_left_image_width || _left_image_width == 0.0) {
        _left_image_width = left_image_height;
    }
}

- (void)setRight_image_height:(CGFloat)right_image_height {
    _right_image_height = right_image_height;
    if (!_right_image_width || _right_image_width == 0.0) {
        _right_image_width = right_image_height;
    }
}

- (void)setTop_image_width:(CGFloat)top_image_width {
    _top_image_width = top_image_width;
    if (!_top_image_height || _top_image_height == 0.0) {
        _top_image_height = top_image_width;
    }
}

- (void)setBottom_image_width:(CGFloat)bottom_image_width {
    _bottom_image_width = bottom_image_width;
    if (!_bottom_image_height || _bottom_image_height == 0.0) {
        _bottom_image_height = bottom_image_width;
    }
}

- (void)setLeft_image_width:(CGFloat)left_image_width {
    _left_image_width = left_image_width;
    if (!_left_image_height || _left_image_height == 0.0) {
        _left_image_height = left_image_width;
    }
}

- (void)setRight_image_width:(CGFloat)right_image_width {
    _right_image_width = right_image_width;
    if (!_right_image_height || _right_image_height == 0.0) {
        _right_image_height = right_image_width;
    }
}

+ (instancetype)na {
    LGFPageTitleStyle *style = [[LGFPageTitleStyle alloc] init];
    return style;
}

@end

