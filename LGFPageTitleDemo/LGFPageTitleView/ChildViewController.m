//
//  ChildViewController.m
//  LGFPageTitleView
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ChildViewController.h"
#import "LGFTitles.h"

@interface ChildViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@implementation ChildViewController

+ (instancetype)GETSBVC {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:Bundle] instantiateViewControllerWithIdentifier:@"ChildViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RandomColor;
    _titleLab.text = [NSString stringWithFormat:@"当前选中: %@", self.title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
