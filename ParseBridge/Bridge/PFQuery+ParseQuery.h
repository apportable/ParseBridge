#import "PFQuery.h"

@class ParseQuery;

@interface PFQuery (ParseQuery)

- (id)initWithParseQuery:(ParseQuery*)pQuery;
- (ParseQuery*) parseQuery;

@end
