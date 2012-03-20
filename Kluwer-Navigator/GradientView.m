//
//  GradientView.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 12/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "GradientView.h"
#import <QuartzCore/QuartzCore.h>


@implementation GradientView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(Class) layerClass {
    return [CAGradientLayer class];
}

@end
