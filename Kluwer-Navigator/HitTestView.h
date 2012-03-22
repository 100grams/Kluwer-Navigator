//
//  HitTestView.h
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 22/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HitTestViewDelegate;


@interface HitTestView : UIView

@property (nonatomic, assign) id<HitTestViewDelegate> delegate;

@end


@protocol HitTestViewDelegate <NSObject>

- (void) didHitView:(UIView*)view;

@end