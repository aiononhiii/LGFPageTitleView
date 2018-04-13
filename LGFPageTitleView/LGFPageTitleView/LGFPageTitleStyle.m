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
    }
    return self;
}

+ (instancetype)na {
    LGFPageTitleStyle *style = [[LGFPageTitleStyle alloc] init];
    return style;
}

@end

