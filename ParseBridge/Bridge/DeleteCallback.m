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

#import "DeleteCallback.h"
#import "ParseException.h"

@implementation DeleteCallback

@synthesize handler = _handler;

+ (void)initializeJava
{
    [super initializeJava];

	BOOL results;
	//*- Java:  public SaveCallback()
    results = [DeleteCallback registerConstructor];
	NSLog(@"Registered constructor = %@", (results ? @"YES" : @"NO"));

	//*- Java:  public abstract void done(ParseException e)
	//*- iOS Bridge Method:  -(void)done:(ParseException*)error;
	//Override this function with the code you want to run after the save is complete.
	results = [DeleteCallback registerCallback:@"done"
						 selector:@selector(done:)
					  returnValue:nil
						arguments:[ParseException className], nil];
	NSLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
}

+ (NSString *)className
{
    return @"com.parsebridge.ParseBridgeDeleteCallback";
}

+ (DeleteCallback *)callbackWithHandler:(PFBooleanResultBlock)handler
{
    DeleteCallback *callback = [DeleteCallback new];
    callback.handler = handler;
    return [callback autorelease];
}

- (void)done:(ParseException*)exception
{
    NSError *error = nil;
	if (exception) {
        error = [NSError errorWithDomain:[exception localizedMessage] code:[exception getCode] userInfo:nil];
	}
    if (_handler) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _handler(YES, error);
        });
    }
}

- (void)dealloc
{
    Block_release(_handler);
    _handler = nil;
    [super dealloc];
}


@end
