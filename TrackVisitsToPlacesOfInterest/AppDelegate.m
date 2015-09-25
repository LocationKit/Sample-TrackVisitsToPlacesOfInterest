//
//  AppDelegate.m
//  TrackVisitsToPlacesOfInterest
//
//  Created by Victor Quinn on 9/25/15.
//  Copyright © 2015 SocialRadar. All rights reserved.
//

#import "AppDelegate.h"
#import <LocationKit/LocationKit.h>
#import "MyLocationKitDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

MyLocationKitDelegate *mlkDelegate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Initialize LocationKit with a single filter, in this case triggering
    // whenever a user visits a Starbucks. Can add multiple filters (it's an
    // array) so you could trigger for any of your partners.

    // 1. Create the filter
    LKFilter *starbucks = [[LKFilter alloc] init];
    // 2. Assign the criteria, in this case a name of Starbucks
    starbucks.venueName = @"Starbucks";

    // 3. Let's add another filter so this fires on visits to both Starbucks and any breweries
    LKFilter *breweries = [[LKFilter alloc] init];
    breweries.venueCategory = @"Breweries";

    // 3. Make it an array (because LocationKit will accept multiple filters)
    NSArray *myFilters = [NSArray arrayWithObjects:starbucks, breweries, nil];

    // 4. Add it to the list of options when launching LocationKit
    NSDictionary *options = @{ LKOptionFilter: myFilters };
    
    // 5. Instantiate our Delegate
    mlkDelegate = [[MyLocationKitDelegate alloc] init];
    
    // 5. Initialize LocationKit with those options
    [[LocationKit sharedInstance] startWithApiToken:@"myToken" delegate:mlkDelegate options:options];
    
    return YES;
}

@end
