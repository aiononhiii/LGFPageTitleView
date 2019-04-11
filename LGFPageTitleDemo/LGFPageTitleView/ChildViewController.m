//
//  ChildViewController.m
//  LGFPageTitleView
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ChildViewController.h"
#import "MJRefresh.h"
#import "LGFTitles.h"

@interface ChildViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UICollectionView *childViewControllerCV;
@end

@implementation ChildViewController

+ (instancetype)GETSBVC {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:LGFBundle] instantiateViewControllerWithIdentifier:@"ChildViewController"];
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray new];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LGFRandomColor;
    self.childViewControllerCV.layer.cornerRadius = 10.0;
    self.titleLab.text = [NSString stringWithFormat:@"当前选中: %@", self.title];
    self.childViewControllerCV.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
    [self.childViewControllerCV.mj_header beginRefreshing];
    // 模拟加载数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.childViewControllerCV.mj_header endRefreshing];
        for (int i = 0; i < 30; i++) {
            [self.datas addObject:@""];
        }
        // 刷新界面
        [self.childViewControllerCV reloadData];
    });
}

#pragma mark - Collection View 数据源 和 代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width / 2, collectionView.frame.size.width / 2);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChildViewControllerCell" forIndexPath:indexPath];
    cell.layer.borderColor = LGFRGB(240, 240, 240, 1.0).CGColor;
    cell.layer.borderWidth = 0.5;
    return cell;
}

- (void)dealloc {
    LGFLog(@"ChildViewController已经释放 ----- dealloc");
}

@end
