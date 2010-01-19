//
//  ContextViewController.h
//  ContextDemo
//
//  Created by Felix on 19.01.10.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

@interface ContextViewController : UITableViewController {
	
	NSMutableArray *contextNames;
	NSMutableArray *contextValues;
	
}

@property (nonatomic, retain) NSMutableArray *contextNames;
@property (nonatomic, retain) NSMutableArray *contextValues;

@end
