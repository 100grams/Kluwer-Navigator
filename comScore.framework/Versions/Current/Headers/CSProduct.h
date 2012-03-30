//
//  CSProduct.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSProductProtocol.h"

// Basic Product implementation
@interface CSProduct : NSObject <CSProductProtocol> {

}

-(id) init;
-(id) initWithParent: (CSComScore *) pn;

@end
