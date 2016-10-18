# CKToastView
项目中的提示用的是[SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)，可是没办法实现提示完成后，立即进行一些操作。
所以写了一个带block的扩展。
```
+ (void)showSuccessWithStatus:(NSString *)str complection:(complectionBlock)complection;

+ (void)showErrorWithStatus:(NSString *)str complection:(complectionBlock)complection;

+ (void)showInfoWithStatus:(NSString *)str complection:(complectionBlock)complection;
```
