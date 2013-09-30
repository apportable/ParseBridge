//
//  ParseCloud.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <BridgeKit/JavaObject.h>

@class ParseObject;
@class FunctionCallback;

@interface ParseCloud : JavaObject

+ (JavaObject*)callFunction:(NSString*)name withParameters:(NSDictionary*)params;
+ (void)callFunctionInBackground:(NSString*)name withParameters:(NSDictionary*)params callback:(FunctionCallback*)callback;;

@end
