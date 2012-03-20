//
//  AboutViewController.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 15/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GradientView.h"


@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize backgroundView;
@synthesize textView;
@synthesize contactDetailsLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedStringWithDefaultValue(@"AboutNavTitle", nil, [NSBundle mainBundle], @"Over Kluwer Navigator", nil);
    
    // set background view gradient
    
    CAGradientLayer *glayer = (CAGradientLayer*)backgroundView.layer;
    UIColor *topColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0];
    UIColor *bottomColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:1.0];//UIColorFromRGBString(@"0b7ad0");
    glayer.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];

}

- (void)viewDidUnload
{
    [self setBackgroundView:nil];
    [self setTextView:nil];
    [self setContactDetailsLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)dealloc {
    [backgroundView release];
    [textView release];
    [contactDetailsLabel release];
    [super dealloc];
}
@end
