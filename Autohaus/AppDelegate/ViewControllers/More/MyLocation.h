//
//  MyLocation.h
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end