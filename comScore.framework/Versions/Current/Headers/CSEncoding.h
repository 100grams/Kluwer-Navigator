//
// CSEncoding.h
// ComScore
//

// Copyright 2011 comScore, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CSEncoding : NSObject {
}

-(id) init;
+(NSString *) urlencode: (NSString *) str;
+(CSEncoding *) coder;
+(NSArray *) escapeChars;
+(NSArray *) replaceChars;

@end
