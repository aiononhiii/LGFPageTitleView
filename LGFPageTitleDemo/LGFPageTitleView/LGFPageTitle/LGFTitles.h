//
//  LGFTitles.h
//  LGFPageTitleView
//
//  Created by 来国锋 on 2018/3/24.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef LGFTitles_h
#define LGFTitles_h

#import "LGFPageTitleView.h"
#import "LGFPageTitleStyle.h"
#import "LGFTitleButton.h"
#import "LGFTitleLine.h"
#import "LGFMethod.h"
#import "UIView+LGF.h"
  
//********************** 帮助 ***************************
//本控件是一个特殊的分页控件，实现了title和page的分离，方便一些喜欢自由搭配的产品，主要为一些复杂的页面布局而打造
//本控件具体用法请参考该项目 https://github.com/aiononhiii/LGFPageTitleView
//有问题可以在github上提给我哦～
//******************************************************

#define Bundle [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"LGFPageTitle" ofType:@"bundle"]] ?: [NSBundle mainBundle]
#define RGB(A,B,C,D) [UIColor colorWithRed:A/255.0f green:B/255.0f blue:C/255.0f alpha:D]
#define RandomColor RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),^{block});
#define AFTER(time,block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{block});

#ifdef DEBUG
#define LGFLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define LGFLog(FORMAT, ...) nil
#endif

#endif /* LGFTitles_h */
