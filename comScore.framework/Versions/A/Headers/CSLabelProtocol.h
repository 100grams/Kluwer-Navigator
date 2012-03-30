//
//  CSLabelProtocol.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <UIKit/UIKit.h>


@protocol CSLabelProtocol

-(NSString *) pack;

@property (assign) NSString *name;
@property (assign) NSString *value;
@property (assign) BOOL aggregate;

@end
