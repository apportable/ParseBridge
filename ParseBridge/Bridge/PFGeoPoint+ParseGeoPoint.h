#import "PFGeoPoint.h"

@class ParseGeoPoint;

@interface PFGeoPoint (ParseGeoPoint)
- (id)initWithParseGeoPoint:(ParseGeoPoint *)parseGeoPoint;
- (ParseGeoPoint *)parseGeoPoint;
@end
