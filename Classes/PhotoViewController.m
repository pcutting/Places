    //
//  PhotoViewController.m
//  Places
//
//  Created by Philip Cutting on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"
#import "RecentPhoto.h"


@implementation PhotoViewController

@synthesize flickrObject, photoView; //, photo; 

-(void)setFlickrObject:(NSDictionary *)aFlickrObject
{
	[flickrObject release];
	flickrObject = aFlickrObject;
	[RecentPhoto add:aFlickrObject];
	[RecentPhoto listOfRecentlyVistitedPhotos];
}

/*
-(UIImage *)photo
{
	if (!photo) {
		photo = [[UIImage alloc] initWithData:[FlickrFetcher imageDataForPhotoWithFlickrInfo:flickrObject format:FlickrFetcherPhotoFormatLarge]];
		//NSLog(@"Photo data %@" , [FlickrFetcher imageDataForPhotoWithFlickrInfo:flickrObject format:FlickrFetcherPhotoFormatLarge] );
	}
	return photo;
}
 */


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {

	[super loadView];
	
	
	//UIImage *image = [[UIImage alloc] initWithData:[FlickrFetcher imageDataForPhotoWithFlickrInfo:flickrObject format:FlickrFetcherPhotoFormatLarge]];
	UIImage *image = [[UIImage alloc] initWithData:[FlickrFetcher imageDataForPhotoWithFlickrInfo:flickrObject format:FlickrFetcherPhotoFormatLarge]];
	
	self.photoView = [[UIImageView alloc] initWithImage:image];
	
	CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: applicationFrame];
	//scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	scrollView.contentSize = image.size;  //!!
	
	//[scrollView addSubview:imageView]; //!!
	[scrollView addSubview:self.photoView];
	self.title = [self.flickrObject objectForKey:@"title"];
	scrollView.bounces = NO; //!!
	
	scrollView.minimumZoomScale = 0.25;  
	scrollView.maximumZoomScale = 4;
	scrollView.delegate = self;
	[scrollView zoomToRect:applicationFrame animated:NO];
	
	[self.view addSubview:scrollView];
	//[image release];
	//[scrollView release];
	
	
	
	
	
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return self.photoView;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}


- (void)dealloc {

	[flickrObject release];
	[photoView release];
	
    [super dealloc];
}


@end
