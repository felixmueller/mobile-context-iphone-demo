//
//  SourcesViewController.h
//  ContextDemo
//
//  Created by Felix on 22.01.10.
//  Copyright 2010 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "ContextDemoAppDelegate.h"


@interface SourcesViewController : UITableViewController {

	NSArray *contextSources;
	
}

@property (nonatomic, retain) NSArray *contextSources;

@end