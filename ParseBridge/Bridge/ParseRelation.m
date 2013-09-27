//
//  ParseRelation.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseRelation.h"
#import "ParseObject.h"
#import "ParseQuery.h"

@implementation ParseRelation



+ (void)initializeJava
{
    [super initializeJava];
	
	//*- Java:  public void add(T object)
	//*- ObjC:  -(void)add:(ParseObject*)object;
	[ParseRelation registerInstanceMethod:@"add"
													selector:@selector(addObject:)
												 returnValue:nil
												   arguments:[ParseObject className],nil];
		
	//*- Java:  public void remove(T object)
	//*- ObjC:  -(void)remove:(ParseObject*)object;
	[ParseRelation registerInstanceMethod:@"remove"
											   selector:@selector(removeObject:)
											returnValue:nil
											  arguments:[ParseObject className],nil];
		
	//*- Java:  public ParseQuery<T> getQuery()
	//*- ObjC:  -(ParseQuery*)getQuery;
	[ParseRelation registerInstanceMethod:@"getQuery"
										  selector:@selector(query)
									   returnValue:[ParseQuery className]
										 arguments:nil];

	
}


+ (NSString *)className
{
    return @"com.parse.ParseRelation";
}

@end
