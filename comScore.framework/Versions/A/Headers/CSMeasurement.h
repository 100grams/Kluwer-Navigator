//
//  CSMeasurement.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSMeasurementProtocol.h"
#import "CSLabel.h"
#import "CSPrivilegedLabel.h"
#import "CSEventArgs.h"

// Base class for the different available Measurements.
@interface CSMeasurement : NSObject <CSMeasurementProtocol> {
	
	NSMutableArray *labels;
	
}

// Measurement constructors.
-(id) init;
-(id) initWithDictionary: (NSDictionary *) list;
-(id) initWithEventArgs: (CSEventArgs *) e;

//Custom methods
-(NSArray *) retrieveLabel: (NSString *) name;
-(BOOL) compareLabel: (NSString *) name value:(NSString *) val;
-(BOOL) compareLabel: (NSString *) name int64: (int64_t *) val;
-(void) appendLabel: (CSLabel *) label;
-(void) appendLabel: (NSString *) name value: (NSString *) val aggregate: (BOOL) aggr nedstatPrivilege: (BOOL) np;
-(void) removeLabel: (NSString *) name aggregate: (BOOL) aggr nedstatPrivilege: (BOOL) nedstatPrivilege;
-(void) setLabel: (NSString *) name value:(NSString *) val aggregate:(BOOL) aggr nedstatPrivilege:(BOOL) np;
-(void) setLabel: (CSLabel *) label;
-(void) onPack: (NSString *) str;

@end
