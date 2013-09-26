//
//  ParseRole.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//


#import <BridgeKit/JavaObject.h>
#import "ParseObject.h"

@class ParseACL;
@class ParseQuery;
@class ParseRelation;

@interface ParseRole : ParseObject

-(id)initWithName:(NSString*)name;
-(id)initWithNameandACL:(NSString*)name acl:(ParseACL*)acl;

- (NSString *)name;
- (void)setName:(NSString *)name;
- (ParseRelation *)users;
- (ParseRelation *)roles;

+ (ParseQuery *)query;

@end
