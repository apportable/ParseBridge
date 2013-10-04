
#import <BridgeKit/JavaObject.h>

@class LogInCallback;
@class AndroidContext;

@interface ParseTwitterUtilsShim : JavaObject

+ (void)logInInBackgroundWithContext:(AndroidContext*)context callback:(LogInCallback*)callback;

@end
