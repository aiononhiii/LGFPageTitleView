//
//  ViewController.m
//  LGFPageTitleView
//
//  Created by apple on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LGFPageTitleView.h"
#import "LGFTitles.h"

//pragma mark /-----------------  设置颜色  --------------------/
#define UIColorRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define RGB(A,B,C,D) [UIColor colorWithRed:A/255.0f green:B/255.0f blue:C/255.0f alpha:D]
//随机色
#define RandomColor UIColorRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *pageTitleView;
@property (weak, nonatomic) IBOutlet UICollectionView *pageView;
@property (strong, nonatomic) LGFPageTitleView *titleView;
@property (strong, nonatomic) NSArray *childVCs;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _childVCs = @[@"我", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河"];
    
    LGFPageTitleStyle *style = [LGFPageTitleStyle na];
    style.titles = @[@"我", @"地球", @"太阳系", @"宇宙银宇宙银宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地宇宙银宇宙银宇宙银宇宙银宇宙银宇宙银宇宙银宇宙银球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河宇宙银宇宙银宇宙银", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇银河", @"地", @"太阳宇宙银宇宙银宇宙银宇宙银系", @"宇宙银河", @"球", @"太系", @"宇宙银宇宙银宇宙银宇宙银宇宙银", @"地球", @"太阳系", @"宇宙银河", @"地球", @"太阳系", @"宇宙银河"];
    style.title_big_scale = 1.1;
    style.line_height = 2.0;
    style.line_width = 30;
    style.select_color = RGB(210, 29, 89, 1.0);
    style.line_width_type = FixedWith;
    
    _titleView = [[LGFPageTitleView na] initWithStyle:style super_view:_pageTitleView page_view:_pageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View DataSource And Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _childVCs.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testcell" forIndexPath:indexPath];
    cell.backgroundColor = RandomColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 必须设置
    [_titleView autoScrollTitle];
}

@end
