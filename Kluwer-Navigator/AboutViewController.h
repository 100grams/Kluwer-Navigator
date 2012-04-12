//
//  AboutViewController.h
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 15/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GradientView;


@interface AboutViewController : UIViewController

@property (retain, nonatomic) IBOutlet GradientView *backgroundView;
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UILabel *contactDetailsLabel;
@property (retain, nonatomic) IBOutlet UIView *portraitView;
@property (retain, nonatomic) IBOutlet GradientView *landscapeView;
@property (retain, nonatomic) IBOutlet UITextView *portraitContactTextView;
@property (retain, nonatomic) IBOutlet UITextView *landscapeContactTextView;

- (void) updateLayoutForViewOrientation;

@end
