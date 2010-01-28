//
//  AttributesViewController.m
//  ContextDemo
//
//  Created by Felix on 16.12.09.
//  Copyright 2009 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import "AttributesViewController.h"

@implementation AttributesViewController

@synthesize contextNames;
@synthesize contextValues;
@synthesize refreshTimer;

- (void)refreshAttributes:(id)sender
{
		
	// Get the application delegate with the context service
	ContextDemoAppDelegate *delegate = (ContextDemoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	// Get all context source attributes
	NSDictionary *contexts = [delegate.contextService getSourceAttributes];

	// Save all context source attributes for table
	NSArray *contextKeys = [self sortDictionaryByKeys:contexts];
	self.contextNames = [[NSMutableArray alloc] init];
	self.contextValues = [[NSMutableArray alloc] init];
	for(NSString *contextKey in contextKeys) {
		[contextNames addObject:contextKey];
		[contextValues addObject:[[contexts objectForKey:contextKey] value]];
	}
	
	// Reload table view
	[self.tableView reloadData];
	
}

- (void)autoRefreshAttributes:(id)sender
{
	
	// Check if the refresh timer is off
	if ([self.refreshTimer isValid] == NO) {

		// Turn the refresh timer on
		self.refreshTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(refreshAttributes:) userInfo:nil repeats:YES];
		
		// Set the bar button to pause
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(autoRefreshAttributes:)];
	}
	else {
		
		// Turn the refresh timer off
		[self.refreshTimer invalidate];
		self.refreshTimer = nil;
		
		// Set the bar button to play
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(autoRefreshAttributes:)];
	}
}


- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Refresh button
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshAttributes:)];
	
	// Auto refresh button
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(autoRefreshAttributes:)];
	
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
	// Refresh the attributes at view loading
	[self refreshAttributes:self];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
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
	cell.textLabel.text = [[[contextNames objectAtIndex:indexPath.row]
							stringByAppendingString:@" : "]
						   stringByAppendingString:[contextValues objectAtIndex:indexPath.row]];
	//cell.detailTextLabel.text = [contextValues objectAtIndex:indexPath.row];
	
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

- (NSMutableArray*)sortDictionaryByKeys:(NSDictionary*)dict
{
	
	if(!dict)
		return nil;
	NSMutableArray *sortedKeys = [NSMutableArray arrayWithArray: [dict allKeys]];
	if([sortedKeys count] <= 0)
		return nil;
	else if([sortedKeys count] == 1)
		return sortedKeys; // No sort needed
	
	// Perform bubble sort on keys
	int n = [sortedKeys count] -1;
	int i;
	BOOL swapped = YES;
	
	NSString *key1,*key2;
	NSComparisonResult result;
	
	while(swapped)
	{
		swapped = NO;
		for(i=0;i<n;i++)
		{
			key1 = [sortedKeys objectAtIndex: i];
			key2 = [sortedKeys objectAtIndex: i+1];
			
			// Here is a basic NSString comparison
			result = [key1 compare: key2 options: NSCaseInsensitiveSearch];
			if(result == NSOrderedDescending)
			{
				// Retain for good form
				[key1 retain];
				[key2 retain];
				
				// Pop the two keys out of the array
				[sortedKeys removeObjectAtIndex: i]; // Key 1
				[sortedKeys removeObjectAtIndex: i]; // Key 2
				
				// Replace keys
				[sortedKeys insertObject: key1 atIndex: i];
				[sortedKeys insertObject: key2 atIndex: i];
				
				[key1 release];
				[key2 release];
				
				swapped = YES;
			}
		}
	}
	
	return sortedKeys;
}

- (void)dealloc {
    [super dealloc];
}

@end

