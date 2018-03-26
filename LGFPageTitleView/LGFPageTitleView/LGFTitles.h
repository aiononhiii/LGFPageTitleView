//
//  LGFTitles.h
//  LGFPageTitleView
//
//  Created by apple on 2018/3/24.
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

#define Bundle [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"YDFM" ofType:@"bundle"]] ?: [NSBundle mainBundle]

#ifdef DEBUG
#define LGFLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define LGFLog(FORMAT, ...) nil
#endif

#endif /* LGFTitles_h */
