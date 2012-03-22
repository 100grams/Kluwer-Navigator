//
//  HitTestView.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 22/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "HitTestView.h"

@implementation HitTestView
@synthesize delegate;

- (UIView*) hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([self pointInside:point withEvent:event]) {
        [self.delegate didHitView:self];
    }
    return [super hitTest:point withEvent:event];
}

@end
