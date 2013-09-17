/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron
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
#import "ParseObject.h"

@class ParseUser;
@class LogInCallback;
@class SignUpCallback;
@class RequestPasswordResetCallback;
@class ParseQuery;

@interface ParseUser : ParseObject

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *sessionToken;
@property (readonly, assign) BOOL isNew;

+ (ParseUser *) currentUser;
+ (void)logOut;
- (id)initUser;
- (BOOL)isAuthenticated;
- (void)forKey:(NSString *)key setObject:(id)value;
- (BOOL)isAuthenticated;
- (void)saveInBackground;
+ (void)enableAutomaticUser;
+ (void)enableAutomaticUser;
- (void)remove:(NSString*) key;
- (ParseUser *)fetch;
- (void)signUp;
- (void)signUpInBackground:(SignUpCallback*)callback;
+ (ParseUser*)logIn:(NSString*)username password:(NSString*)password;
+ (void)logInInBackground:(NSString*)username password:(NSString*)password callback:(LogInCallback*)callback;
+ (void)requestPasswordReset:(NSString*)email;
+ (void)requestPasswordResetInBackground:(NSString*)email callback:(RequestPasswordResetCallback*)callback;
- (ParseUser *)fetchIfNeeded;
- (BOOL)isNew;
+ (ParseQuery *)getQuery;

@end
