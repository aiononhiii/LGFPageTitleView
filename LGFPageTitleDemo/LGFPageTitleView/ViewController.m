//
//  ViewController.m
//  LGFPageTitleView
//
//  Created by apple on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"
#import "LGFTitles.h"
#import "MJRefresh.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *pageView;
@property (strong, nonatomic) NSMutableArray *childVCs;

@property (weak, nonatomic) IBOutlet UIView *oneTitleSuperView;
@property (weak, nonatomic) IBOutlet UIView *twoTitleSuperView;
@property (weak, nonatomic) IBOutlet UIView *threeTitleSuperView;
@property (weak, nonatomic) IBOutlet UIView *fourTitleSuperView;

@property (strong, nonatomic) LGFPageTitleView *oneTitleView;
@property (strong, nonatomic) LGFPageTitleView *twoTitleView;
@property (strong, nonatomic) LGFPageTitleView *threeTitleView;
@property (strong, nonatomic) LGFPageTitleView *fourTitleView;

// 加在NavigationBar上的
@property (weak, nonatomic) IBOutlet UIView *naviTitleSuperView;
@property (strong, nonatomic) LGFPageTitleView *naviTitleView;

@property (strong, nonatomic) NSMutableArray *oneTitles;
@property (strong, nonatomic) NSMutableArray *twoTitles;

@property (strong, nonatomic) NSMutableArray *oneTitleUnSelectImages;
@property (strong, nonatomic) NSMutableArray *oneTitleSelectImages;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 添加在NavigationBar上的view请在进入页面时添加 防止其展现在别的页面
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 添加在NavigationBar上的view请在离开页面时移除 防止其展现在别的页面
    [self.naviTitleView removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    for (NSString *title in self.oneTitles) {
        ChildViewController *vc = [ChildViewController GETSBVC];
        vc.title = title;
        [self addChildViewController:vc];
        [self.childVCs addObject:vc];
    }
    // 刷新title数组
//    self.oneTitleView.style.titles = self.oneTitles;
//    [self.oneTitleView reloadAllTitles];

    self.twoTitleView.style.titles = self.oneTitles;
    [self.twoTitleView reloadAllTitlesSelectIndex:10];

//    self.threeTitleView.style.titles = self.oneTitles;
//    [self.threeTitleView reloadAllTitlesSelectIndex:2];
//
//    self.fourTitleView.style.titles = self.oneTitles;
//    [self.fourTitleView reloadAllTitlesSelectIndex:10];
//
//    self.naviTitleView.style.titles = self.oneTitles;
//    [self.naviTitleView reloadAllTitlesSelectIndex:10];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 如何切换数据源 代码和展示
 */
- (IBAction)more:(UIButton *)sender {
    
}

//----------------建立联动 UICollectionView 为防止title滚动错乱，请务必设置UICollectionView以下几项--------------
// cell请设置与 UICollectionView 同宽高

#pragma mark - Collection View 数据源 和 代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childVCs.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    // cell请设置与 UICollectionView 同宽高
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testcell" forIndexPath:indexPath];
    // 在cell上添加子控制器
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    ChildViewController *vc = self.childVCs[indexPath.item];
    vc.view.frame = cell.bounds;
    [cell addSubview:vc.view];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    // 在此代理方法中作子控制器首次加载数据的操作 防止多余未出现的控制器加载数据而导致的卡顿 (只对将要出现的cell上的子控制器作加载数据操作，其余只加载控制器)
    ChildViewController *vc = self.childVCs[indexPath.item];
    if (vc.datas.count == 0) {// 如果该子控制器数据源数组为空那么执行请求数据
        LGFLog(@"正在刷新第%ld页", indexPath.row);
        [vc loadData];
    }
}

#pragma mark - 懒加载

- (NSMutableArray *)oneTitles {
    if (!_oneTitles) {
        _oneTitles = [NSMutableArray arrayWithObjects:@"鹈鹕", @"鳄鱼", @"鲸鱼", @" 12.30\n已开抢", @"巨嘴鸟", @"麋鹿", @"绵羊", @"螃蟹", @"鸵鸟", @"大象", @"蛇", @"鱼", @"一只大公鸡一只", @"长颈鹿", @"猪", nil];
    }
    return _oneTitles;
}

- (NSMutableArray *)oneTitleUnSelectImages {
    if (!_oneTitleUnSelectImages) {
        _oneTitleUnSelectImages = [NSMutableArray arrayWithObjects:@"鹈鹕-2", @"鳄鱼-2", @"鲸鱼-2", @"狮子-2", @"巨嘴鸟-2", @"麋鹿-2", @"绵羊-2", @"螃蟹-2", @"鸵鸟-2", @"大象-2", @"蛇-2", @"鱼-2", @"公鸡-2", @"长颈鹿-2", @"猪-2", nil];
    }
    return _oneTitleUnSelectImages;
}


- (NSMutableArray *)oneTitleSelectImages {
    if (!_oneTitleSelectImages) {
        _oneTitleSelectImages = [NSMutableArray arrayWithObjects:@"鹈鹕", @"鳄鱼", @"鲸鱼", @"狮子", @"巨嘴鸟", @"麋鹿", @"绵羊", @"螃蟹", @"鸵鸟", @"大象", @"蛇", @"鱼", @"公鸡", @"长颈鹿", @"猪", nil];
    }
    return _oneTitleSelectImages;
}

- (NSMutableArray *)twoTitles {
    if (!_twoTitles) {
        _twoTitles = [NSMutableArray arrayWithObjects:@"鲨鱼", @"鲸鱼", @"鳄鱼", nil];
    }
    return _twoTitles;
}

// 固定宽度title, 下划线圆角添加, 右边title图片添加, 每个title添加不同图片效果展示, 少量title时title居中显示
- (LGFPageTitleView *)oneTitleView {
    if (!_oneTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        // 固定宽度title 必要属性 （如果值为titleview宽度 ／ title数组count，titleview将取消滚动）
        //        style.title_fixed_width = self.view.width / 4;
        //        style.line_width_type = EqualTitleSTRAndImage;
        //        style.line_width_type = FixedWith;
        //        style.line_width_type = EqualTitle;
        style.line_width_type = EqualTitleSTR;
        
        //        style.line_width = 5;
        style.title_left_right_spacing = 10;
        //        style.left_image_width = 20;
        style.title_big_scale = 1.8;
        style.line_height = 5.0;
        style.line_bottom = 1.0;
        style.page_view_animation_type = LGFPageViewAnimationTopToBottom;
        style.line_cornerRadius = style.line_height / 2;
        style.select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Light" size:14];
        style.line_color = LGFRGB(155, 150, 255, 1.0);
        style.select_color = [UIColor greenColor];
        //-----如果添加不同图片使用这个属性---
        style.un_select_image_names = self.oneTitleUnSelectImages;
        style.select_image_names = self.oneTitleSelectImages;
        style.title_image_bundel = LGFBundle;
        //-----这些属性直接决定展示哪边图片----
        style.right_image_width = 20;
        style.left_image_width = 10;
        //-----这些属性直接决定图片相对于title位置----
        style.right_image_spacing = 5.0;
        style.left_image_spacing = 10.0;
        //----------------------------------
        //----少量title时title居中显示----
        style.is_title_center = YES;
        //--------------------------
        _oneTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.oneTitleSuperView page_view:self.pageView];
    }
    return _oneTitleView;
}

// 固定底部下划线宽度效果展示
- (LGFPageTitleView *)twoTitleView {
    if (!_twoTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_left_right_spacing = 5.0;
        style.line_height = 2.0;
        style.line_width = 5.0;
        style.line_color = LGFRGB(255, 255, 255, 1.0);
        style.un_select_color = LGFRGB(0, 0, 0, 1.0);
        style.select_color = LGFRGB(255, 255, 255, 1.0);
        style.un_select_title_font = [UIFont systemFontOfSize:14];
        style.page_view_animation_type = LGFPageViewAnimationTopToBottom;
        style.line_width_type = FixedWith;
        style.line_animation = LGFPageLineAnimationSmallToBig;
        _twoTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.twoTitleSuperView page_view:self.pageView];
    }
    return _twoTitleView;
}

// 多面添加title图片, 每个title添加相同图片, 选中缩放, 选中字体加粗效果展示, 每张图片位置可自定义
- (LGFPageTitleView *)threeTitleView {
    if (!_threeTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 0.8;
        style.line_height = 3.0;
        style.select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Light" size:15];
        style.line_color = LGFRGB(258, 143, 145, 1.0);
        style.un_select_color = LGFRGB(258, 143, 145, 1.0);
        style.select_color = LGFRGB(255, 255, 255, 1.0);
        style.line_width_type = EqualTitleSTRAndImage;
        //-----如果添加相同图片使用这个属性---
        style.same_select_image_name = @"yidingyue1";
        style.same_un_select_image_name = @"weidingyue";
        style.title_image_bundel = LGFBundle;
        //-----这些属性直接决定展示哪边图片----
        style.top_image_height = 20.0;
        style.left_image_width = 20.0;
        style.right_image_width = 20.0;
        style.bottom_image_height = 20.0;
        //-----这些属性直接决定图片相对于title位置----
        style.right_image_spacing = 20.0;
        style.left_image_spacing = 20.0;
        style.top_image_spacing = 10.0;
        //        style.bottom_image_spacing = 10.0;
        //--------------------------------
        style.title_left_right_spacing = 10.0;
        style.line_animation = LGFPageLineAnimationSmallToBig;
        _threeTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.threeTitleSuperView page_view:self.pageView];
    }
    return _threeTitleView;
}

// title下划线替换成图片, 下划线圆角添加, 选中缩放效果展示, 少量title时title居中显示
- (LGFPageTitleView *)fourTitleView {
    if (!_fourTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 0.7;
        style.title_left_right_spacing = 20.0;
        style.line_height = 34.0;
        style.line_bottom = 3.0;
        style.line_cornerRadius = 3.0;
        style.line_color = LGFRGB(255, 255, 255, 1.0);
        style.title_line_break_by_word_wrapping = YES;
        //----title下划线替换成图片----
        style.line_back_image = [UIImage imageNamed:@"狮子" inBundle:LGFBundle compatibleWithTraitCollection:nil];
        //--------------------------
        style.select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        style.un_select_color = LGFRGB(240, 240, 20, 1.0);
        style.select_color = LGFRGB(255, 255, 255, 1.0);
        style.line_width_type = EqualTitleSTR;
        //----少量title时title居中显示----
        style.is_title_center = YES;
        //--------------------------
        style.line_animation = LGFPageLineAnimationSmallToBig;
        _fourTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.fourTitleSuperView page_view:self.pageView];
    }
    return _fourTitleView;
}

// 没有title下划线, 选中字体加粗效果展示
- (LGFPageTitleView *)naviTitleView {
    if (!_naviTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 1.0;
        style.is_show_line = NO;
        style.title_left_right_spacing = 5.0;
        style.un_select_color = LGFRGB(50, 50, 50, 1.0);
        style.select_color = LGFRGB(255, 55, 55, 1.0);
        style.select_title_font = [UIFont systemFontOfSize:18];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        style.line_width_type = FixedWith;
        style.page_title_view_frame = CGRectMake(80, 0, self.navigationController.navigationBar.width - 80, self.navigationController.navigationBar.height);
        style.line_animation = LGFPageLineAnimationSmallToBig;
        _naviTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.navigationController.navigationBar page_view:self.pageView];
        [self.navigationController.navigationBar addSubview:self.naviTitleView];
    }
    return _naviTitleView;
}

- (NSMutableArray *)childVCs {
    if (!_childVCs) {
        _childVCs = [NSMutableArray new];
    }
    return _childVCs;
}

- (void)dealloc {
    LGFLog(@"ViewController已经释放 ----- dealloc");
}

@end
