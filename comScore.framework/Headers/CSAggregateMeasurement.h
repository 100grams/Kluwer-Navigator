//
//  CSAggregateMeasurement.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSApplicationMeasurement.h"


@interface CSAggregateMeasurement : CSApplicationMeasurement {

}

-(NSArray *) getAggregateLabels;
-(void) aggregateLabels: (NSArray *) labelList;
-(BOOL) isInteger: (NSString *) value;
-(BOOL) isList: (NSString *) value;
-(BOOL) existingString: (NSString *) value string: (NSString *) newString;
-(NSString *) addValue: (NSString *) value toList: (NSString *) list;
-(NSArray *) getElementsFromList: (NSString *) list;
-(void) formatLists;

@end
