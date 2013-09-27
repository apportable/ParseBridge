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


#import "ParseUser.h"
#import "ParseQuery.h"
#import <BridgeKit/JavaClass.h>
#import "LogInCallback.h"
#import "SignUpCallback.h"
#import "RequestPasswordResetCallback.h"

@implementation ParseUser

+ (void)initializeJava
{
    [super initializeJava];
	
	BOOL result;
	[ParseUser registerConstructorWithSelector:@selector(initUser)
                                       arguments:nil];
	
	//*- ObjC: + currentUser
    [ParseUser registerStaticMethod:@"getCurrentUser"
						selector:@selector(currentUser)
					 returnValue:[ParseUser className]
					   arguments:nil];

	[ParseUser registerStaticMethod:@"logOut"
								 selector:@selector(logOut)
								 returnValue:nil
					   arguments:nil];
					   
    //*- Java: public void put(String key, Object value)
    //*- ObjC: - setObject:(id) forKey:(NSString*)
    [ParseUser registerInstanceMethod:@"put"
                               selector:@selector(forKey:setObject:)
                            returnValue:nil
                              arguments:[NSString className],[JavaObject className],nil];

    //*- Java: public boolean isAuthenticated()
    //*- ObjC: - (BOOL)isAuthenticated
	[ParseUser registerInstanceMethod:@"isAuthenticated"
                               selector:@selector(isAuthenticated)
                            returnValue:[JavaClass boolPrimitive]
                              arguments:nil];

    //*- Java: public final void saveInBackground()
    //*- ObjC: - saveInBackground
    [ParseUser registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
                            returnValue:nil];

    //*- Java: public static void enableAutomaticUser()
    //*- ObjC: + enableAutomaticUser
    [ParseUser registerStaticMethod:@"enableAutomaticUser"
                           selector:@selector(enableAutomaticUser)
                        returnValue:nil
                          arguments:nil];

 

	//*- Java: public void remove(String key)
	//*-  ObjC: -(void)remove:(NSString*) key;
	//Description copied from class: ParseObject
    [ParseUser registerInstanceMethod:@"remove"
							 selector:@selector(remove:)
						  returnValue:nil
							arguments:[NSString className],nil];


	//*- Java: public void setUsername(String username)
	//*-  ObjC: -(void)setUsername:(NSString*)username;
	//Sets the username. Usernames cannot be null or blank.
    [ParseUser registerInstanceMethod:@"setUsername"
							 selector:@selector(setUsername:)
						  returnValue:nil
							arguments:[NSString className],nil];


	//*- Java: public String getUsername()
	//*- ObjC: -(NSString*)getUsername;
	//Retrieves the username.
    [ParseUser registerInstanceMethod:@"getUsername"
							 selector:@selector(username)
						  returnValue:[NSString className]
							arguments:nil];
 

	//*- Java: public void setPassword(String password)
	//*-  ObjC: -(void)setPassword:(NSString*)password;
	//Sets the password.
    [ParseUser registerInstanceMethod:@"setPassword"
							 selector:@selector(setPassword:)
						  returnValue:nil
							arguments:[NSString className],nil];
 
	//*- Java: public void setEmail(String email)
	//*- ObjC: -(void)setEmail:(NSString*)email;
	//Sets the email address.
    [ParseUser registerInstanceMethod:@"setEmail"
							 selector:@selector(setEmail:)
						  returnValue:nil
							arguments:[NSString className],nil];

	//*- Java: public String getEmail()
	//*- ObjC: -(NSString*)getEmail;
	//Retrieves the email address.
    [ParseUser registerInstanceMethod:@"getEmail"
							 selector:@selector(email)
						  returnValue:[NSString className]
							arguments:nil];
 
 
	//public String getSessionToken()
	//*-  ObjC: -(NSString*)getSessionToken;
	//Retrieves the session token for a user, if they are logged in.
    [ParseUser registerInstanceMethod:@"getSessionToken"
							 selector:@selector(sessionToken)
						  returnValue:[NSString className]
							arguments:nil];

	//*- Java: public ParseUser fetch()
	//*- ObjC: -(ParseUser*)fetch;
	//Description copied from class: ParseObject
    [ParseUser registerInstanceMethod:@"fetch"
							 selector:@selector(fetch)
						  returnValue:[ParseUser className]
							arguments:nil];
 

	//*- Java: public void signUp()
	//*- ObjC: -(void)signUp;
    [ParseUser registerInstanceMethod:@"signUp"
							 selector:@selector(signUp)
						  returnValue:nil
							arguments:nil];
	//Signs up a new user. You should call this instead of ParseObject.save() for new ParseUsers. This will create a new ParseUser on the server, and also persist the session on disk so that you can access the user using ParseUser.getCurrentUser(). A username and password must be set before calling signUp.Typically, you should use ParseUser.signUpInBackground(com.parse.SignUpCallback) instead of this, unless you are managing your own threading.


	//*- Java: public void signUpInBackground(SignUpCallback callback)
	//*- ObjC: -(void)signUpInBackground:(SignUpCallback*)callback;
    [ParseUser registerInstanceMethod:@"signUpInBackground"
							 selector:@selector(signUpInBackground:)
						  returnValue:nil
							arguments:[SignUpCallback className],nil];
	//Signs up a new user. You should call this instead of ParseObject.save() for new ParseUsers. This will create a new ParseUser on the server, and also persist the session on disk so that you can access the user using ParseUser.getCurrentUser(). This is preferable to using ParseUser.signUp(), unless your code is already running from a background thread.


	//*- Java: public static ParseUser logIn(String username,String password)
	//*-  ObjC: +(ParseUser*)logIn:(NSString*)username password:(NSString*)password;
    [ParseUser registerStaticMethod:@"logIn"
                           selector:@selector(logIn:password:)
                        returnValue:[ParseUser className]
                          arguments:[NSString className],[NSString className],nil];
	//Logs in a user with a username and password. On success, this saves the session to disk, so you can retrieve the currently logged in user using ParseUser.getCurrentUser()  Typically, you should use ParseUser.logInInBackground(java.lang.String, java.lang.String, com.parse.LogInCallback) instead of this, unless you are managing your own threading.


	//*- Java: public static void logInInBackground(String username,String password,LogInCallback callback)
	//*- ObjC: +(void)logInInBackground:(NSString*)username password:(NSString*)password callback:(LogInCallback*)callback;
	[ParseUser registerStaticMethod:@"logInInBackground"
                           selector:@selector(logInInBackground:password:callback:)
                        returnValue:nil
                          arguments:[NSString className],[NSString className],[LogInCallback className], nil];
	//Logs in a user with a username and password. On success, this saves the session to disk, so you can retrieve the currently logged in user using ParseUser.getCurrentUser() This is preferable to using ParseUser.logIn(java.lang.String, java.lang.String), unless your code is already running from a background thread.


	//*- Java: public static void requestPasswordReset(String email)
	//*- ObjC: +(void)requestPasswordReset:(NSString*)email;
	//Requests a password reset email to be sent to the specified email address associated with the user account. This email allows the user to securely reset their password on the Parse site. Typically, you should use ParseUser.requestPasswordResetInBackground(java.lang.String, com.parse.RequestPasswordResetCallback) instead of this, unless you are managing your own threading.
	[ParseUser registerStaticMethod:@"requestPasswordReset"
                           selector:@selector(requestPasswordReset:)
                        returnValue:nil
                          arguments:[NSString className], nil];

	//*- Java:  public static void requestPasswordResetInBackground(String email,RequestPasswordResetCallback callback)
	//*- ObjC: +(void)requestPasswordResetInBackground:(NSString*)email callback:(RequestPasswordResetCallback*)callback;
	//Requests a password reset email to be sent in a background thread to the specified email address associated with the user account. This email allows the user to securely reset their password on the Parse site. This is preferable to using requestPasswordReset(), unless your code is already running from a background thread.
	[ParseUser registerStaticMethod:@"requestPasswordResetInBackground"
                           selector:@selector(requestPasswordResetInBackground:callback:)
                        returnValue:nil
                          arguments:[NSString className], [RequestPasswordResetCallback className], nil];

	//*- Java: public ParseUser fetchIfNeeded()
	//*- ObjC: -(void)fetchIfNeeded;
    [ParseUser registerInstanceMethod:@"fetchIfNeeded"
							 selector:@selector(fetchIfNeeded)
						  returnValue:[ParseUser className]
							arguments:nil];

	//*- Java: public boolean isNew()
	//*- ObjC: -(void)isNew;
	//Indicates whether this ParseUser was created during this session through a call to ParseUser.signUp() or by logging in with a linked service such as Facebook.
    [ParseUser registerInstanceMethod:@"isNew"
							 selector:@selector(isNew)
						  returnValue:[JavaClass boolPrimitive]
							arguments:nil];

	//*- Java: public static ParseQuery<ParseUser> getQuery()
	//*-  ObjC: -(ParseQuery*)getQuery;
	//Constructs a query for ParseUsers.
    [ParseUser registerStaticMethod:@"getQuery"
							 selector:@selector(getQuery)
						  returnValue:[ParseQuery className]
							arguments:nil];
  
}



+ (NSString *)className
{
    return @"com.parse.ParseUser";
}

@end
