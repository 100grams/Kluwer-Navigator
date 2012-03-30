//
//  CSLabel.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSLabelProtocol.h"

@interface CSLabel : NSObject <CSLabelProtocol> {

}

+(NSArray *) orderFirstLabels;
+(NSArray *) orderLastLabels;

-(id) init: (NSString *) labelName value:(NSString *) labelValue aggregate:(BOOL) aggr;

@property (assign) NSMutableArray *list;

-(NSComparisonResult) orderByPosition: (CSLabel *) aLabel;

@end
