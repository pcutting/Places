//
//  RecentlyViewedPhotoController.h
//  Places
//
//  Created by Philip Cutting on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecentPhoto.h"


@interface RecentlyViewedPhotoController : UITableViewController {
	NSArray * visitedList;
	
}

@property (retain) NSArray *visitedList;


@end
