//
//  RecentPhoto.m
//  Places
//
//  Created by Philip Cutting on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RecentPhoto.h"


@implementation RecentPhoto



+(NSArray *) listOfRecentlyVistitedPhotos
{
	[[NSUserDefaults standardUserDefaults] synchronize];
	NSArray *list = [[NSUserDefaults standardUserDefaults] objectForKey: @"recentPhotos"];
	
	
	if (!list) {		
		NSArray *somePlaces = [list copy];
		NSSortDescriptor *ascendingContentsDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
		NSArray *descriptors = [NSArray arrayWithObjects:ascendingContentsDescriptor, nil];
		
		list = nil;
		list = [[somePlaces sortedArrayUsingDescriptors:descriptors] retain];
		[ascendingContentsDescriptor release];			
	}
	
	if (list) {
		NSLog(@"There is a NSUserD list for recentPhotos. # %d", list.count);
		for (NSDictionary *item in list) {
			//NSLog(@"It has item: %@", item);
		}
	}
	
	return list;
}

+(void) clearNSUserDefaults
{
	[[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"recentPhotos"];
}

+(void) add:(NSDictionary *)photoInfoFromFlickr
{
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	NSArray *list = [[NSUserDefaults standardUserDefaults] objectForKey:@"recentPhotos"];
	NSMutableArray *extendedList = [NSMutableArray arrayWithArray:list];
	NSMutableDictionary *flickrAndDate = [[NSMutableDictionary alloc]init];
	[flickrAndDate setDictionary:photoInfoFromFlickr];
	[flickrAndDate setObject:[NSDate date] forKey:@"date"];
	[extendedList addObject:flickrAndDate];
	
	[[NSUserDefaults standardUserDefaults] setObject:extendedList forKey:@"recentPhotos"];
	
	NSArray *list2 = [[NSUserDefaults standardUserDefaults] objectForKey: @"recentPhotos"];
	if (list2) {
		NSLog(@"There is a NSUserD list for recentPhotos.");
		for (NSDictionary *item in list2) {
			NSLog(@"It has item: %@", item);
		}
	}
	
	[[NSUserDefaults standardUserDefaults] synchronize];
	[flickrAndDate release];
	[extendedList release];
	
}



@end
