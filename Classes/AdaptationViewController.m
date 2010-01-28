//
//  AdaptationViewController.m
//  ContextDemo
//
//  Created by Felix on 28.01.10.
//  Copyright 2010 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "AdaptationViewController.h"


@implementation AdaptationViewController

@synthesize refreshTimer;
@synthesize autoRefreshButton;

@synthesize iconSilence;
@synthesize iconModerate;
@synthesize iconLoud;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)refreshContexts:(id)sender
{
	
	// Get the context attributes from the context service
	ContextDemoAppDelegate *delegate = (ContextDemoAppDelegate *)[[UIApplication sharedApplication] delegate];	
	
	// Get all contexts from the context service
	NSDictionary *contexts = [delegate.contextService getContextsForUser:@"FelixMueller"];
	
	NSArray *contextKeys = [NSArray arrayWithArray:[contexts allKeys]];
	
	// Hide all icons
	[self.iconSilence setHidden:YES];
	[self.iconModerate setHidden:YES];
	[self.iconLoud setHidden:YES];
	
	// Iterate all contexts
	for(NSString *contextKey in contextKeys) {
		if ([contextKey isEqualToString:@"Silence"])
			[self.iconSilence setHidden:NO];
		if ([contextKey isEqualToString:@"Moderate"])
			[self.iconModerate setHidden:NO];
		if ([contextKey isEqualToString:@"Loud"])
			[self.iconLoud setHidden:NO];
		
	}
	
}

- (IBAction)autoRefreshContexts:(id)sender
{
	
	// Check if the refresh timer is off
	if ([self.refreshTimer isValid] == NO) {
		
		// Turn the refresh timer on
		self.refreshTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshContexts:) userInfo:nil repeats:YES];
		
	}
	else {
		
		// Turn the refresh timer off
		[self.refreshTimer invalidate];
		self.refreshTimer = nil;
		
		// Set the bar button to play
		self.autoRefreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(refreshContexts:)];
	}
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Turn the refresh timer on
	self.refreshTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshContexts:) userInfo:nil repeats:YES];
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
