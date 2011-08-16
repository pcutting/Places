//
//  RecentPhoto.h
//  Places
//
//  Created by Philip Cutting on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RecentPhoto : NSObject {
}

+(void) add:(NSDictionary *)photoInfoFromFlickr;
//+(void) addRecentWithDate:(NSDictionary *)photoInfoFromFlickrWithDate;


+(NSArray *) listOfRecentlyVistitedPhotos;

+(void) clearNSUserDefaults;
@end
