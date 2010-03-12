//
//  LocationDemoAnnotation.m
//  LocationDemo
//
//  Created by Michael Dales on 12/03/2010.
//  Copyright 2010 Michael Dales. All rights reserved.
//

#import "LocationDemoAnnotation.h"


@implementation LocationDemoAnnotation

@synthesize coordinate;
@synthesize placemark;

- (id)initWithCoordinate: (CLLocationCoordinate2D)coord
{
	if ((self = [super init]) != nil)
	{
		// essential
		coordinate = coord;
		
		self.placemark = nil;
		
		// other
		MKReverseGeocoder *geocoder = [[MKReverseGeocoder alloc] initWithCoordinate: coordinate];
		geocoder.delegate = self;
		[geocoder start];
	}
	return self;
}

- (NSString *)subtitle
{
	
	if (placemark != nil)
		return [NSString stringWithFormat: @"%@, %@", 
							   placemark.thoroughfare, placemark.locality];
	else
		return @"somewhere or another";
}

- (NSString *)title
{
	return [NSString stringWithFormat: @"Pin at by %f %f", 
			coordinate.latitude, coordinate.longitude];
}

- (void)dealloc
{
	[placemark release];
	[super dealloc];
}


#pragma mark - 
#pragma mark reverse geocoder delegate methods

- (void)reverseGeocoder: (MKReverseGeocoder *)geocoder 
	   didFailWithError: (NSError *)error 
{
	NSLog(@"Error resolving coordinates: %@", [error localizedDescription]); 
	geocoder.delegate = nil; 
	[geocoder autorelease];
}

- (void)reverseGeocoder: (MKReverseGeocoder *)geocoder 
	   didFindPlacemark: (MKPlacemark *)pplacemark 
{
	self.placemark = pplacemark;
	geocoder.delegate = nil; 
	[geocoder autorelease];
}


@end
