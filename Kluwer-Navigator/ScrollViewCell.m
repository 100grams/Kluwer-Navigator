//
//  ScrollViewCell.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 12/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "ScrollViewCell.h"
#import "MBProgressHUD.h"


@implementation ScrollViewCell
@synthesize titleLabel;
@synthesize detailLabel;
@synthesize reflectionView;
@synthesize imageView;
@synthesize delegate;
@synthesize mediaItem;
@synthesize loading;


+ (ScrollViewCell*) cellWithMediaItem:(NSDictionary*)item
{
    ScrollViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ScrollViewCell" owner:nil options:nil] objectAtIndex:0];
    return [cell initWithMediaItem:item];
}



- (id) initWithMediaItem:(NSDictionary*)item 
{
    self.mediaItem = item;

    self.titleLabel.text = [item valueForKey:@"title"];
    self.detailLabel.text = [item valueForKey:@"description"];
    UIImage *placeholderImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@-placeholder-thumb", [item valueForKey:@"mime-type"]]];
    self.imageView.delegate = self;
    self.imageView.placeholderImage = placeholderImage? placeholderImage : [UIImage imageNamed:@"generic-placeholder-thumb"];
    self.imageView.imageURL = [NSURL URLWithString:[item valueForKey:@"thumb"]];
    
    
    // set tap gesture recognizer 
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnItem:)];
    [self addGestureRecognizer:recognizer];
    recognizer.delegate = self;
    [recognizer release];

    
    return self;
}




- (IBAction)didClick:(id)sender {
}
- (void)dealloc {
    [titleLabel release];
    [detailLabel release];
    [imageView release];
    [reflectionView release];
    self.mediaItem = nil;
    
    [super dealloc];
}


- (void) setLoading:(BOOL)loadn
{
    if (loadn) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:reflectionView animated:YES];
        hud.labelText = @"Laden";
    }
    else{
        [MBProgressHUD hideHUDForView:reflectionView animated:YES];
    }
}

#pragma mark - EGOImageViewDelegate

- (void)imageViewLoadedImage:(EGOImageView*)imageView;
{
    [reflectionView updateReflection];
    
    if ([self.delegate respondsToSelector:@selector(cellDidLoadThumbnail:)]) {
        [self.delegate cellDidLoadThumbnail:self];
    }
}

- (void)imageViewFailedToLoadImage:(EGOImageView*)imageView error:(NSError*)error;
{
}


#pragma mark - UIGestureRecognizerDelegate

- (void) didTapOnItem : (NSNotification*) notification
{
    if ([delegate respondsToSelector:@selector(didClickInScrollViewCell:)]) {
        [delegate didClickInScrollViewCell:self];
    }
}


@end
