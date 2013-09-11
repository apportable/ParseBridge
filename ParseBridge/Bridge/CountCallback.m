//
//  CountCallBack.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "CountCallback.h"
#import "ParseException.h"

@implementation CountCallback

+ (void)initializeJava
{
    [super initializeJava];
}

+ (NSString *)className
{
    return @"com.parse.CountCallback";
}

@end

@implementation ParseBridgeCountCallback

@synthesize handler = _handler;

+ (void)initializeJava
{
    [super initializeJava];
    BOOL results;

    results = [ParseBridgeCountCallback registerConstructor];

    results = [ParseBridgeCountCallback registerCallback:@"done"
                          selector:@selector(done:error:)
                       returnValue:nil
                         arguments:[JavaClass intPrimitive], [ParseException className], nil];
}

+ (NSString *)className
{
    return @"com.parsebridge.ParseBridgeCountCallback";
}

+ (ParseBridgeCountCallback *)callbackWithHandler:(PFIntegerResultBlock)handler
{
    ParseBridgeCountCallback *callback = [ParseBridgeCountCallback new];
    if (handler == nil)
    {
        callback.handler = ^(int objects, NSError *error){};
    }
    else
    {
        callback.handler = handler;
    }
    return callback; // NOTE: this is not autorelease but acts as if it is (because it is retained per the duration until the actual callback happens)
}

- (void)done:(int)count error:(ParseException*)exception
{
    NSError *error = nil;
    if (exception) {
        error = [NSError errorWithDomain:[exception localizedMessage] code:[exception getCode] userInfo:nil];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        _handler(count, error);
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
