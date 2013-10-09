#import "ParseTwitterUtilsShim.h"

#import "Parse.h"
#import "ParseUser.h"
#import "LogInCallback.h"
#import "SaveCallback.h"
#import <BridgeKit/AndroidActivity.h>

@implementation ParseTwitterUtilsShim

+ (void)initializeJava
{
    [super initializeJava];

    [ParseTwitterUtilsShim registerStaticMethod:@"logIn"
            selector:@selector(logInWithContext:callback:)
            returnValue:nil
            arguments:[AndroidContext className], [LogInCallback className], nil];

    [ParseTwitterUtilsShim registerStaticMethod:@"link"
            selector:@selector(linkUser:withContext:callback:)
            returnValue:nil
            arguments:[ParseUser className], [AndroidContext className], [SaveCallback className], nil];
}

+(NSString *)className
{
    return @"com.parsebridge.ParseBridgeTwitterUtilsShim";
}

@end
