//
//  ContactUsViewController.m
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "ContactUsViewController.h"
#import "MyLocation.h"

#define METERS_PER_MILE 1609.344

@interface ContactUsViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnCall;
@property (weak, nonatomic) IBOutlet UIButton *btnEmail;
- (IBAction)callPressed:(id)sender;
- (IBAction)emailPressed:(id)sender;


@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Contact Us";
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 1.336504;
    zoomLocation.longitude= 103.759568;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.1*METERS_PER_MILE, 0.1*METERS_PER_MILE);
    
    [_mapView setRegion:viewRegion animated:YES];
    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 1.337652;
    coordinate.longitude = 103.759775;
    MyLocation *annotation = [[MyLocation alloc] initWithName:@"Autohaus Trading and Services" address:@"21 Bukit Batok Crescent #09-79 WCEGA Tower Singapore 658065" coordinate:coordinate];
    [_mapView addAnnotation:annotation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)callPressed:(id)sender {
}

- (IBAction)emailPressed:(id)sender {
}
@end
