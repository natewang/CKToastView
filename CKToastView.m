//
//  CKToastView.m
//  催客网项目
//
//  Created by nate on 16/8/16.
//  Copyright © 2016年 TonyLi. All rights reserved.
//

#import "CKToastView.h"

typedef NS_ENUM(NSInteger, ShowType) {
    
    ShowTypeSuccess,
    ShowTypeError,
    ShowTypeInfo
};

@interface CKToastView ()

@property (nonatomic, copy) complectionBlock complection;

@end

@implementation CKToastView

+ (void)showSuccessWithStatus:(NSString *)str complection:(complectionBlock)complection
{
    [self show:ShowTypeSuccess status:str complection:complection];
}
+(void)showErrorWithStatus:(NSString *)str complection:(complectionBlock)complection
{
    [self show:ShowTypeError status:str complection:complection];
}

+ (void)showInfoWithStatus:(NSString *)str complection:(complectionBlock)complection
{
    [self show:ShowTypeInfo status:str complection:complection];
}

+ (void)show:(ShowType)showType status:(NSString *)status complection:(complectionBlock)complection
{
    static CKToastView *toastView;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        toastView = [[self alloc] initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds];
        [[NSNotificationCenter defaultCenter] addObserver:toastView selector:@selector(didDismiss:) name:SVProgressHUDDidDisappearNotification object:nil];
    });
    
    switch (showType) {
        case ShowTypeSuccess:
            [SVProgressHUD showSuccessWithStatus:status];
            break;
        case ShowTypeError:
            [SVProgressHUD showErrorWithStatus:status];
            break;
        case ShowTypeInfo:
            [SVProgressHUD showInfoWithStatus:status];
            break;
        default:
            break;
    }
    
    toastView.complection = complection;
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [UIApplication sharedApplication].windows.firstObject;
    }
    [window addSubview:toastView];
    [window bringSubviewToFront:toastView];
}

- (void)didDismiss:(NSNotification *)notification {
    
    [self removeFromSuperview];
    if (self.complection) {
        self.complection();
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SVProgressHUDDidDisappearNotification object:nil];
}


@end
