//
//  PhotoTableViewController.h
//  Places
//
//  Created by Philip Cutting on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoTableViewController : UITableViewController {
	NSDictionary *aLocationArea; //should probably be a delegate 
	NSArray *photos;
}

//@property (readonly) NSArray *photos;
@property (retain) NSDictionary *aLocationArea;

@end
