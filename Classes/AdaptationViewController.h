//
//  AdaptationViewController.h
//  ContextDemo
//
//  Created by Felix on 28.01.10.
//  Copyright 2010 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContextDemoAppDelegate.h"


@interface AdaptationViewController : UIViewController {

	IBOutlet UIBarButtonItem *autoRefreshButton;
	NSTimer *refreshTimer;
	
	IBOutlet UIImageView *iconSilence;
	IBOutlet UIImageView *iconModerate;
	IBOutlet UIImageView *iconLoud;
	
}

@property (nonatomic, retain) UIBarButtonItem *autoRefreshButton;
@property (nonatomic, retain) NSTimer *refreshTimer;

@property (nonatomic, retain) UIImageView *iconSilence;
@property (nonatomic, retain) UIImageView *iconModerate;
@property (nonatomic, retain) UIImageView *iconLoud;

- (IBAction)autoRefreshContexts:(id)sender;

@end
