#import "HCView.h"
#import "HCUnity.h"

NSDictionary* appLaunchOpts;

@implementation HCUnityView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _uView = [[[HCUnity launchWithOptions:appLaunchOpts] appController] rootView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [_uView removeFromSuperview];
    _uView.frame = self.bounds;
    [self insertSubview:_uView atIndex:0];
}

- (void)pauseUnity:(BOOL * _Nonnull)pause
{
  if ([HCUnity ufw]) {
    [[HCUnity ufw] pause:pause];
  }
}

- (void)unloadUnity
{
    UIWindow * main = [[[UIApplication sharedApplication] delegate] window];
    if(main != nil) {
        [main makeKeyAndVisible];
        if ([HCUnity ufw]) {
            [[HCUnity ufw] unloadApplication];
        }
    }
}

- (void)UnityPostMessage:(NSString*)gameObject methodName:(NSString*)methodName message:(NSString*) message {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[HCUnity ufw] sendMessageToGOWithName:[gameObject UTF8String] functionName:[methodName UTF8String] message:[message UTF8String]];
    });
}

- (void)sendMessageToMobileApp:(NSString *)message {
//    if (self.onUnityMessage) {
//        NSDictionary* data = @{
//            @"message": message
//        };
//
//        self.onUnityMessage(data);
//    }
}

- (void)unityDidUnload:(NSNotification*)notification {
//    [[HCUnity ufw] unregisterFrameworkListener:self];
    [HCUnity setUfw: nil];

//    if (self.onPlayerUnload) {
//        self.onPlayerUnload(nil);
//    }
}

- (void)unityDidQuit:(NSNotification*)notification {
//    [[HCUnity ufw] unregisterFrameworkListener:self];
    [HCUnity setUfw: nil];

//    if (self.onPlayerQuit) {
//        self.onPlayerQuit(nil);
//    }
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator {
  NSLog(@"this is log %@", context);
}

@end
