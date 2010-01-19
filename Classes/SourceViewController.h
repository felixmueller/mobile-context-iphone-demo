//
//  SourceViewController.h
//  ContextDemo
//
//  Created by Felix on 16.12.09.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

@interface SourceViewController : UITableViewController {
	
	NSMutableArray *contextNames;
	NSMutableArray *contextValues;
	
}

@property (nonatomic, retain) NSMutableArray *contextNames;
@property (nonatomic, retain) NSMutableArray *contextValues;

@end
