//
//  LocationDemoViewController.h
//  LocationDemo
//
//  Created by Michael Dales on 02/12/2009.
//  Copyright Michael Dales 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@class LocationDemoAnnotation;

@interface LocationDemoViewController : UIViewController <CLLocationManagerDelegate>
{	
	CLLocationManager	*locationManager;

	CLLocation	*startingPoint;
	
	CLLocation  *lastPoint;
	float lasttime;
	
	UILabel *latitudeLabel; 
	UILabel *longitudeLabel; 
	UILabel *horizontalAccuracyLabel; 
	UILabel *altitudeLabel; 
	UILabel *verticalAccuracyLabel; 
		
	MKMapView *mapView;
	
	LocationDemoAnnotation *mapAnnotation;
}
@property (retain, nonatomic) CLLocationManager *locationManager; 
@property (retain, nonatomic) CLLocation *startingPoint; 
@property (retain, nonatomic) CLLocation *lastPoint; 

@property (retain, nonatomic) IBOutlet UILabel *latitudeLabel; 
@property (retain, nonatomic) IBOutlet UILabel *longitudeLabel; 
@property (retain, nonatomic) IBOutlet UILabel *horizontalAccuracyLabel; 
@property (retain, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (retain, nonatomic) IBOutlet UILabel *verticalAccuracyLabel; 

@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@property (retain, nonatomic) LocationDemoAnnotation *mapAnnotation;

- (IBAction)testLocation;

@end

