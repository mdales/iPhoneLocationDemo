//
//  LocationDemoAppDelegate.m
//  LocationDemo
//
//  Created by Michael Dales on 02/12/2009.
//  Copyright Michael Dales 2009. All rights reserved.
//

#import "LocationDemoAppDelegate.h"
#import "LocationDemoViewController.h"

@implementation LocationDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
