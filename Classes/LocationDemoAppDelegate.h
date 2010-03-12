//
//  LocationDemoAppDelegate.h
//  LocationDemo
//
//  Created by Michael Dales on 02/12/2009.
//  Copyright Michael Dales 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocationDemoViewController;

@interface LocationDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LocationDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LocationDemoViewController *viewController;

@end

