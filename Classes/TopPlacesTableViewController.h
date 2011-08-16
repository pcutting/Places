//
//  TopPlacesTableViewController.h
//  Places
//
//  Created by Philip Cutting on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrFetcher.h"


@interface TopPlacesTableViewController : UITableViewController {
	NSArray *myTopPlaces;
}

@property (readonly) NSArray *myTopPlaces;

@end
