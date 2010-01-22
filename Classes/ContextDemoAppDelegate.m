//
//  ContextDemoAppDelegate.m
//  ContextDemo
//
//  Created by Felix on 16.12.09.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "ContextDemoAppDelegate.h"


@implementation ContextDemoAppDelegate

@synthesize window;
@synthesize tabBarController;

// Synthesize context service
@synthesize contextService;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Init the context service
	contextService = [[ContextService alloc] init];
	
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
	// Release the context service
	[contextService release];
	
    [tabBarController release];
	[window release];
	[super dealloc];
}


@end

