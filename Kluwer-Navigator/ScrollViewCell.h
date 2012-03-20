//
//  ScrollViewCell.h
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 12/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "ReflectionView.h"


@protocol ScrollViewCellDelegate;


@interface ScrollViewCell : UIView <EGOImageViewDelegate, UIGestureRecognizerDelegate>

+ (ScrollViewCell*) cellWithMediaItem:(NSDictionary*)item;

- (id) initWithMediaItem:(NSDictionary*)item ;

- (IBAction)didClick:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UILabel *detailLabel;

@property (retain, nonatomic) IBOutlet ReflectionView *reflectionView;
@property (retain, nonatomic) IBOutlet EGOImageView *imageView;

@property (nonatomic, assign) id<ScrollViewCellDelegate> delegate;

@property (nonatomic, retain) NSDictionary *mediaItem;


@end




@protocol ScrollViewCellDelegate <NSObject>
@optional
// loading
- (void) cellDidLoadThumbnail : (ScrollViewCell*)cell;

// interaction
- (void) didClickInScrollViewCell:(ScrollViewCell*)cell;

@end