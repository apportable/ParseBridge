//
//  ParseImageView.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseImageView.h"

#import "ParseFile.h"
#import "GetDataCallback.h"
#import <BridgeKit/AndroidBitmap.h>

@implementation ParseImageView


+ (void)initializeJava
{
    [super initializeJava];
	
    [ParseImageView registerStaticMethod:@"create" selector:@selector(_create:object:) returnValue:[ParseImageView className] arguments:[AndroidContext className], [JavaClass intPrimitive], NULL];
    [ParseImageView registerStaticMethod:@"create" selector:@selector(_create:object:frame:) returnValue:[ParseImageView className] arguments:[AndroidContext className], [JavaClass intPrimitive], [AndroidRectF className], NULL];

    [ParseImageView registerInstanceMethod:@"getParseFile"
                             selector:@selector(parseFile)
                          returnValue:[ParseFile className]
                            arguments:nil];


    [ParseImageView registerInstanceMethod:@"getParseFile"
                             selector:@selector(parseFile)
                          returnValue:[ParseFile className]
                            arguments:nil];

    [ParseImageView registerInstanceMethod:@"setParseFile"
                             selector:@selector(setParseFile:)
                          returnValue:nil
                            arguments:[ParseFile className], nil];

    [ParseImageView registerInstanceMethod:@"setPlaceholder"
                             selector:@selector(setPlaceholder:)
                          returnValue:nil
                            arguments:[AndroidBitmap className], nil];

    [ParseImageView registerInstanceMethod:@"loadInBackground"
                             selector:@selector(loadInBackground)
                          returnValue:nil
                            arguments:nil];

    [ParseImageView registerInstanceMethod:@"loadInBackground"
                             selector:@selector(loadInBackground:)
                          returnValue:nil
                            arguments:[GetDataCallback className], nil];
}

+(NSString *)className
{
    return @"com.parsebridge.ParseBridgeImageView";
}

@end
