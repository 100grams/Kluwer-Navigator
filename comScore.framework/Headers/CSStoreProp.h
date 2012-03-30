//
//  CSStoreProp.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>


@interface CSStoreProp : NSObject {

}

-(id) initWithName: (NSString *) n;
-(NSString *) getValue;
-(void) setValue:(NSString *) v;

@property (readonly) NSString *name;
@property (nonatomic, assign) NSString *value;

@end
