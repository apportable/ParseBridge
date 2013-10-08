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

#import <BridgeKit/JavaObject.h>

@class ParseTwitter;
@class ParseUser;
@class LogInCallback;
@class AndroidContext;
@class ParseBridgeSaveCallback;

@interface ParseTwitterUtils : JavaObject

+ (ParseTwitter *)twitter;
+ (void)initializeWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret;
+ (BOOL)isLinkedWithUser:(ParseUser *)user;

+ (void)logInInBackgroundWithCallback:(LogInCallback*)callback;


+ (void)unlinkUser:(ParseUser *)user;
+ (void)unlinkUserInBackground:(ParseUser *)user;
+ (void)unlinkUserInBackground:(ParseUser *)user callback:(ParseBridgeSaveCallback*)callback;

// + (void)logInWithBlock:(PFUserResultBlock)block;
// + (void)logInWithTarget:(id)target selector:(SEL)selector;
// + (void)logInWithTwitterId:(NSString *)twitterId
//                 screenName:(NSString *)screenName
//                  authToken:(NSString *)authToken
//            authTokenSecret:(NSString *)authTokenSecret
//                      block:(PFUserResultBlock)block;
// + (void)logInWithTwitterId:(NSString *)twitterId
//                 screenName:(NSString *)screenName
//                  authToken:(NSString *)authToken
//            authTokenSecret:(NSString *)authTokenSecret
//                     target:(id)target
//                   selector:(SEL)selector;
// + (void)linkUser:(PFUser *)user;
// + (void)linkUser:(PFUser *)user block:(PFBooleanResultBlock)block;
// + (void)linkUser:(PFUser *)user
//           target:(id)target
//         selector:(SEL)selector;
// + (void)linkUser:(PFUser *)user
//        twitterId:(NSString *)twitterId
//       screenName:(NSString *)screenName
//        authToken:(NSString *)authToken
//  authTokenSecret:(NSString *)authTokenSecret
//            block:(PFBooleanResultBlock)block;
// + (void)linkUser:(PFUser *)user
//        twitterId:(NSString *)twitterId
//       screenName:(NSString *)screenName
//        authToken:(NSString *)authToken
//  authTokenSecret:(NSString *)authTokenSecret
//           target:(id)target
//         selector:(SEL)selector;

@end
