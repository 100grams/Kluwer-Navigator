//
//  CSEvent.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSEventProtocol.h"


@interface CSEvent : NSNotification <CSEventProtocol> {

}

-(id) initWithType: (NSString *) t;

@end
