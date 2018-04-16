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

@property (strong, nonatomic) NSMutableArray *oneTitles;
@property (strong, nonatomic) NSMutableArray *twoTitles;

@property (strong, nonatomic) NSMutableArray *oneTitleImages;

@end

@implementation ViewController

- (NSMutableArray *)oneTitles {
    if (!_oneTitles) {
        _oneTitles = [NSMutableArray arrayWithObjects:@"篮球", @"足球", @"乒乓球", @"羽毛球", @"排球", @"地球", @"月球", @"保龄球", @"什么什么什么球", @"台球", @"高尔夫球", @"橄榄球", @"雪碧", @"可乐", @"芬达", nil];
    }
    return _oneTitles;
}

- (NSMutableArray *)oneTitleImages {
    if (!_oneTitleImages) {
        _oneTitleImages = [NSMutableArray arrayWithObjects:@"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"yidingyue1", @"", nil];
    }
    return _oneTitleImages;
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
        style.title_big_scale = 1.0;
        style.line_height = 2.0;
        style.select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Light" size:14];
        style.line_color = RGB(150, 150, 150, 1.0);
        style.select_color = RGB(210, 29, 89, 1.0);
        style.title_image_bundel = Bundle;
        style.left_image_width = 30;
        style.title_spacing = 5;
        style.same_select_image_name = @"yidingyue1";
        style.same_un_select_image_name = @"weidingyue";
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
        style.title_big_scale = 1.2;
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
        style.is_show_line = NO;
        style.title_big_scale = 0.7;
        style.title_spacing = 5.0;
        style.un_select_title_font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        style.un_select_color = RGB(240, 240, 20, 1.0);
        style.select_color = RGB(255, 255, 255, 1.0);
        style.line_width_type = EqualTitle;
        _fourTitleView = [[LGFPageTitleView na] initWithStyle:style super_vc:self super_view:self.fourTitleSuperView page_view:self.pageView];
    }
    return _fourTitleView;
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
    [self.oneTitleView reloadAllTitles:self.oneTitles];
    [self.oneTitleView selectTitleForIndex:10];
    [self.twoTitleView reloadAllTitles:self.oneTitles];
    [self.twoTitleView selectTitleForIndex:10];
    [self.threeTitleView reloadAllTitles:self.oneTitles];
    [self.threeTitleView selectTitleForIndex:10];
    [self.fourTitleView reloadAllTitles:self.oneTitles];
    [self.fourTitleView selectTitleForIndex:10];
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
        [self.oneTitleView reloadAllTitles:self.oneTitles];
        [self.oneTitleView selectTitleForIndex:10];
        [self.twoTitleView reloadAllTitles:self.oneTitles];
        [self.twoTitleView selectTitleForIndex:10];
        [self.threeTitleView reloadAllTitles:self.oneTitles];
        [self.threeTitleView selectTitleForIndex:10];
        [self.fourTitleView reloadAllTitles:self.oneTitles];
        [self.fourTitleView selectTitleForIndex:10];
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
        [self.oneTitleView reloadAllTitles:self.twoTitles];
        [self.oneTitleView selectTitleForIndex:3];
        [self.twoTitleView reloadAllTitles:self.twoTitles];
        [self.twoTitleView selectTitleForIndex:3];
        [self.threeTitleView reloadAllTitles:self.twoTitles];
        [self.threeTitleView selectTitleForIndex:3];
        [self.fourTitleView reloadAllTitles:self.twoTitles];
        [self.fourTitleView selectTitleForIndex:3];
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
}

@end
