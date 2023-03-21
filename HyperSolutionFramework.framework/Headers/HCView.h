#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HCUnityView : UIView

@property (nonatomic, strong) UIView* _Nullable uView;

- (void)UnityPostMessage:(NSString* _Nonnull )gameObject methodName:(NSString* _Nonnull)methodName message:(NSString* _Nonnull) message;
- (void)unloadUnity;
- (void)pauseUnity:(BOOL * _Nonnull)pause;

@end
