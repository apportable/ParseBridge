
#import <BridgeKit/JavaObject.h>

@class LogInCallback;
@class SaveCallback;
@class AndroidContext;
@class ParseUser;

@interface ParseTwitterUtilsShim : JavaObject

+ (void)logInWithContext:(AndroidContext*)context callback:(LogInCallback*)callback;
+ (void)linkUser:(ParseUser*)user withContext:(AndroidContext*)context callback:(SaveCallback*)callback;

@end
