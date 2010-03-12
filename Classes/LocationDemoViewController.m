//
//  LocationDemoViewController.m
//  LocationDemo
//
//  Created by Michael Dales on 02/12/2009.
//  Copyright Michael Dales 2009. All rights reserved.
//

#include <sys/time.h>

#import "LocationDemoViewController.h"
#import "LocationDemoAnnotation.h"

@implementation LocationDemoViewController

@synthesize locationManager; 
@synthesize startingPoint; 
@synthesize lastPoint;
@synthesize latitudeLabel; 
@synthesize longitudeLabel; 
@synthesize horizontalAccuracyLabel; 
@synthesize altitudeLabel; 
@synthesize verticalAccuracyLabel; 
@synthesize mapView;
@synthesize mapAnnotation;

- (IBAction)testLocation
{
	// scale the map view to show something sensible, rather than entire
	// planet
	MKCoordinateRegion region;
	region.center = lastPoint.coordinate;
	region.span.latitudeDelta = 0.002;
	region.span.longitudeDelta = 0.002;
	
	[mapView setRegion: region
			  animated: YES];
}


#pragma mark -



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	CLLocationCoordinate2D coord;
	coord.latitude = 37.331;
	coord.longitude = -122.03;
	
	self.mapAnnotation = [[LocationDemoAnnotation alloc] initWithCoordinate: coord];
	
	self.locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	[locationManager startUpdatingLocation];
	
	[mapView addAnnotation: mapAnnotation];
	
	mapView.showsUserLocation = YES;
}



- (void)viewDidUnload {
	// Release any retained subviews of the main view.

	[locationManager stopUpdatingLocation];

	self.locationManager = nil;
	self.startingPoint = nil;
	self.lastPoint = nil;
	self.latitudeLabel = nil;
	self.longitudeLabel = nil;
	self.horizontalAccuracyLabel = nil;
	self.altitudeLabel = nil;
	self.verticalAccuracyLabel = nil;
}


- (void)dealloc 
{	
	[locationManager release];
	[startingPoint release];
	[lastPoint release];
	[latitudeLabel release];
	[longitudeLabel release];
	[horizontalAccuracyLabel release];
	[altitudeLabel release];
	[verticalAccuracyLabel release];
    [super dealloc];
}

#pragma mark -
#pragma mark Location methods

- (void)locationManager: (CLLocationManager *)manager
	didUpdateToLocation: (CLLocation *)newLocation 
		   fromLocation: (CLLocation *)oldLocation
{	
	struct timeval now;
	gettimeofday(&now, NULL);
	
	if (startingPoint == nil)
		self.startingPoint = newLocation;
	
	[mapView setCenterCoordinate: newLocation.coordinate
						animated: YES];

	
	NSString *latitudeString = [[NSString alloc] initWithFormat: @"%g°", 
								newLocation.coordinate.latitude];
	latitudeLabel.text = latitudeString; 
	[latitudeString release];
	
	NSString *longitudeString = [[NSString alloc] initWithFormat: @"%g°", 
								 newLocation.coordinate.longitude];
	longitudeLabel.text = longitudeString; 
	[longitudeString release];
	
	NSString *hString = [[NSString alloc] initWithFormat: @"%gm", 
						 newLocation.horizontalAccuracy];
	horizontalAccuracyLabel.text = hString; 
	[hString release];
	
	hString = [[NSString alloc] initWithFormat: @"%gm", 
						 newLocation.altitude];
	altitudeLabel.text = hString; 
	[hString release];
	
	hString = [[NSString alloc] initWithFormat: @"%gm", 
			   newLocation.verticalAccuracy];
	verticalAccuracyLabel.text = hString; 
	[hString release];
	
	self.lastPoint = newLocation;
}

- (void)locationManager:(CLLocationManager *)manager 
	   didFailWithError:(NSError *)error 
{
	NSString *errorType = (error.code == kCLErrorDenied) ? @"Access Denied" : @"Unknown Error";
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting Location"
													message:errorType
												   delegate:nil
										  cancelButtonTitle:@"Okay" 
										  otherButtonTitles:nil]; 
	[alert show]; 
	[alert release];
}

@end
