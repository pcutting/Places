//
//  PlacesAppDelegate.h
//  Places
//
//  Created by Philip Cutting on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrFetcher.h"
#import "TopPlacesTableViewController.h"

@interface PlacesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *tbc;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (retain) UITabBarController *tbc;

@end

