#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UnityFramework/UnityFramework.h>

@protocol UnityAppController <UIApplicationDelegate, UnityFrameworkListener>

- (UIWindow *)window;
- (UIView *)rootView;
- (UnityView *)unityView;

@end

@protocol HCUnityFramework <NSObject>

+ (id<HCUnityFramework>)getInstance;
- (id<UnityAppController>)appController;

//- (void)setExecuteHeader:(const typeof(_mh_execute_header)*)header;
- (void)setDataBundleId:(const char*)bundleId;

- (void)registerFrameworkListener:(id<HCUnityFramework>)obj;
- (void)unregisterFrameworkListener:(id<HCUnityFramework>)obj;
- (void)frameworkWarmup:(int)argc argv:(char*[])argv;

- (void)runEmbeddedWithArgc:(int)argc argv:(char*[])argv appLaunchOpts:(NSDictionary*)appLaunchOpts;

- (void)unloadApplication;

- (void)showUnityWindow;

- (void)quitApplication:(int)exitCode;

- (void)pause:(bool)pause;

- (void)sendMessageToGOWithName:(const char*)goName functionName:(const char*)name message:(const char*)msg;

@end

@interface HCUnity: NSObject

@property (atomic, class) id<HCUnityFramework> ufw;

+ (id<HCUnityFramework>)launchWithOptions:(NSDictionary*)launchOptions;

@end
