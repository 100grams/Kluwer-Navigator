//
//  CSEventProtocol.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <UIKit/UIKit.h>

// Interface definition for an Analytics Event.
@protocol CSEventProtocol

// Analytics Event type.
@property (assign) NSString *type;

@end
