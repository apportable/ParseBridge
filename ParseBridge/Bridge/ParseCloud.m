//
//  ParseCloud.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseCloud.h"
#import "FunctionCallback.h"
#import "ParseObject.h"
#import <BridgeKit/JavaMap.h>

@implementation ParseCloud

+ (void)initializeJava
{
    [super initializeJava];

    [ParseCloud registerConstructor];

    [ParseCloud registerStaticMethod:@"callFunction"
                                      selector:@selector(callFunction:withParameters:)
                                   returnValue:[JavaObject className]
                                     arguments:[NSString className], [JavaMap className],nil];  
    
    [ParseCloud registerStaticMethod:@"callFunctionInBackground"
                                      selector:@selector(callFunctionInBackground:withParameters:callback:)
                                   returnValue:nil
                                     arguments:[NSString className], [JavaMap className],[FunctionCallback className],nil]; 
    
}

+ (NSString *)className
{
    return @"com.parse.ParseCloud";
}


@end
