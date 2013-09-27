#import "PFRelation.h"

@class ParseRelation;

@interface PFRelation (ParseRelation)

- (id)initWithParseRelation:(ParseRelation*)pRelation;
- (ParseRelation*)parseRelation;

@end
