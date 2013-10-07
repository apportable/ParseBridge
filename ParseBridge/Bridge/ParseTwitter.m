
#import "ParseTwitter.h"

#import "Parse.h"
#import <BridgeKit/AndroidHttpUriRequest.h>

@interface ParseTwitter ()
- (void)signAndroidRequest:(AndroidHttpRequest*)request;
@end

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

    [ParseTwitter registerInstanceMethod:@"signRequest"
                    selector:@selector(signAndroidRequest:)
                   returnValue:nil
                     arguments:@"org.apache.http.client.methods.HttpUriRequest", nil]; 

}

+(NSString *)className
{
    return @"com.parse.twitter.Twitter";
}

- (void)signRequest:(NSMutableURLRequest*)request
{
    NSDictionary *oldHeaders = [request allHTTPHeaderFields];
    NSLog(@"old headers: %@", oldHeaders);

    AndroidHttpRequest *androidRequest = [[AndroidHttpRequest alloc] initWithRequest:request];

    [self signAndroidRequest:androidRequest];
    NSDictionary *signedHeaders = [androidRequest allHeaders] ;
    NSLog(@"signed headers: %@", signedHeaders);

    [request setAllHTTPHeaderFields:signedHeaders];

    [androidRequest release];
}


@end

