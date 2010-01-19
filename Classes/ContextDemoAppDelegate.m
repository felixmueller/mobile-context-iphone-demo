//
//  ContextDemoAppDelegate.m
//  ContextDemo
//
//  Created by Felix on 16.12.09.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "ContextDemoAppDelegate.h"
#import "SourceViewController.h"
#import "ContextViewController.h"


@implementation ContextDemoAppDelegate

@synthesize window;
@synthesize navigationController;

// Synthesize context service
@synthesize contextService;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Init the context service
	contextService = [[ContextService alloc] init];
	//NSDictionary *contexts = [contextService getContexts];
	//NSLog(@"%@", contexts);
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
	// Release the context service
	[contextService release];
	
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

