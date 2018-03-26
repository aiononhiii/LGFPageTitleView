//
//  LGFPageTitleView.m
//  LGFPageTitleView
//
//  Created by apple on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "LGFPageTitleView.h"

@interface LGFPageTitleView () <UIScrollViewDelegate>
{
    CGFloat _old_off_set_x;
    // 前一个选中下标
    NSInteger _un_select_index;
    // 将要选中下标
    NSInteger _select_index;
}
// 所有标数组
@property (strong, nonatomic) NSMutableArray *title_buttons;
// 外部分页控制器
@property (strong, nonatomic) UIScrollView *page_view;
// 底部滚动条
@property (strong, nonatomic) LGFTitleLine *title_line;
// title 字体渐变色
@property (strong, nonatomic) NSArray *deltaRGBA;
@property (strong, nonatomic) NSArray *select_colorRGBA;
@property (strong, nonatomic) NSArray *un_select_colorRGBA;
@end

@implementation LGFPageTitleView

// 底部滚动条
- (LGFTitleLine *)title_line {
    if (!_style.is_show_line) {
        return nil;
    }
    if (!_title_line) {
        _title_line = [LGFTitleLine style:_style];
    }
    return _title_line;
}
// 未选中颜色数组
- (NSArray *)un_select_colorRGBA {
    if (!_un_select_colorRGBA) {
        NSArray *normal_colorRGBA = [LGFMethod getColorRGBA:_style.un_select_color];
        NSAssert(normal_colorRGBA, @"设置普通状态的文字颜色时 请使用RGBA空间的颜色值");
        _un_select_colorRGBA = normal_colorRGBA;
        
    }
    return  _un_select_colorRGBA;
}
// 选中颜色数组
- (NSArray *)select_colorRGBA {
    if (!_select_colorRGBA) {
        NSArray *select_colorRGBA = [LGFMethod getColorRGBA:_style.select_color];
        NSAssert(select_colorRGBA, @"设置选中状态的文字颜色时 请使用RGBA空间的颜色值");
        _select_colorRGBA = select_colorRGBA;
        
    }
    return  _select_colorRGBA;
}
// 中和颜色数组
- (NSArray *)deltaRGBA {
    if (_deltaRGBA == nil) {
        NSArray *un_select_colorRGBA = self.un_select_colorRGBA;
        NSArray *select_colorRGBA = self.select_colorRGBA;
        
        NSArray *delta;
        if (un_select_colorRGBA && select_colorRGBA) {
            CGFloat deltaR = [un_select_colorRGBA[0] floatValue] - [select_colorRGBA[0] floatValue];
            CGFloat deltaG = [un_select_colorRGBA[1] floatValue] - [select_colorRGBA[1] floatValue];
            CGFloat deltaB = [un_select_colorRGBA[2] floatValue] - [select_colorRGBA[2] floatValue];
            CGFloat deltaA = [un_select_colorRGBA[3] floatValue] - [select_colorRGBA[3] floatValue];
            delta = [NSArray arrayWithObjects:@(deltaR), @(deltaG), @(deltaB), @(deltaA), nil];
            _deltaRGBA = delta;
        }
    }
    return _deltaRGBA;
}
// 标数组
- (NSMutableArray *)title_buttons {
    if (!_title_buttons) {
        _title_buttons = [NSMutableArray new];
    }
    return _title_buttons;
}

#pragma mark - 初始化标view

+ (instancetype)na {
    LGFPageTitleView *pageTitleView = [Bundle loadNibNamed:NSStringFromClass([LGFPageTitleView class]) owner:self options:nil][0];
    pageTitleView.delegate = pageTitleView;
    return pageTitleView;
}

#pragma mark - 标view配置

- (instancetype)initWithStyle:(LGFPageTitleStyle *)style super_view:(UIView *)super_view page_view:(UIScrollView *)page_view {
    _style = style;
    _page_view = page_view;
    _style.page_title_view = self;
    [_page_view addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [super_view setNeedsLayout];
    [super_view layoutIfNeeded];
    self.frame = super_view.bounds;
    // 标view 添加到相应父view
    [super_view addSubview:self];
    
    // 标view 滚动区域配置
    [self setContentSize:CGSizeMake([self addAllTitles], 0.0)];
    
    // 第一次滚动
    [self autoScrollTitle];
    
    // 添加底部滚动线
    [self addScrollLine];
    
    return self;
}

#pragma mark - 添加底部线

- (void)addScrollLine {
    if (_style.is_show_line) {
        [self addSubview:self.title_line];
    }
}

#pragma mark - 添加所有标

- (CGFloat)addAllTitles {
    __block CGFloat contentWidth = 0.0;
    [_style.titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LGFTitleButton *title = [LGFTitleButton title:obj index:idx style:_style];
        [title addTarget:self action:@selector(autoTitleSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self.title_buttons addObject:title];
        contentWidth += title.frame.size.width;
    }];
    return contentWidth + (_style.title_spacing * 2);
}

#pragma mark - 标点击事件

- (void)autoTitleSelect:(LGFTitleButton *)sender {
    _select_index = sender.tag;
    // 更新标view的UI
    [self adjustUIWhenBtnOnClickWithAnimate:true taped:YES];
    // 外部分页控制器 滚动到对应下标
    UICollectionView *page = (UICollectionView *)_page_view;
    [page setContentOffset:CGPointMake(page.width * _select_index, 0.0) animated:NO];
}

#pragma mark - 标自动滚动

- (void)autoScrollTitle {
    _select_index = (_page_view.contentOffset.x / _page_view.bounds.size.width);
    [self adjustUIWithProgress:1.0 oldIndex:_select_index currentIndex:_select_index];
    // 调整title位置 使其滚动到中间
    [self adjustTitleOffSetToSelectIndex:_select_index];
    LGFLog(@"当前选中:%@", _style.titles[_select_index]);
}

#pragma mark -  外层分页控制器 contentOffset 转化

- (void)onProgress:(CGFloat)contentOffset_x {
    CGFloat tempProgress = contentOffset_x / _page_view.bounds.size.width;
    NSInteger tempIndex = tempProgress;
    CGFloat progress = tempProgress - floor(tempProgress);
    CGFloat deltaX = contentOffset_x - _old_off_set_x;
    if (contentOffset_x < 0) { return; }
    if (deltaX > 0) {// 向左
        if (progress == 0.0) {
            return;
        }
        _select_index = tempIndex + 1;
        _un_select_index = tempIndex;
    } else if (deltaX < 0) {
        progress = 1.0 - progress;
        _un_select_index = tempIndex + 1;
        _select_index = tempIndex;
        
    } else {
        return;
    }
    [self adjustUIWithProgress:progress oldIndex:_un_select_index currentIndex:_select_index];
}

#pragma mark - 调整title位置 使其滚动到中间

- (void)adjustTitleOffSetToSelectIndex:(NSInteger)select_index {
    _un_select_index = select_index;
    // 重置渐变/缩放效果附近其他item的缩放和颜色
    int index = 0;
    for (LGFTitleButton *title in self.title_buttons) {
        if (index != select_index) {
            [title setTitleColor:_style.un_select_color forState:UIControlStateNormal];
            title.currentTransformSx = 1.0;
        }
        else {
            [title setTitleColor:_style.select_color forState:UIControlStateNormal];
            if (_style.title_big_scale != 0) {
                title.currentTransformSx = _style.title_big_scale;
            }
        }
        index++;
    }
    LGFTitleButton *select_title = (LGFTitleButton *)self.title_buttons[select_index];
    CGFloat offSetx = select_title.center.x - self.width * 0.5;
    if (offSetx < 0) {
        offSetx = 0;
    }
    CGFloat maxOffSetX = self.contentSize.width - self.width;
    if (maxOffSetX < 0) {
        maxOffSetX = 0;
    }
    if (offSetx > maxOffSetX) {
        offSetx = maxOffSetX;
    }
    [self setContentOffset:CGPointMake(offSetx, 0.0) animated:YES];
}

#pragma mark - 更新标view的UI(用于滚动外部分页控制器的时候)

- (void)adjustUIWithProgress:(CGFloat)progress oldIndex:(NSInteger)oldIndex currentIndex:(NSInteger)currentIndex {
    // 判断是否满足UI更新条件
    if (oldIndex < 0 || oldIndex >= self.title_buttons.count || currentIndex < 0 || currentIndex >= self.title_buttons.count) { return;
    }
    _un_select_index = currentIndex;
    // 取得 前一个选中的标 和 将要选中的标
    LGFTitleButton *un_select_title = (LGFTitleButton *)self.title_buttons[oldIndex];
    LGFTitleButton *select_title = (LGFTitleButton *)self.title_buttons[currentIndex];
    // 标颜色渐变
    if (_style.select_color != _style.un_select_color) {
        [un_select_title setTitleColor:[UIColor
                                        colorWithRed:[self.select_colorRGBA[0] floatValue] + [self.deltaRGBA[0] floatValue] * progress
                                        green:[self.select_colorRGBA[1] floatValue] + [self.deltaRGBA[1] floatValue] * progress
                                        blue:[self.select_colorRGBA[2] floatValue] + [self.deltaRGBA[2] floatValue] * progress
                                        alpha:[self.select_colorRGBA[3] floatValue] + [self.deltaRGBA[3] floatValue] * progress] forState:UIControlStateNormal];
        [select_title setTitleColor:[UIColor
                                     colorWithRed:[self.un_select_colorRGBA[0] floatValue] - [self.deltaRGBA[0] floatValue] * progress
                                     green:[self.un_select_colorRGBA[1] floatValue] - [self.deltaRGBA[1] floatValue] * progress
                                     blue:[self.un_select_colorRGBA[2] floatValue] - [self.deltaRGBA[2] floatValue] * progress
                                     alpha:[self.un_select_colorRGBA[3] floatValue] - [self.deltaRGBA[3] floatValue] * progress] forState:UIControlStateNormal];
    }
    // 标缩放大小改变
    if (_style.title_big_scale != 0) {
        CGFloat deltaScale = _style.title_big_scale - 1.0;
        un_select_title.currentTransformSx = _style.title_big_scale - deltaScale * progress;
        select_title.currentTransformSx = 1.0 + deltaScale * progress;
    }
    // 标底部滚动条 更新位置
    if (self.title_line) {
        if (_style.line_width_type == EqualTitle) {
            CGFloat xDistance = select_title.x - un_select_title.x;
            CGFloat wDistance = select_title.width - un_select_title.width;
            self.title_line.x = un_select_title.x + xDistance * progress;
            self.title_line.width = un_select_title.width + wDistance * progress;
        } else if (_style.line_width_type == EqualTitleSTR) {
            CGFloat xDistance = select_title.x - un_select_title.x;
            CGFloat wDistance = select_title.width - un_select_title.width;
            self.title_line.x = _style.title_spacing * _style.title_big_scale + un_select_title.x + xDistance * progress;
            self.title_line.width = un_select_title.width + wDistance * progress - (_style.title_spacing * 2) * _style.title_big_scale;
        } else if (_style.line_width_type == FixedWith){
            CGFloat select_title_x = select_title.x + ((select_title.width - _style.line_width) / 2);
            CGFloat un_select_title_x = un_select_title.x + ((un_select_title.width - _style.line_width) / 2);
            CGFloat xDistance = select_title_x - un_select_title_x;
            self.title_line.x = un_select_title_x + xDistance * progress;
            self.title_line.width = _style.line_width;
        }
    }
}

#pragma mark - 更新标view的UI(用于点击标的时候)

- (void)adjustUIWhenBtnOnClickWithAnimate:(BOOL)animated taped:(BOOL)taped {
    // 判断是否满足UI更新条件
    if (_select_index == _un_select_index && taped) { return; }
    // 取得 前一个选中的标 和 将要选中的标
    LGFTitleButton *un_select_title = (LGFTitleButton *)self.title_buttons[_un_select_index];
    LGFTitleButton *select_title = (LGFTitleButton *)self.title_buttons[_select_index];
    CGFloat animatedTime = animated ? 0.30 : 0.0;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:animatedTime animations:^{
        // 标颜色渐变
        [un_select_title setTitleColor:_style.un_select_color forState:UIControlStateNormal];
        [select_title setTitleColor:_style.select_color forState:UIControlStateNormal];
        // 标缩放大小改变
        if (weakSelf.style.title_big_scale != 0) {
            un_select_title.currentTransformSx = 1.0;
            select_title.currentTransformSx = weakSelf.style.title_big_scale;
        }
        // 标底部滚动条 更新位置
        if (weakSelf.title_line) {
            if (self.title_line) {
                if (_style.line_width_type == EqualTitle) {
                    weakSelf.title_line.x = select_title.x;
                    weakSelf.title_line.width = select_title.width;
                } else if (_style.line_width_type == EqualTitleSTR) {
                    weakSelf.title_line.x = _style.title_spacing * _style.title_big_scale + select_title.x;
                    weakSelf.title_line.width = select_title.width - (_style.title_spacing * 2) * _style.title_big_scale;
                } else if (_style.line_width_type == FixedWith){
                    weakSelf.title_line.x = select_title.x + ((select_title.width - _style.line_width) / 2);
                    weakSelf.title_line.width = _style.line_width;
                }
            }
        }
    } completion:^(BOOL finished) {
        [weakSelf adjustTitleOffSetToSelectIndex:_select_index];
    }];
    // 下标反转
    _un_select_index = _select_index;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _old_off_set_x = scrollView.contentOffset.x;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    [self onProgress:_page_view.contentOffset.x];
}

#pragma mark - 已销毁

- (void)dealloc {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
    [_page_view removeObserver:self forKeyPath:@"contentOffset"];
    LGFLog(@"LGFPageTitleView_____________dealloc_已销毁");
}



@end

