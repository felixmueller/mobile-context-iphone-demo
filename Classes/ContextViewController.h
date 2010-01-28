//
//  ContextViewController.h
//  ContextDemo
//
//  Created by Felix on 19.01.10.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "ContextDemoAppDelegate.h"

@interface ContextViewController : UITableViewController {
	
	NSMutableArray *contextTypes;
	NSMutableArray *contextNames;
	NSTimer *refreshTimer;
	
}

@property (nonatomic, retain) NSMutableArray *contextTypes;
@property (nonatomic, retain) NSMutableArray *contextNames;
@property (nonatomic, retain) NSTimer *refreshTimer;

@end
