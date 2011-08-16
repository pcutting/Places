//
//  TopPlacesTableViewController.m
//  Places
//
//  Created by Philip Cutting on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TopPlacesTableViewController.h"
#import "PhotoTableViewController.h"


@implementation TopPlacesTableViewController


#pragma mark -myTopPlaces
#pragma mark Initialization

-(NSArray *)myTopPlaces
{
	if (!myTopPlaces) {		
		NSArray *somePlaces = [FlickrFetcher topPlaces];
		NSSortDescriptor *ascendingContentsDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_content" ascending:YES];
		NSArray *descriptors = [NSArray arrayWithObjects:ascendingContentsDescriptor, nil];
		myTopPlaces = [[somePlaces sortedArrayUsingDescriptors:descriptors] retain];
		[ascendingContentsDescriptor release];			
	}
	//NSLog(@"getter for myTopPlaces");
	//NSLog(@"Flickr TopPlaces %@", myTopPlaces);
	return myTopPlaces;
	
}


		
/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle
/*- (NSString *)tableView:(UITableView *)sender titleForHeaderInSection:(NSInteger)section
{
	return Some_String;
}
 */


- (void)viewDidLoad {
	self.title = @"Places";
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
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

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES; // (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark -
#pragma mark Table view data source

/* - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	return 1;
    //return <#number of sections#>;
}
 */


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.myTopPlaces.count;
}

- (NSString *)locationAtIndexPath:(NSIndexPath *)indexPath
{
	//NSLog(@"locationAtIndexPath: %@",[self.myTopPlaces objectAtIndex:indexPath.row]); // [[self.myTopPlaces objectAtIndex:indexPath.row] objectForKey:@"content"]);
	return [[self.myTopPlaces objectAtIndex:indexPath.row] objectForKey:@"_content"];
}
- (NSString *)descriptionAtIndexPath:(NSIndexPath *)indexPath
{
	
	//NSLog(@"locationAtIndexPath: %@",[self.myTopPlaces objectAtIndex:indexPath.row]); // [[self.myTopPlaces objectAtIndex:indexPath.row] objectForKey:@"content"]);
	return [[self.myTopPlaces objectAtIndex:indexPath.row] objectForKey:@"timezone"];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TopPlacesListTableView Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	//NSLog(@"IndexPath section: %d, row:  %d",  indexPath.section, indexPath.row);
    cell.textLabel.text = [self locationAtIndexPath:indexPath];
	cell.detailTextLabel.text = [self descriptionAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
	
	PhotoTableViewController *ptvc = [[PhotoTableViewController alloc] init];
	ptvc.aLocationArea = [self.myTopPlaces objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:ptvc animated:YES];
	[ptvc release];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[myTopPlaces release];
    [super dealloc];
}


@end

