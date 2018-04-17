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

- (NSMutableArray *)oneTitles {
    if (!_oneTitles) {
        _oneTitles = [NSMutableArray arrayWithObjects:@"鹈鹕", @"鳄鱼", @"鲸鱼", @"狮子", @"巨嘴鸟", @"麋鹿", @"绵羊", @"螃蟹", @"鸵鸟", @"大象", @"蛇", @"鱼", @"公鸡", @"长颈鹿", @"猪", nil];
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
        _twoTitles = [NSMutableArray arrayWithObjects:@"鲨鱼", @"鲸鱼", @"小丑鱼", @"海龟", @"金枪鱼", @"沙丁鱼", @"河豚", @"包头鱼", @"草鱼", @"鳊鱼", nil];
    }
    return _twoTitles;
}

- (LGFPageTitleView *)oneTitleView {
    if (!_oneTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 1.1;
        style.line_height = 5.0;
        style.line_bottom = 1.0;
        style.line_cornerRadius = style.line_height / 2;
        style.select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Light" size:14];
        style.line_color = RGB(155, 150, 255, 1.0);
        style.select_color = RGB(210, 29, 89, 1.0);
        style.title_image_bundel = Bundle;
        style.left_image_width = 30;
        style.title_spacing = 8;
        style.un_select_image_names = self.oneTitleUnSelectImages;
        style.select_image_names = self.oneTitleSelectImages;
        style.line_width_type = EqualTitleSTRAndImage;
        _oneTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.oneTitleSuperView page_view:self.pageView];
    }
    return _oneTitleView;
}

- (LGFPageTitleView *)twoTitleView {
    if (!_twoTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 1.0;
        style.line_height = 2.0;
        style.line_width = 5.0;
        style.line_color = RGB(255, 255, 255, 1.0);
        style.un_select_color = RGB(0, 0, 0, 1.0);
        style.select_color = RGB(255, 255, 255, 1.0);
        style.line_width_type = FixedWith;
        _twoTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.twoTitleSuperView page_view:self.pageView];
    }
    return _twoTitleView;
}

- (LGFPageTitleView *)threeTitleView {
    if (!_threeTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 1.0;
        style.line_height = 3.0;
        style.select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Light" size:20];
        style.line_color = RGB(258, 143, 145, 1.0);
        style.un_select_color = RGB(258, 143, 145, 1.0);
        style.select_color = RGB(255, 255, 255, 1.0);
        style.line_width_type = EqualTitleSTR;
        style.same_select_image_name = @"yidingyue1";
        style.same_un_select_image_name = @"weidingyue";
        style.title_image_bundel = Bundle;
        style.right_image_width = 15.0;
        style.title_spacing = 10.0;
        _threeTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.threeTitleSuperView page_view:self.pageView];
    }
    return _threeTitleView;
}

- (LGFPageTitleView *)fourTitleView {
    if (!_fourTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 0.7;
        style.title_spacing = 5.0;
        style.line_height = 34.0;
        style.line_bottom = 3.0;
        style.line_cornerRadius = 3.0;
        style.line_color = RGB(255, 255, 255, 1.0);
        style.line_back_image = [UIImage imageNamed:@"狮子" inBundle:Bundle compatibleWithTraitCollection:nil];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        style.un_select_color = RGB(240, 240, 20, 1.0);
        style.select_color = RGB(255, 255, 255, 1.0);
        style.line_width_type = EqualTitle;
        _fourTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.fourTitleSuperView page_view:self.pageView];
    }
    return _fourTitleView;
}

- (LGFPageTitleView *)naviTitleView {
    if (!_naviTitleView) {
        LGFPageTitleStyle *style = [LGFPageTitleStyle na];
        style.title_big_scale = 1.0;
        style.is_show_line = NO;
        style.un_select_color = RGB(50, 50, 50, 1.0);
        style.select_color = RGB(255, 55, 55, 1.0);
        style.un_select_title_font = [UIFont systemFontOfSize:18];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        style.line_width_type = FixedWith;
        style.page_title_view_frame = CGRectMake(80, 0, self.navigationController.navigationBar.width - 80, self.navigationController.navigationBar.height);
        // 如果想自定义pagetitle的frame 请传nil
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    for (NSString *title in self.oneTitles) {
        ChildViewController *vc = [ChildViewController GETSBVC];
        vc.title = title;
        [self addChildViewController:vc];
        [self.childVCs addObject:vc];
    }
    // 刷新数据源
    [self.pageView reloadData];
    // 刷新title数组
    self.oneTitleView.style.titles = self.oneTitles;
    [self.oneTitleView reloadAllTitles];
    [self.oneTitleView selectTitleForIndex:10];
    
    self.twoTitleView.style.titles = self.oneTitles;
    [self.twoTitleView reloadAllTitles];
    [self.twoTitleView selectTitleForIndex:10];
    
    self.threeTitleView.style.titles = self.oneTitles;
    [self.threeTitleView reloadAllTitles];
    [self.threeTitleView selectTitleForIndex:10];
    
    self.fourTitleView.style.titles = self.oneTitles;
    [self.fourTitleView reloadAllTitles];
    [self.fourTitleView selectTitleForIndex:10];
    
    self.naviTitleView.style.titles = self.oneTitles;
    [self.naviTitleView reloadAllTitles];
    [self.naviTitleView selectTitleForIndex:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 如何切换数据源 代码和展示
 */
- (IBAction)more:(UIButton *)sender {
    // 改变子控制器数据源前首先释放之前的子控制器
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    // 清空子控制器数据源数组
    [self.childVCs removeAllObjects];
    if (sender.selected) {
        // 重新添加子控制器
        for (NSString *title in self.oneTitles) {
            ChildViewController *vc = [ChildViewController GETSBVC];
            vc.title = title;
            [self addChildViewController:vc];
            [self.childVCs addObject:vc];
        }
        // 重新刷新数据源
        [self.pageView reloadData];
        // 刷新title数组
        self.oneTitleView.style.titles = self.oneTitles;
        [self.oneTitleView reloadAllTitles];
        [self.oneTitleView selectTitleForIndex:10];
        
        self.twoTitleView.style.titles = self.oneTitles;
        [self.twoTitleView reloadAllTitles];
        [self.twoTitleView selectTitleForIndex:10];
        
        self.threeTitleView.style.titles = self.oneTitles;
        [self.threeTitleView reloadAllTitles];
        [self.threeTitleView selectTitleForIndex:10];
        
        self.fourTitleView.style.titles = self.oneTitles;
        [self.fourTitleView reloadAllTitles];
        [self.fourTitleView selectTitleForIndex:10];
        
        self.naviTitleView.style.titles = self.oneTitles;
        [self.naviTitleView reloadAllTitles];
        [self.naviTitleView selectTitleForIndex:10];
    } else {
        // 重新添加子控制器
        for (NSString *title in self.twoTitles) {
            ChildViewController *vc = [ChildViewController GETSBVC];
            vc.title = title;
            [self addChildViewController:vc];
            [self.childVCs addObject:vc];
        }
        // 重新刷新数据源
        [self.pageView reloadData];
        // 刷新title数组
        self.oneTitleView.style.titles = self.twoTitles;
        [self.oneTitleView reloadAllTitles];
        [self.oneTitleView selectTitleForIndex:3];
        
        self.twoTitleView.style.titles = self.twoTitles;
        [self.twoTitleView reloadAllTitles];
        [self.twoTitleView selectTitleForIndex:3];
        
        self.threeTitleView.style.titles = self.twoTitles;
        [self.threeTitleView reloadAllTitles];
        [self.threeTitleView selectTitleForIndex:3];
        
        self.fourTitleView.style.titles = self.twoTitles;
        [self.fourTitleView reloadAllTitles];
        [self.fourTitleView selectTitleForIndex:3];
        
        self.naviTitleView.style.titles = self.twoTitles;
        [self.naviTitleView reloadAllTitles];
        [self.naviTitleView selectTitleForIndex:3];
    }
    sender.selected = !sender.selected;
}

#pragma mark - Collection View 数据源 和 代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childVCs.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
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
    [vc loadData];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // titleview与pageview分离关联关键方法,必须设置 (此方法作用:关联titleview和外部pageview, 使其可以联动)
    [self.oneTitleView autoScrollTitle];
    [self.twoTitleView autoScrollTitle];
    [self.threeTitleView autoScrollTitle];
    [self.fourTitleView autoScrollTitle];
    
    [self.naviTitleView autoScrollTitle];
}

- (void)dealloc {
    LGFLog(@"LGFPageTitle已经全部释放 ----- dealloc");
}

@end
