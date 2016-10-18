//
//  CKToastView.h
//  催客网项目
//
//  Created by nate on 16/8/16.
//  Copyright © 2016年 TonyLi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^complectionBlock)();

@interface CKToastView : UIView

+ (void)showSuccessWithStatus:(NSString *)str complection:(complectionBlock)complection;

+ (void)showErrorWithStatus:(NSString *)str complection:(complectionBlock)complection;

+ (void)showInfoWithStatus:(NSString *)str complection:(complectionBlock)complection;

@end
