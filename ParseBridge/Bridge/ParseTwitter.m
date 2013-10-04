
#import "ParseTwitter.h"

#import "Parse.h"

@implementation ParseTwitter

+ (void)initializeJava
{
    [super initializeJava];
  
    [ParseTwitter registerInstanceMethod:@"getConsumerKey"
                    selector:@selector(consumerKey)
                   returnValue:[NSString className]
                     arguments:nil];

    [ParseTwitter registerInstanceMethod:@"setConsumerKey"
                    selector:@selector(setConsumerKey:)
                   returnValue:nil
                     arguments:[NSString className], nil];

    [ParseTwitter registerInstanceMethod:@"getConsumerSecret"
                    selector:@selector(consumerSecret)
                   returnValue:[NSString className]
                     arguments:nil];
  
    [ParseTwitter registerInstanceMethod:@"setConsumerSecret"
                    selector:@selector(setConsumerSecret:)
                   returnValue:nil
                     arguments:[NSString className], nil];

    [ParseTwitter registerInstanceMethod:@"getAuthToken"
                    selector:@selector(authToken)
                   returnValue:[NSString className]
                     arguments:nil];
  
    [ParseTwitter registerInstanceMethod:@"setAuthToken"
                    selector:@selector(setAuthToken:)
                   returnValue:nil
                     arguments:[NSString className], nil];

    [ParseTwitter registerInstanceMethod:@"getAuthTokenSecret"
                    selector:@selector(authTokenSecret)
                   returnValue:[NSString className]
                     arguments:nil];
  
    [ParseTwitter registerInstanceMethod:@"setAuthTokenSecret"
                    selector:@selector(setAuthTokenSecret:)
                   returnValue:nil
                     arguments:[NSString className], nil];

    [ParseTwitter registerInstanceMethod:@"getUserId"
                    selector:@selector(userId)
                   returnValue:[NSString className]
                     arguments:nil];
  
    [ParseTwitter registerInstanceMethod:@"setUserId"
                    selector:@selector(setUserId:)
                   returnValue:nil
                     arguments:[NSString className], nil];

    [ParseTwitter registerInstanceMethod:@"getScreenName"
                    selector:@selector(screenName)
                   returnValue:[NSString className]
                     arguments:nil];

    [ParseTwitter registerInstanceMethod:@"setScreenName"
                    selector:@selector(setScreenName:)
                   returnValue:nil
                     arguments:[NSString className], nil]; 
}

+(NSString *)className
{
    return @"com.parse.twitter.Twitter";
}

@end

