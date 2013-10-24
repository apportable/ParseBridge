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

#import "ParseFile.h"
#import "GetDataCallback.h"
#import "ProgressCallback.h"
#import "SaveCallback.h"

@implementation ParseFile

+ (void)initializeJava
{
    [super initializeJava];
    
    [ParseFile registerConstructorWithSelector:@selector(initWithData:)
                                                arguments:[NSData className], nil];

    [ParseFile registerConstructorWithSelector:@selector(initWithName:data:)
                                              arguments:[NSString className],[NSData className], nil];
    

    [ParseFile registerInstanceMethod:@"getName"
                             selector:@selector(name)
                          returnValue:[NSString className]
                            arguments:nil];

    [ParseFile registerInstanceMethod:@"getUrl"
                             selector:@selector(url)
                          returnValue:[NSString className]
                            arguments:nil];

    [ParseFile registerInstanceMethod:@"isDirty"
                             selector:@selector(isDirty)
                          returnValue:[JavaClass boolPrimitive]
                            arguments:nil];

    [ParseFile registerInstanceMethod:@"isDataAvailable"
                             selector:@selector(isDataAvailable)
                          returnValue:[JavaClass boolPrimitive]
                            arguments:nil];

    [ParseFile registerInstanceMethod:@"getData"
                             selector:@selector(getData)
                          returnValue:[NSData className]
                            arguments:nil];

    [ParseFile registerInstanceMethod:@"getDataInBackground"
                             selector:@selector(getDataInBackground:)
                          returnValue:nil
                            arguments:[GetDataCallback className], nil];

    [ParseFile registerInstanceMethod:@"getDataInBackground"
                             selector:@selector(getDataInBackground:progress:)
                          returnValue:nil
                            arguments:[GetDataCallback className], [ProgressCallback className], nil];

    [ParseFile registerInstanceMethod:@"save"
                             selector:@selector(save)
                          returnValue:nil
                            arguments:nil];

    [ParseFile registerInstanceMethod:@"saveInBackground"
                             selector:@selector(saveInBackground:)
                          returnValue:nil
                            arguments:[SaveCallback className], nil];

    [ParseFile registerInstanceMethod:@"saveInBackground"
                             selector:@selector(saveInBackground)
                          returnValue:nil
                            arguments:nil];

    [ParseFile registerInstanceMethod:@"saveInBackground"
                             selector:@selector(saveInBackground:progress:)
                          returnValue:nil
                            arguments:[SaveCallback className], [ProgressCallback className], nil];

    [ParseFile registerInstanceMethod:@"cancel"
                             selector:@selector(cancel)
                          returnValue:nil
                            arguments:nil];
}
 

+ (NSString *)className
{
    return @"com.parse.ParseFile";
}

@end
