
#import <BridgeKit/JavaObject.h>

@interface ParseTwitter : JavaObject

- (NSString*)consumerKey;
- (void)setConsumerKey:(NSString*)key;
- (NSString*)consumerSecret;
- (void)setConsumerSecret:(NSString*)secret;
- (NSString*)authToken;
- (void)setAuthToken:(NSString*)token;
- (NSString*)authTokenSecret;
- (void)setAuthTokenSecret:(NSString*)secret;
- (NSString*)userId;
- (void)setUserId:(NSString*)userId;
- (NSString*)screenName;
- (void)setScreenName:(NSString*)name;

@end
