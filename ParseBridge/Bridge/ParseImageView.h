//
//  ParseImageView.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <BridgeKit/UI/ImageView.h>

@class ParseFile;
@class GetDataCallback;
@class AndroidBitmap;

@interface ParseImageView : VerdeUIImageView

@property (nonatomic, retain) ParseFile *parseFile;

- (void)loadInBackground;
- (void)loadInBackground:(GetDataCallback*)callback;
- (void)setPlaceholder:(AndroidBitmap*)bitmap;

@end
