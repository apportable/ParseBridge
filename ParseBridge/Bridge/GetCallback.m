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

#import "GetCallback.h"
#import "ParseException.h"
#import "PFObject.h"
#import "ParseObject.h"

@implementation GetCallback

+ (void)initializeJava
{
    [super initializeJava];
}

+ (NSString *)className
{
    return @"com.parse.GetCallback";
}

@end

@implementation ParseBridgeGetCallback

@synthesize handler = _handler;

+ (void)initializeJava
{
    [super initializeJava];

	BOOL results;
	//*- Java:  public SaveCallback()
	results = [ParseBridgeGetCallback registerConstructor];
	NSLog(@"Registered constructor = %@", (results ? @"YES" : @"NO"));

	//*- Java:  public abstract void done(T object,ParseException e)
	//*- iOS Bridge Method:  -(void)done:(ParseUser*)user :(ParseException*)error;
	//Override this function with the code you want to run after the save is complete.
	results = [ParseBridgeGetCallback registerCallback:@"done"
							  selector:@selector(done:error:)
						   returnValue:nil
							 arguments:[ParseObject className],[ParseException className], nil];
	NSLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
}

+ (NSString *)className
{
    return @"com.parsebridge.ParseBridgeGetCallback";
}

+ (ParseBridgeGetCallback *)callbackWithHandler:(PFObjectResultBlock)handler
{
    ParseBridgeGetCallback *callback = [ParseBridgeGetCallback new];
    if (handler == nil)
    {
        callback.handler = ^(PFObject *obj, NSError *error){};
    }
    else
    {
        callback.handler = handler;
    }
    return callback; // NOTE: this is not autorelease but acts as if it is (because it is retained per the duration until the actual callback happens)
}

- (void)done:(ParseObject *)parseObject error:(ParseException *)exception
{
    NSError *error = nil;
    if (exception) {
        error = [NSError errorWithDomain:[exception localizedMessage] code:[exception getCode] userInfo:nil];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        PFObject *pfObject = [[[PFObject alloc] initWithParseObject:parseObject] autorelease];
        _handler(pfObject, error);
        [self autorelease]; // To balance the retain cycle created from the callbackWithHandler: method
    });
}

- (void)dealloc
{
    Block_release(_handler);
    _handler = nil;
    [super dealloc];
}


@end
