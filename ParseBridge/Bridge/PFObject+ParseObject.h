#import "PFObject.h"

@class ParseObject;

@interface PFObject (ParseObject)
- (id)initWithParseObject:(ParseObject*)parseObj;
- (ParseObject*)parseObject;

@end
