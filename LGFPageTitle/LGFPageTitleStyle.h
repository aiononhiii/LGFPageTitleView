//
//  LGFPageTitleStyle.h
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "LGFTitles.h"

typedef NS_OPTIONS(NSUInteger, LGFPageLineAnimation) {
    LGFPageLineAnimationDefult = 1 << 0,
    //LGFPageLineAnimationRight = 1 << 1,
};
typedef NS_OPTIONS(NSUInteger, LGFTitleLineWidthType) {
    EqualTitleSTR = 1 << 0,// 宽度等于字体宽度
    EqualTitle = 1 << 1,// 宽度等于标宽度
    FixedWith = 1 << 2,// 宽度等于固定宽度
};

@interface LGFPageTitleStyle : NSObject

// 初始化
+ (instancetype)na;

//------------------- 数据源设置

@property (strong, nonatomic) NSArray *titles;

//------------------- 主view

@property (strong, nonatomic) UIScrollView *page_title_view;

//------------------- 标设置

// 未选中标 字体颜色 默认 lightGrayColor 淡灰色 (对应select_color两个颜色一样则取消渐变效果)
@property (strong, nonatomic) UIColor *un_select_color;
// 选中标 字体颜色 默认 blackColor 黑色 (对应un_select_color两个颜色一样则取消渐变效果)
@property (strong, nonatomic) UIColor *select_color;
// 选中标 放大缩小倍数 默认 1.0(不放大缩小);
@property (assign, nonatomic) CGFloat title_big_scale;
// 标 选中字体 默认 [UIFont systemFontOfSize:14];
@property (strong, nonatomic) UIFont *select_title_font;
// 标 未选中字体 默认 和选中字体一样
@property (strong, nonatomic) UIFont *un_select_title_font;
// 标是否有滑动动画 默认 YES 有动画
@property (assign, nonatomic) BOOL title_have_animation;
// 标间距 默认 10.0
@property (assign, nonatomic) CGFloat title_spacing;

//------------------- 标底部线设置

// 是否显示标底部滚动线 默认 YES
@property (assign, nonatomic) BOOL is_show_line;
// 标底部滚动线 颜色 默认 blueColor
@property (strong, nonatomic) UIColor *line_color;
// 标底部滚动线 透明度 默认 1.0 - 不透明
@property (assign, nonatomic) CGFloat line_alpha;
// 标底部滚动线 动画宽度设置 默认宽度等于标字体宽度 - EqualTitleSTR
@property (assign, nonatomic) LGFTitleLineWidthType line_width_type;
// 标底部滚动线 宽度 默认 0 - 设置 LGFTitleLineType 固定宽度(FixedWith)时有效
@property (assign, nonatomic) CGFloat line_width;
// 标底部滚动线 高度 默认 1.0 (line_height最大高度为 LGFPageTitleView的高度)
@property (assign, nonatomic) CGFloat line_height;
// 标底部滚动线相对于底部位置 默认 0 - 贴于底部
@property (assign, nonatomic) CGFloat line_bottom;
// 标底部滚动线是否有滑动动画 默认 LGFPageLineAnimationFollow 有跟随动画
@property (assign, nonatomic) LGFPageLineAnimation line_animation;

//------------------- 整体序列设置

// 当标总宽度小于View宽度时 是否居中显示 默认 NO - 不居中(从左边开始显示)
//@property (assign, nonatomic) BOOL is_title_center;

@end

