//
//  PhotoViewController.h
//  Places
//
//  Created by Philip Cutting on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrFetcher.h"
#import "RecentPhoto.h"


@interface PhotoViewController : UIViewController <UIScrollViewDelegate> {
	//UIImage *photo;
	NSDictionary *flickrObject;
	UIImageView *photoView;
}

//@property (retain) UIImage *photo;
@property (retain) NSDictionary *flickrObject;
@property (retain) UIImageView *photoView;




@end
