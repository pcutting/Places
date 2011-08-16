//
//  PhotoTableViewController.m
//  Places
//
//  Created by Philip Cutting on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoTableViewController.h"
#import "TopPlacesTableViewController.h"
#import "FlickrFetcher.h"
#import "PhotoViewController.h"
#import "RecentPhoto.h"


@interface PhotoTableViewController()
@property (retain) NSArray *photos;
@end

@implementation PhotoTableViewController


@synthesize aLocationArea;
@synthesize photos;

-(NSArray *)photos
{
	if (!photos) {		
		NSArray *somePlaces =  [FlickrFetcher photosAtPlace:[self.aLocationArea objectForKey:@"place_id"]];		
		NSSortDescriptor *ascendingTitleDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
		NSSortDescriptor *ascendingTagsDescriptor = [[NSSortDescriptor alloc] initWithKey:@"tags" ascending:YES];
		NSArray *descriptors = [NSArray arrayWithObjects:ascendingTitleDescriptor, ascendingTagsDescriptor, nil];
		photos = [[somePlaces sortedArrayUsingDescriptors:descriptors] retain];
		[ascendingTitleDescriptor release];
		[ascendingTagsDescriptor release];
		
	}
	
	return photos;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}

#pragma mark -
#pragma mark Initialization

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




- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = [self.aLocationArea objectForKey:@"_content"];

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
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.photos.count;
}


-(NSString *) cellTitle:(NSIndexPath *)indexPath
{
	//NSLog(@"Location %@", [self.photos objectAtIndex:indexPath.row]);	
	//NSString *str = [FlickrFetcher  urlStringForPhotoWithFlickrInfo:[self.photos objectAtIndex:indexPath.row]  format:FlickrFetcherPhotoFormatLarge];
	//NSLog(@"string info: %@", str);
	
	//NSLog(@"imageData: %@",[FlickrFetcher imageDataForPhotoWithFlickrInfo:[self.photos objectAtIndex:indexPath.row]  format:FlickrFetcherPhotoFormatLarge]);		
	//NSLog(@"URLString: %@", [FlickrFetcher imageDataForPhotoWithURLString:str]);		  	
	return [[self.photos objectAtIndex:indexPath.row] objectForKey:@"title"];
}

-(NSString *) cellDetail:(NSIndexPath *)indexPath
{	
	return [[self.photos objectAtIndex:indexPath.row] objectForKey:@"tags"];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"AreaOfInterestTableView Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [self cellTitle:indexPath]; 
	cell.detailTextLabel.text = [self cellDetail:indexPath];
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
	
	PhotoViewController *pvc = [[PhotoViewController alloc]init];
	pvc.flickrObject = [self.photos objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:pvc animated:YES];
	[pvc release];
	

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
	[aLocationArea release];
    [super dealloc];
}


@end

