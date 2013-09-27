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

	//*- Java:  public ProgressCallback()
	[ProgressCallback registerConstructor];
	
	//*- Java:  public abstract void done(Integer percentDone)
	//*- iOS Bridge Method:  public abstract void done(Integer percentDone)
	//Override this function with the code you want to run after the save is complete.
	[ProgressCallback registerCallback:@"done"
						   selector:@selector(done:)
						returnValue:nil
						  arguments:[JavaInteger className], nil];
	
	
}

-(void)done:(int)percentDone{
	 		NSLog(@"%i",percentDone);
}


+ (NSString *)className
{
    return @"com.parse.ProgressCallback";
}


@end
