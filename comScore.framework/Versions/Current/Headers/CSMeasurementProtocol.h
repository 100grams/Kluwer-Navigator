//
//  CSMeasurementProtocol.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <UIKit/UIKit.h>

@protocol CSMeasurementProtocol

-(void) setLabel: (NSString *) name value:(NSString *) val aggregate:(BOOL) aggr;
-(void) setLabel: (NSString *) name value:(NSString *) val;
-(NSArray *) getLabel: (NSString *) name;
-(BOOL) hasLabel: (NSString *) name;
-(NSString *) package;

@end
