//
//  LocationDemoAnnotation.h
//  LocationDemo
//
//  Created by Michael Dales on 12/03/2010.
//  Copyright 2010 Michael Dales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface LocationDemoAnnotation : NSObject <MKAnnotation, MKReverseGeocoderDelegate>
{
	// essential
	CLLocationCoordinate2D coordinate;
	
	// other
	MKPlacemark *placemark;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) MKPlacemark *placemark;

- (id)initWithCoordinate: (CLLocationCoordinate2D)coord;

- (NSString *)title;
- (NSString *)subtitle;

@end
