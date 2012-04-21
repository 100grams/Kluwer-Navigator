//
//  NSString+URLEncoding.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 21/4/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)

-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
	
    NSString *res = (NSString*)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)self, NULL,(CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ", CFStringConvertNSStringEncodingToEncoding(encoding));
    return [res autorelease];
}

@end
