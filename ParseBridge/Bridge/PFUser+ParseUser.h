#import "PFUser.h"

@class ParseUser;

@interface PFUser (ParseUser)
- (id)initWithParseUser:(ParseUser *)parseUser;
- (ParseUser *)parseUser;
@end
