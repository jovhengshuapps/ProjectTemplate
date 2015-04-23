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
@property (weak, nonatomic) IBOutlet UIView *hackCenterView;
@property (weak, nonatomic) IBOutlet UIButton *btnCall;
@property (weak, nonatomic) IBOutlet UIButton *btnEmail;
@property (nonatomic, retain) CMPopTipView *popTipView;
- (IBAction)callPressed:(id)sender;
- (IBAction)emailPressed:(id)sender;


@end

@implementation ContactUsViewController
@synthesize popTipView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Contact Us";
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = kAppLocation_lat;
    zoomLocation.longitude= kAppLocation_long;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.1*METERS_PER_MILE, 0.1*METERS_PER_MILE);
    
    [_mapView setRegion:viewRegion animated:YES];
    
    self.btnCall.titleLabel.font = CONTACTUS_BUTTONTEXTFONT;
    [self.btnCall setTitleColor:CONTACTUS_BUTTONTEXTCOLOR forState:UIControlStateNormal];
    
    self.btnEmail.titleLabel.font = CONTACTUS_BUTTONTEXTFONT;
    [self.btnEmail setTitleColor:CONTACTUS_BUTTONTEXTCOLOR forState:UIControlStateNormal];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self presentBubbleWithTitle:kAppAddress_Title andSubtitle:kAppAddress_Subtitle];
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

#pragma mark - MFMailComposeViewController Delegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [controller dismissViewControllerAnimated:YES completion:^{
        [self.tabBarController.tabBar setTranslucent:YES];
    }];
}

- (IBAction)callPressed:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kAppTelNumber]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kAppTelNumber]];
    }else{
        NSString *errMessage = @"This device is incapable of placing a call.";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Call Failed"
                                                        message:errMessage
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)emailPressed:(id)sender {
    
    MFMailComposeViewController *mailer = [MFMailComposeViewController new];
    [mailer setMailComposeDelegate:self];
    [mailer setSubject:@""];
    [mailer setToRecipients:kAppEmail];
    [self presentViewController:mailer animated:YES completion:^{
        [self.tabBarController.tabBar setTranslucent:NO];
    }];
    
}



#pragma mark bubble

-(void) presentBubbleWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle {
    
    if (self.popTipView) {
        [self.popTipView dismissAnimated:YES];
    }
    
    self.popTipView = [[CMPopTipView alloc] initWithTitle:title message:subtitle];
    self.popTipView.delegate = self;
    
    /* Some options to try.
     */
    //popTipView.disableTapToDismiss = YES;
    //popTipView.hasGradientBackground = NO;
    //popTipView.pointerSize = 50.0f;
    
    popTipView.sidePadding = 5.0f;
    popTipView.topMargin = 10.0f;
    
    self.popTipView.hasShadow = YES;
    self.popTipView.cornerRadius = 0.0;
    
    self.popTipView.titleFont = CONTACTUS_BUBBLETITLEFONT;
    self.popTipView.titleColor = CONTACTUS_BUBBLETITLECOLOR;
    
    self.popTipView.textFont = CONTACTUS_BUBBLESUBTITLEFONT;
    self.popTipView.textColor = CONTACTUS_BUBBLESUBTITLECOLOR;
    self.popTipView.textAlignment = NSTextAlignmentCenter;
    
    self.popTipView.maxWidth = self.mapView.bounds.size.width - 20.0f;
    
    self.popTipView.bubbleBackgroundColor = [UIColor colorWithWhite:0.0f alpha:0.6f];
    
    self.popTipView.animation = CMPopTipAnimationSlide;
    
    self.popTipView.preferredPointDirection = CMPopTipPointDirectionDown;
    
    self.popTipView.has3DStyle = NO;
    
    [self.popTipView presentPointingAtView:self.hackCenterView inView:self.view animated:YES];
    
}

#pragma mark - CMPopTipViewDelegate methods

- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView
{
    [self presentBubbleWithTitle:kAppAddress_Title andSubtitle:kAppAddress_Subtitle];
}


@end
