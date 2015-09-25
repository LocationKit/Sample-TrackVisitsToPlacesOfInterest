//
//  MyLocationKitDelegate.m
//  TrackVisitsToPlacesOfInterest
//
//  Created by Victor Quinn on 9/25/15.
//  Copyright © 2015 SocialRadar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyLocationKitDelegate.h"

@interface MyLocationKitDelegate ()

@end

@implementation MyLocationKitDelegate

// Implementing this just to show it's getting locations. Unnecessary for this use case
- (void)locationKit:(LocationKit *)locationKit didUpdateLocation:(CLLocation *)location {
    NSLog(@"LocationKit just got a new location (%f, %f)", location.coordinate.latitude, location.coordinate.longitude);
}

// This will be called whenever a visit is detected to one of your partners matching the
// filters you've set when initializing LocationKit.
- (void)locationKit:(LocationKit *)locationKit didStartVisit:(LKVisit *)visit {
    NSLog(@"LocationKit detected that a visit started at %@ to %@", visit.arrivalDate, visit.place.venue.name);
}

@end