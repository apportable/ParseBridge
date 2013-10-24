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
#import "ProgressCallback.h"
#import "ParseException.h"

#import <BridgeKit/JavaClass.h>
#import <BridgeKit/JavaNumbers.h>

@implementation ProgressCallback

+ (void)initializeJava
{
    [super initializeJava];
}

+ (NSString *)className
{
    return @"com.parse.ProgressCallback";
}
@end

@implementation ParseBridgeProgressCallback

@synthesize handler = _handler;

+ (void)initializeJava
{
    [super initializeJava];

    //*- Java:  public ProgressCallback()
    [ParseBridgeProgressCallback registerConstructor];
    
    //*- Java:  public abstract void done(Integer percentDone)
    //*- iOS Bridge Method:  public abstract void done(Integer percentDone)
    //Override this function with the code you want to run after the save is complete.
    [ParseBridgeProgressCallback registerCallback:@"done"
                           selector:@selector(done:)
                        returnValue:nil
                          arguments:[JavaInteger className], nil];
    
    
}

+ (NSString *)className
{
    return @"com.parsebridge.ParseBridgeProgressCallback";
}

+ (ParseBridgeProgressCallback *)callbackWithHandler:(PFProgressBlock)handler
{
    ParseBridgeProgressCallback *callback = [ParseBridgeProgressCallback new];
    if (handler == nil)
    {
        callback.handler = ^(int progress){};
    }
    else
    {
        callback.handler = handler;
    }

    return callback; // NOTE: this is not autorelease but acts as if it is (because it is retained per the duration until the actual callback happens)
}

- (void)done:(JavaInteger*)percentDoneInteger
{
    int percentDone = [percentDoneInteger intValue];
    dispatch_async(dispatch_get_main_queue(), ^{
        _handler(percentDone);
    });

    if (percentDone == 100) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self autorelease]; // To balance the retain cycle created from the callbackWithHandler: method
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
