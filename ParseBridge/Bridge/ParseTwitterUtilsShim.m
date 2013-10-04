#import "ParseTwitterUtilsShim.h"

#import "Parse.h"
#import "ParseTwitter.h"
#import "LogInCallback.h"
#import <BridgeKit/AndroidActivity.h>

@implementation ParseTwitterUtilsShim

+ (void)initializeJava
{
    [super initializeJava];

    [ParseTwitterUtilsShim registerStaticMethod:@"logIn"
            selector:@selector(logInInBackgroundWithContext:callback:)
            returnValue:nil
            arguments:[AndroidContext className], [LogInCallback className], nil];
	
}

+(NSString *)className
{
    return @"com.parsebridge.ParseBridgeTwitterUtilsShim";
}
 
 
  //*- Java: public static com.parse.twitter.Twitter getTwitter()
  //Gets the shared Twitter singleton that Parse is using.
  
  //*- Java:public static void initialize(String consumerKey,String consumerSecret)
  //Initializes Twitter for use with Parse. This method must be invoked prior to calling ParseTwitterUtils.link(ParseUser, Context, SaveCallback) and ParseTwitterUtils.logIn(Context, LogInCallback).
 
 
  //*- Java:public static boolean isLinked(ParseUser user)
  //Returns true if the user is linked to a Twitter account.

  //*- Java: public static void link(ParseUser user,Context context)
  
  //*- Java:public static void link(ParseUser user,Context context,SaveCallback callback)
  //Links a ParseUser to a Twitter account, allowing you to use Twitter for authentication, and providing access to Twitter data for the user. A dialog will be shown to the user for Twitter authentication.
 
  //*- Java:public static void link(ParseUser user,String twitterId,String screenName,String authToken,String authTokenSecret)
  
  //*- Java:public static void link(ParseUser user,String twitterId, String screenName,String authToken,String authTokenSecret, SaveCallback callback)
  //Links a ParseUser to a Twitter account, allowing you to use Twitter for authentication, and providing access to Twitter data for the user. This method allows you to handle getting the auth tokens for your users, rather than delegating to the provided dialog log-in.
 
 
  //*- Java: public static void logIn(String twitterId,String screenName,String authToken, String authTokenSecret,LogInCallback callback)
  //Logs in a ParseUser using Twitter for authentication. If a user for the given Twitter credentials does not already exist, a new user will be created. This method allows you to handle getting the auth tokens for your users, rather than delegating to the provided dialog log-in.
  
 
  //*- Java: public static void logIn(Context context,LogInCallback callback)
  //Logs in a ParseUser using Twitter for authentication. If a user for the given Twitter credentials does not already exist, a new user will be created. A dialog will be shown to the user for Twitter authentication.
  
 
   //*- Java: public static void unlink(ParseUser user)
  
 
   //*- Java:public static void unlinkInBackground(ParseUser user)
   
   //*- Java: public static void unlinkInBackground(ParseUser user,SaveCallback callback)
  //Unlinks a user from a Twitter account in the background. Unlinking a user will save the user's data.

 

@end
