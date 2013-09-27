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

#import "ParseQuery.h"
#import "ParseObject.h"
#import "ParseGeoPoint.h"
#import <BridgeKit/JavaClass.h>
#import <BridgeKit/JavaList.h>
#import "GetCallback.h"
#import "CountCallback.h"
#import  "FindCallback.h"



@implementation ParseQuery

+ (void)initializeJava
{
    [super initializeJava];

	//*- Java:  public ParseQuery(Class<T> subclass)
	//*- iOS Bridge Method:  -(ParseQuery*)initWithParseObject:(ParseObject*)object;
	[ParseQuery registerConstructorWithSelector:@selector(initWithParseObject:)
                                      arguments:[JavaClass className], nil];
				
	//*- Java:  public ParseQuery(String theClassName)
	//*- iOS Bridge Method:  -(ParseQuery*)initWithClassName:(NSString*)theClassName;
    [ParseQuery registerConstructorWithSelector:@selector(initWithClassName:)
                                      arguments:[NSString className], nil];
	
	
	//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(String className)
	//*- iOS Bridge Method: -(ParseQuery*)queryWithClassName:(NSString*)theClassName;
    [ParseQuery registerStaticMethod:@"getQuery"
                            selector:@selector(queryWithClassName:)
                         returnValue:[ParseQuery className]
                           arguments:[NSString className], nil];
				
	//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(Class<T> subclass)
	//*- iOS Bridge Method: -(ParseQuery*)queryWithObject:(ParseObject*)object;
    [ParseQuery registerStaticMethod:@"getQuery"
                            selector:@selector(queryWithObject:)
                         returnValue:[ParseQuery className]
                           arguments:[JavaClass className], nil];
	
	//*- Java:  public T get(String theObjectId)
	//*- iOS Bridge Method: -(ParseObject*)get:(NSString*)objectID;
	//Constructs a ParseObject whose id is already known by fetching data from the server.
	[ParseQuery registerInstanceMethod:@"get"
							selector:@selector(get:)
						 returnValue:[ParseObject className]
						   arguments:[NSString className], nil];
	
	//Constructs a ParseObject whose id is already known by fetching data from the server. This mutates the ParseQuery.
	
	//*- Java: public void getInBackground(String objectId,GetCallback<T> callback)
	//*- iOS Bridge Method: -(void)getInBackground:(NSString*)objectID callback:(GetCallback*)callback;
	[ParseQuery registerInstanceMethod:@"getInBackground"
										selector:@selector(getInBackground:callback:)
									 returnValue:nil
									   arguments:[NSString className], [GetCallback className], nil];
  

	//*- Java:  public static <T extends ParseObject> ParseQuery<T> or(List<ParseQuery<T>> queries)
	//*- ObjC:  +(ParseQuery*)orQuery:(JavaList*)queries
	[ParseQuery registerStaticMethod:@"or"
									  selector:@selector(orQuery:)
								   returnValue:[ParseQuery className]
									 arguments:[JavaList className], nil];
	
	//*- Java: public void cancel()
	//*- ObjC: -(void)cancel;
	[ParseQuery registerInstanceMethod:@"cancel"
										selector:@selector(cancel)
									 returnValue:nil
									   arguments:nil];
	//Cancels the current network request (if one is running).

	//*- Java: public List<T> find()
	//*- ObjC: -(NSArray*)find;
	[ParseQuery registerInstanceMethod:@"find"
										selector:@selector(find)
									 returnValue:[JavaList className]
									   arguments:nil];
	//Retrieves a list of ParseObjects that satisfy this query. Uses the network and/or the cache, depending on the cache policy.

	//*- Java: public T getFirst()
	//*- ObjC: -(ParseObject*)getFirst;
	[ParseQuery registerInstanceMethod:@"getFirst"
										selector:@selector(getFirst)
									 returnValue:[ParseObject className]
									   arguments:nil];
	//Retrieves at most one ParseObject that satisfies this query. Uses the network and/or the cache, depending on the cache policy. This mutates the ParseQuery.


	//*- Java: public void setCachePolicy(ParseQuery.CachePolicy newCachePolicy)
	//*- ObjC: -(void)setCachePolicy;
	//Change the caching policy of this query.

	//*- Java: public ParseQuery.CachePolicy getCachePolicy()
	//Accessor for the caching policy.


	//*- Java: public void setMaxCacheAge(long maxAgeInMilliseconds)
	//Sets the maximum age of cached data that will be considered in this query.


	//*- Java: public long getMaxCacheAge()
	//Gets the maximum age of cached data that will be considered in this query. The returned value is in milliseconds


	//*- Java: public void findInBackground(FindCallback<T> callback)
	//*- ObjC: -(void)findInBackground:(FindCallback*)callback;
	[ParseQuery registerInstanceMethod:@"findInBackground"
										selector:@selector(findInBackground:)
									 returnValue:nil  
									   arguments:[FindCallback className], nil];
	//Retrieves a list of ParseObjects that satisfy this query from the server in a background thread. This is preferable to using find(), unless your code is already running in a background thread.


	//*- Java: public void getFirstInBackground(GetCallback<T> callback)
	//*- ObjC: -(void)getFirstInBackground:(GetCallback*)callback;
	[ParseQuery registerInstanceMethod:@"getFirstInBackground"
										selector:@selector(getFirstInBackground:)
									 returnValue:nil
									   arguments:[GetCallback className], nil];
	//Retrieves at most one ParseObject that satisfies this query from the server in a background thread. This is preferable to using getFirst(), unless your code is already running in a background thread. This mutates the ParseQuery.


	//*- Java: public int count()throws ParseException
	//*- ObjC: -(int)count;
	//Counts the number of objects that match this query. This does not use caching.
	[ParseQuery registerInstanceMethod:@"count"
										selector:@selector(count)
									 returnValue:[JavaClass intPrimitive]
									   arguments:nil];

	//*- Java: public void countInBackground(CountCallback callback)
	//*- ObjC: -(void)countInBackground:(CountCallback*)callback;
	//Counts the number of objects that match this query in a background thread. This does not use caching.
	[ParseQuery registerInstanceMethod:@"countInBackground"
										selector:@selector(countInBackground:)
									 returnValue:nil
									   arguments:[CountCallback className],nil];




	//*- Java: public boolean hasCachedResult()
	//*- ObjC: -(bool)hasCachedResult;
	[ParseQuery registerInstanceMethod:@"hasCachedResult"
										selector:@selector(hasCachedResult)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:nil];
	//Returns whether or not this query has a cached result.


	//*- Java: public void clearCachedResult()
	//*- ObjC: -(void)clearCachedResult;
	[ParseQuery registerInstanceMethod:@"clearCachedResult"
										selector:@selector(clearCachedResult)
									 returnValue:nil
									   arguments:nil];
	//Removes the previously cached result for this query, forcing the next find() to hit the network. If there is no cached result for this query, then this is a no-op.


	//*- Java: public static void clearAllCachedResults()
	//*- ObjC: -(void)clearAllCachedResults;
	[ParseQuery registerStaticMethod:@"clearAllCachedResults"
										selector:@selector(clearAllCachedResults)
									 returnValue:nil
									   arguments:nil];
	//Clears the cached result for all queries.
	

	//*- Java: public ParseQuery<T> whereEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be equal to the provided value.
	[ParseQuery registerInstanceMethod:@"whereEqualTo"
										selector:@selector(whereEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];
	


	//*- Java: public ParseQuery<T> whereLessThan(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereLessThan:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be less than the provided value.
	[ParseQuery registerInstanceMethod:@"whereLessThan"
										selector:@selector(whereLessThan:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];


	//*- Java: public ParseQuery<T> whereNotEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereNotEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be not equal to the provided value.
	[ParseQuery registerInstanceMethod:@"whereNotEqualTo"
										selector:@selector(whereNotEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];

	//*- Java: public ParseQuery<T> whereGreaterThan(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereGreaterThan:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be greater than the provided value.
	[ParseQuery registerInstanceMethod:@"whereGreaterThan"
										selector:@selector(whereGreaterThan:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];


	//*- Java: public ParseQuery<T> whereLessThanOrEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereLessThanOrEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be less than or equal to the provided value.
	[ParseQuery registerInstanceMethod:@"whereLessThanOrEqualTo"
										selector:@selector(whereLessThanOrEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];


	//*- Java: public ParseQuery<T> whereGreaterThanOrEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereGreaterThanOrEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be greater than or equal to the provided value.
	[ParseQuery registerInstanceMethod:@"whereGreaterThanOrEqualTo"
										selector:@selector(whereGreaterThanOrEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];


	//*- Java: public ParseQuery<T> whereContainedIn(String key,Collection<? extends Object> values)
	//*- ObjC: -(ParseQuery*)whereContainedIn:(NSString*)key values:(JavaArrayList*)values;
	//Add a constraint to the query that requires a particular key's value to be contained in the provided list of values.
	[ParseQuery registerInstanceMethod:@"whereContainedIn"
										selector:@selector(whereContainedIn:values:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaCollection className], nil];


	//*- Java: public ParseQuery<T> whereContainsAll(String key,Collection<?> values)
	//*- ObjC: -(ParseQuery*)whereContainsAll:(NSString*)key values:(JavaArrayList*)values;
	//Add a constraint to the query that requires a particular key's value match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects. Add a constraint to the query that requires a particular key's value to contain every one of the provided list of values.
	[ParseQuery registerInstanceMethod:@"whereContainsAll"
										selector:@selector(whereContainsAll:values:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaCollection className], nil];

	//*- Java: public ParseQuery<T> whereMatchesQuery(String key,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereMatchesQuery:(NSString*)key query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects.
	[ParseQuery registerInstanceMethod:@"whereMatchesQuery"
										selector:@selector(whereMatchesQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseQuery className], nil];


	//*- Java: public ParseQuery<T> whereDoesNotMatchQuery(String key,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereDoesNotMatchQuery:(NSString*)key query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value does not match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects.
	[ParseQuery registerInstanceMethod:@"whereDoesNotMatchQuery"
										selector:@selector(whereDoesNotMatchQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseQuery className], nil];


	//*- Java: public ParseQuery<T> whereMatchesKeyInQuery(String key,String keyInQuery,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereMatchesKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery  query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value matches a value for a key in the results of another ParseQuery
	[ParseQuery registerInstanceMethod:@"whereMatchesKeyInQuery"
										selector:@selector(whereMatchesKeyInQuery:keyInQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className],[ParseQuery className], nil];


	//*- Java: public ParseQuery<T> whereDoesNotMatchKeyInQuery(String key,String keyInQuery,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereDoesNotMatchKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery  query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value does not match any value for a key in the results of another ParseQuery.
	[ParseQuery registerInstanceMethod:@"whereDoesNotMatchKeyInQuery"
										selector:@selector(whereDoesNotMatchKeyInQuery:keyInQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className],[ParseQuery className], nil];


	//*- Java: public ParseQuery<T> whereNotContainedIn(String key,Collection<? extends Object> values)
	//*- ObjC: -(ParseQuery*)whereNotContainedIn:(NSString*)key values:(JavaArrayList*)values;
	//Add a constraint to the query that requires a particular key's value not be contained in the provided list of values.
	//[ParseQuery registerInstanceMethod:@"whereNotContainedIn"
	//									selector:@selector(whereNotContainedIn:values:)
	//								 returnValue:[ParseQuery className]
	//								   arguments:[NSString className],[JavaArrayList className], nil];


	//*- Java: public ParseQuery<T> whereNear(String key,ParseGeoPoint point)
	//*- ObjC: -(ParseQuery*)whereNear:(NSString*)key point:(ParseGeoPoint*)point;
	//dd a proximity based constraint for finding objects with key point values near the point given.
	[ParseQuery registerInstanceMethod:@"whereNear"
										selector:@selector(whereNear:point:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], nil];

	//*- Java: public ParseQuery<T> whereWithinMiles(String key,ParseGeoPoint point,double maxDistance)
	//*- ObjC: -(ParseQuery*)whereWithinMiles:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;
	//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given. Radius of earth used is 3958.8 miles.
	[ParseQuery registerInstanceMethod:@"whereWithinMiles"
										selector:@selector(whereWithinMiles:point:maxDistance:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [JavaClass doublePrimitive], nil];

	//*- Java: public ParseQuery<T> whereWithinKilometers(String key,ParseGeoPoint point,double maxDistance)
	//*- ObjC: -(ParseQuery*)whereWithinKilometers:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;
	//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given. Radius of earth used is 6371.0 kilometers.
	[ParseQuery registerInstanceMethod:@"whereWithinKilometers"
										selector:@selector(whereWithinKilometers:point:maxDistance:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [JavaClass doublePrimitive], nil];


	//*- Java: public ParseQuery<T> whereWithinRadians(String key,ParseGeoPoint point,double maxDistance)
	//*- ObjC: -(ParseQuery*)whereWithinRadians:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;
	//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given.
	[ParseQuery registerInstanceMethod:@"whereWithinRadians"
										selector:@selector(whereWithinRadians:point:maxDistance:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [JavaClass doublePrimitive], nil];


	//*- Java: public ParseQuery<T> whereWithinGeoBox(String key,ParseGeoPoint southwest,ParseGeoPoint northeast)
	//*- ObjC: -(ParseQuery*)whereWithinGeoBox:(NSString*)key southwest:(ParseGeoPoint*)southwest northeast:(ParseGeoPoint*)northeast;
	//Add a constraint to the query that requires a particular key's coordinates be contained within a given rectangular geographic bounding box.
	[ParseQuery registerInstanceMethod:@"whereWithinGeoBox"
										selector:@selector(whereWithinGeoBox:southwest:northeast:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [ParseGeoPoint className], nil];

	//*- Java: public ParseQuery<T> whereMatches(String key,String regex)
	//*- ObjC: -(ParseQuery*)whereMatches:(NSString*)key regex:(NSString*)regex;
	//Add a regular expression constraint for finding string values that match the provided regular expression. This may be slow for large datasets.
	[ParseQuery registerInstanceMethod:@"whereMatches"
										selector:@selector(whereMatches:regex:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];

	//*- Java: public ParseQuery<T> whereMatches(String key,String regex,String modifiers)
	//*- ObjC: -(ParseQuery*)whereMatches:(NSString*)key regex:(NSString*)regex modifiers:(NSString*)modifiers;
	//Add a regular expression constraint for finding string values that match the provided regular expression. This may be slow for large datasets.
	[ParseQuery registerInstanceMethod:@"whereMatches"
										selector:@selector(whereMatches:regex:modifiers:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className],[NSString className], nil];

	//*- Java: public ParseQuery<T> whereContains(String key,String substring)
	//*- ObjC: -(ParseQuery*)whereContains:(NSString*)key substring:(NSString*)substring;
	//Add a constraint for finding string values that contain a provided string. This will be slow for large datasets.
	[ParseQuery registerInstanceMethod:@"whereContains"
										selector:@selector(whereContains:substring:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];


	//*- Java: public ParseQuery<T> whereStartsWith(String key,String prefix)
	//*- ObjC: -(ParseQuery*)whereStartsWith:(NSString*)key prefix:(NSString*)prefix;
	//Add a constraint for finding string values that contain a provided string. This will be slow for large datasets.
	//Add a constraint for finding string values that start with a provided string. This query will use the backend index, so it will be fast even for large datasets.
	[ParseQuery registerInstanceMethod:@"whereStartsWith"
										selector:@selector(whereStartsWith:prefix:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];

	//*- Java: public ParseQuery<T> whereEndsWith(String key,String suffix)
	//*- ObjC: -(ParseQuery*)whereEndsWith:(NSString*)key suffix:(NSString*)suffix;
	//Add a constraint for finding string values that end with a provided string. This will be slow for large datasets.
	[ParseQuery registerInstanceMethod:@"whereEndsWith"
										selector:@selector(whereEndsWith:prefix:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];


	//*- Java: public void include(String key)
	//*- ObjC: -(void)include:(NSString*)key;
	//Include nested ParseObjects for the provided key. You can use dot notation to specify which fields in the included object that are also fetched.
	[ParseQuery registerInstanceMethod:@"include"
										selector:@selector(include:)
									 returnValue:nil
									   arguments:[NSString className], nil];

	//*- Java: public void selectKeys(Collection<String> keys)
	//*- ObjC: -(void)selectKeys:(JavaList*)keys;
	//Restrict the fields of returned ParseObjects to only include the provided keys. If this is called multiple times, then all of the keys specified in each of the calls will be included.
	[ParseQuery registerInstanceMethod:@"selectKeys"
										selector:@selector(selectKeys:)
									 returnValue:nil
									   arguments:[JavaCollection className], nil];

	//*- Java: public ParseQuery<T> whereExists(String key)
	//*- ObjC: -(ParseQuery*)whereExists:(NSString*)key;
	//Add a constraint for finding objects that contain the given key.
	[ParseQuery registerInstanceMethod:@"whereExists"
										selector:@selector(whereExists:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];

	//*- Java: public ParseQuery<T> whereDoesNotExist(String key)
	//*- ObjC: -(ParseQuery*)whereDoesNotExist:(NSString*)key
	//Add a constraint for finding objects that do not contain a given key.
	[ParseQuery registerInstanceMethod:@"whereDoesNotExist"
										selector:@selector(whereDoesNotExist:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];

	//*- Java: public ParseQuery<T> orderByAscending(String key)
	//*- ObjC: -(ParseQuery*)orderByAscending:(NSString*)key
	//Sorts the results in ascending order by the given key.
	[ParseQuery registerInstanceMethod:@"orderByAscending"
										selector:@selector(orderByAscending:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];


	//*- Java: public ParseQuery<T> addAscendingOrder(String key)
	//*- ObjC: -(ParseQuery*)addAscendingOrder:(NSString*)key
	//Also sorts the results in ascending order by the given key. The previous sort keys have precedence over this key.
	[ParseQuery registerInstanceMethod:@"addAscendingOrder"
										selector:@selector(addAscendingOrder:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];


	//*- Java: public ParseQuery<T> orderByDescending(String key)
	//*- ObjC: -(ParseQuery*)orderByDescending:(NSString*)key;
	//Sorts the results in descending order by the given key.
	[ParseQuery registerInstanceMethod:@"orderByDescending"
										selector:@selector(orderByDescending:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];


	//*- Java: public ParseQuery<T> addDescendingOrder(String key)
	//*- ObjC: -(ParseQuery*)addDescendingOrder:(NSString*)key;
	//Also sorts the results in descending order by the given key. The previous sort keys have precedence over this key.
	[ParseQuery registerInstanceMethod:@"addDescendingOrder"
										selector:@selector(addDescendingOrder:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];

	//*- Java: public void setLimit(int newLimit)
	//*- ObjC: -(void)setLimit:(int)newLimit;
	//Controls the maximum number of results that are returned. Setting a negative limit denotes retrieval without a limit. The default limit is 100, with a maximum of 1000 results being returned at a time.
	[ParseQuery registerInstanceMethod:@"setLimit"
										selector:@selector(setLimit:)
									 returnValue:nil
									   arguments:[JavaClass intPrimitive], nil];


	//*- Java: public void setTrace(boolean shouldTrace)
	//*- ObjC: -(void)setTrace:(bool)shouldTrace;
	//Turn on performance tracing of finds. If performance tracing is already turned on this does nothing. In general you don't need to call trace.
	//[ParseQuery registerInstanceMethod:@"shouldTrace"
	//									selector:@selector(shouldTrace:)
	//								 returnValue:nil
	//								   arguments:[JavaClass boolPrimitive], nil];


	//*- Java: public int getLimit()
	//*- ObjC: -(int)getLimit;
	//Accessor for the limit.
	[ParseQuery registerInstanceMethod:@"getLimit"
										selector:@selector(getLimit)
									 returnValue:[JavaClass intPrimitive]
									   arguments:nil];


	//*- Java: public void setSkip(int newSkip)
	//*- ObjC: -(void)setSkip:(int)newSkip;
	//Controls the number of results to skip before returning any results. This is useful for pagination. Default is to skip zero results.
	[ParseQuery registerInstanceMethod:@"setSkip"
										selector:@selector(setSkip:)
									 returnValue:nil
									   arguments:[JavaClass intPrimitive],nil];


	//*- Java: public int getSkip()
	//*- ObjC: -(int)getSkip;
	//Accessor for the skip value.
	[ParseQuery registerInstanceMethod:@"getSkip"
										selector:@selector(getSkip)
									 returnValue:[JavaClass intPrimitive]
									   arguments:nil];
 

	//*- Java: public String getClassName()
	//*- ObjC: -(NSString*)getClassName;
	//Accessor for the class name.
	[ParseQuery registerInstanceMethod:@"getClassName"
										selector:@selector(getClassName)
									 returnValue:[NSString className]
									   arguments:nil];

	
}

+ (NSString *)className
{
    return @"com.parse.ParseQuery";
}
/*
-(NSArray*)find{
	return [[self _find] toArray];
}*/

@end
