//
//  NSString+URLEncoding.h
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 21/4/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)

-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

@end
