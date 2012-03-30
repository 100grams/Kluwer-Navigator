//
//  CSStorage.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>


@interface CSStorage : NSObject {
}

-(id) init;
-(BOOL) has: (NSString *) key;
-(id) get: (NSString *) key;
-(void) set: (NSString *) key :(id) obj;
-(void) setBool: (NSString *) key :(BOOL) obj;
-(BOOL) getBool: (NSString *) key;

+ (CSStorage *) storage;

@property (assign) BOOL enabled;

@end