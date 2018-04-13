//
//  LGFTitleLine.m
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "LGFTitleLine.h"

@implementation LGFTitleLine

+ (instancetype)style:(LGFPageTitleStyle *)style {
    LGFTitleLine *line = [Bundle loadNibNamed:NSStringFromClass([LGFPageTitleView class]) owner:self options:nil][2];
    line.style = style;
    return line;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}

- (void)setStyle:(LGFPageTitleStyle *)style {
    _style = style;
    self.backgroundColor = style.line_color;
    CGFloat Y = style.page_title_view.height - ((style.line_height + style.line_bottom) > style.page_title_view.height ? style.page_title_view.height : (style.line_height + style.line_bottom));
    CGFloat H = (style.line_height + style.line_bottom) > style.page_title_view.height ? (style.page_title_view.height - style.line_bottom) : style.line_height;
    self.y = Y;
    self.height = H;
    self.alpha = style.line_alpha;
}

@end
