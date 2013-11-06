#import "ParseFacebookUtilsShim.h"

#import "Parse.h"
#import "ParseUser.h"
#import "LogInCallback.h"
#import "SaveCallback.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/JavaList.h>

@implementation ParseFacebookUtilsShim

+ (void)initializeJava
{
    [super initializeJava];

    [ParseFacebookUtilsShim registerStaticMethod:@"logIn"
            selector:@selector(logInWithPermissions:activity:callback:)
            returnValue:nil
            arguments:[JavaList className], [AndroidActivity className], [LogInCallback className], nil];

    // [ParseFacebookUtilsShim registerStaticMethod:@"link"
    //         selector:@selector(linkUser:withContext:callback:)
    //         returnValue:nil
    //         arguments:[ParseUser className], [AndroidActivity className], [SaveCallback className], nil];
}

+(NSString *)className
{
    return @"com.parsebridge.ParseBridgeFacebookUtilsShim";
}

@end
