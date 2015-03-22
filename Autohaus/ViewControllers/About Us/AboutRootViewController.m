//
//  AboutRootViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/8/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "AboutRootViewController.h"
#import "Constants.h"

@interface AboutRootViewController ()
@property (strong, nonatomic) IBOutlet UIImageView  *background;

@property (strong, nonatomic) IBOutlet UILabel      *header;
@property (strong, nonatomic) IBOutlet UITextView   *content;

@end

@implementation AboutRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAppTheme];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
- (void)initAppTheme{
//    self.background.image = kAppBackground;
    UIImageView *navBarTitle = [[UIImageView alloc] initWithImage:kAppLogo_Nav];
    [self.navigationItem setTitleView:navBarTitle];

    self.header.font = kFONT_CentGothicBold(16);
    self.content.font = kFONT_CentGothic(14);
}
#pragma mark - Delegate Methods

@end
