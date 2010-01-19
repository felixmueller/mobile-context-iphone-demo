//
//  ContextDemoAppDelegate.h
//  ContextDemo
//
//  Created by Felix on 16.12.09.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

// Import the context service header file
#import "ContextService.h"

@interface ContextDemoAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
	// The context service
	ContextService *contextService;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

// Context service property
@property (nonatomic, retain) ContextService *contextService;

@end

