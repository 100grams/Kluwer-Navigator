//
//  CSDate.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>


@interface CSDate : NSObject {

}

-(id) init;
-(NSTimeInterval) unixTime;
+(CSDate *) date;

+(NSString *) stringFromUnixTime:(NSTimeInterval)unixTime;

@end
