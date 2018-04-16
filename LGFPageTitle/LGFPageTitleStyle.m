//
//  LGFPageTitleStyle.m
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "LGFPageTitleStyle.h"

@implementation LGFPageTitleStyle

- (instancetype)init {
    if (self = [super init]) {
        self.titles = [NSArray new];
        self.un_select_color = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        self.select_color = [UIColor colorWithRed:0.3 green:0.5 blue:0.8 alpha:1.0];
        self.title_big_scale = 1.0;
        self.un_select_title_font = [UIFont systemFontOfSize:14];
        self.title_have_animation = YES;
        self.title_spacing = 10.0;
        self.is_show_line = YES;
        self.line_color = [UIColor blueColor];
        self.line_width = 0;
        self.line_height = 1.0;
        self.line_alpha = 1.0;
        self.line_bottom = 0.0;
        self.line_animation = LGFPageLineAnimationDefult;
        self.line_width_type = EqualTitleSTR;
        //        self.is_title_center = NO;
        
        self.image_spacing = 0.0;
        self.left_image_height = 0.0;
        self.left_image_width = 0.0;
        self.right_image_height = 0.0;
        self.right_image_width = 0.0;
    }
    return self;
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

