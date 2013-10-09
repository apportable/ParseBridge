/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron & Matt Hudson
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "ParseTwitterUtils.h"

#import "Parse.h"
#import "ParseTwitter.h"
#import "ParseUser.h"
#import "LogInCallback.h"
#import "SaveCallback.h"
#import "ParseTwitterUtilsShim.h"
#import <BridgeKit/AndroidActivity.h>

@implementation ParseTwitterUtils

+ (void)initializeJava
{
    [super initializeJava];

    [ParseTwitterUtils registerStaticMethod:@"getTwitter"
            selector:@selector(twitter)
            returnValue:[ParseTwitter className]
            arguments:nil];

    [ParseTwitterUtils registerStaticMethod:@"initialize"
            selector:@selector(initializeWithConsumerKey:consumerSecret:)
            returnValue:nil
            arguments:[NSString className], [NSString className], nil];

    [ParseTwitterUtils registerStaticMethod:@"isLinked"
            selector:@selector(isLinkedWithUser:)
            returnValue:[JavaClass boolPrimitive]
            arguments:[ParseUser className], nil];

    [ParseTwitterUtils registerStaticMethod:@"logIn"
            selector:@selector(logInWithTwitterId:screenName:authToken:authTokenSecret:callback:)
            returnValue:nil
            arguments:[NSString className], [NSString className], [NSString className], [NSString className], [LogInCallback className], nil];

    [ParseTwitterUtils registerStaticMethod:@"link"
            selector:@selector(linkUser:withTwitterId:screenName:authToken:authTokenSecret:callback:)
            returnValue:nil
            arguments:[ParseUser className], [NSString className], [NSString className], [NSString className], [NSString className], [SaveCallback className], nil];

    [ParseTwitterUtils registerStaticMethod:@"unlink"
            selector:@selector(unlinkUser:)
            returnValue:nil
            arguments:[ParseUser className], nil];

    [ParseTwitterUtils registerStaticMethod:@"unlinkInBackground"
            selector:@selector(unlinkUserInBackground:callback:)
            returnValue:nil
            arguments:[ParseUser className], [SaveCallback className], nil];
}

+(NSString *)className
{
    return @"com.parse.ParseTwitterUtils";
}
 
+ (void)logInWithCallback:(LogInCallback*)callback
{
    [ParseTwitterUtilsShim logInWithContext:[AndroidActivity currentActivity] callback:callback];
}

+ (void)linkUser:(ParseUser*)user callback:(SaveCallback *)callback
{
    [ParseTwitterUtilsShim linkUser:(ParseUser*)user withContext:[AndroidActivity currentActivity] callback:callback];
}

@end
