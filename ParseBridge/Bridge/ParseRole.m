//
//  ParseRole.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseRole.h"
#import "ParseACL.h"
#import "ParseQuery.h"
#import "ParseRelation.h"

@implementation ParseRole

+ (void)initializeJava
{
    [super initializeJava];
    
    [ParseRole registerConstructorWithSelector:@selector(initWithName:)
                                                    arguments:[NSString className], nil];
            
    [ParseRole registerConstructorWithSelector:@selector(initWithNameandACL:acl:)
                                    arguments:[NSString className],[ParseACL className], nil];
            
    [ParseRole registerStaticMethod:@"getQuery"
                                    selector:@selector(query)
                                    returnValue:[ParseQuery className]
                                    arguments:nil];

    [ParseRole registerInstanceMethod:@"getName"
                                    selector:@selector(name)
                                    returnValue:[NSString className]
                                    arguments:nil];
    
    [ParseRole registerInstanceMethod:@"setName"
                                    selector:@selector(setName:)
                                    returnValue:nil
                                    arguments:[NSString className],nil];

    [ParseRole registerInstanceMethod:@"getUsers"
                                    selector:@selector(users)
                                    returnValue:[ParseRelation className]
                                    arguments:nil];

    [ParseRole registerInstanceMethod:@"getRoles"
                                    selector:@selector(roles)
                                    returnValue:[ParseRelation className]
                                    arguments:nil];                          
}

+(NSString *)className
{
    return @"com.parse.ParseRole";
}

@end
