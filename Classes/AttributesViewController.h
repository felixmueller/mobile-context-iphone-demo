//
//  AttributesViewController.h
//  ContextDemo
//
//  Created by Felix on 16.12.09.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "ContextDemoAppDelegate.h"

@interface AttributesViewController : UITableViewController {
	
	NSMutableArray *contextNames;
	NSMutableArray *contextValues;
	NSTimer *refreshTimer;
	
}

@property (nonatomic, retain) NSMutableArray *contextNames;
@property (nonatomic, retain) NSMutableArray *contextValues;
@property (nonatomic, retain) NSTimer *refreshTimer;

- (NSMutableArray*)sortDictionaryByKeys:(NSDictionary*)dict;

@end
