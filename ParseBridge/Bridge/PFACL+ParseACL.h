#import "PFACL.h"

@class ParseACL;

@interface PFACL (ParseRole)

- (id)initWithParseACL:(ParseACL*)pACL;
- (ParseACL*)parseACL;

@end
