#import "PFFile.h"

@class ParseFile;

@interface PFFile (ParseFile)

- (id)initWithParseFile:(ParseFile*)pFile;
- (ParseFile*)parseFile;

@end
