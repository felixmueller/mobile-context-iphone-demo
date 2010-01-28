//
//  ContextViewController.m
//  ContextDemo
//
//  Created by Felix on 19.01.10.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "ContextViewController.h"

@implementation ContextViewController

@synthesize contextTypes;
@synthesize contextNames;
@synthesize refreshTimer;

- (void)refreshContexts:(id)sender
{

	// Get the context attributes from the context service
	ContextDemoAppDelegate *delegate = (ContextDemoAppDelegate *)[[UIApplication sharedApplication] delegate];	
	
	// Get all contexts from the context service
	NSDictionary *contexts = [delegate.contextService getContextsForUser:@"FelixMueller"];
	
	NSArray *contextKeys = [NSArray arrayWithArray:[contexts allKeys]];
	
	// Iterate all contexts
	self.contextTypes = [[NSMutableArray alloc] init];
	self.contextNames = [[NSMutableArray alloc] init];
	for(NSString *contextKey in contextKeys) {
		[contextTypes addObject:contextKey];
		[contextNames addObject:[[contexts objectForKey:contextKey] type]];
	}
	
	// Reload table view
	[self.tableView reloadData];

}
	
- (void)autoRefreshContexts:(id)sender
{
	
	// Check if the refresh timer is off
	if ([self.refreshTimer isValid] == NO) {
		
		// Turn the refresh timer on
		self.refreshTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshContexts:) userInfo:nil repeats:YES];
		
		// Set the bar button to pause
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(autoRefreshContexts:)];
	}
	else {
		
		// Turn the refresh timer off
		[self.refreshTimer invalidate];
		self.refreshTimer = nil;
			
		// Set the bar button to play
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(autoRefreshContexts:)];
	}
}
	

/*- (void)saveContexts:(id)sender
{

	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	// Get the context attributes from the context service
	ContextDemoAppDelegate *delegate = [[UIApplication sharedApplication] delegate];

	NSDictionary *contexts = [delegate.contextService getAllContexts];

	NSData *contextsAsData = [NSKeyedArchiver archivedDataWithRootObject:contexts];

	/*	NSArray *contextKeys = [NSArray arrayWithArray:[contexts allKeys]];
	self.contextNames = [[NSMutableArray alloc] init];
	self.contextValues = [[NSMutableArray alloc] init];
	for(NSString *contextKey in contextKeys) {
		[standardUserDefaults setObject:[contexts objectForKey:contextKey] forKey:contextKey];
		//[contextNames addObject:contextKey];
		//[contextValues addObject:[[contexts objectForKey:contextKey] contextValue]];
	}
	[standardUserDefaults synchronize];
*//*
	
	if (standardUserDefaults) {
		[standardUserDefaults setObject:contextsAsData forKey:@"Contexts"];
		[standardUserDefaults synchronize];
	}
	
}*/

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Refresh button
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshContexts:)];
	
	// Save button
//	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveContexts:)];

	// Auto refresh button
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(autoRefreshContexts:)];
	
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
	// Refresh the attributes at view loading
	[self refreshContexts:self];
}

/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [contextNames count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [contextTypes objectAtIndex:indexPath.row];
	cell.detailTextLabel.text = [contextNames objectAtIndex:indexPath.row];
	
    return cell;
}



/*
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
}
*/


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

