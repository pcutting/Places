//
//  VocabulousAppDelegate.h
//  Vocabulous
//
//  Created by CS193p Instructor on 10/21/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VocabulousAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

