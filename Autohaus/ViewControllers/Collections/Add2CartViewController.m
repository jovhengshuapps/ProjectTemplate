//
//  Add2CartViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/14/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "Add2CartViewController.h"
#import "CartInterface.h"
#import "Utilities.h"
#import "Cart.h"
#import "Constants.h"

static int width    = 320;
static int height   = 147;

@interface Add2CartViewController ()
@property (strong, nonatomic) IBOutlet UIImageView  *background;
@property (strong, nonatomic) IBOutlet UIView       *viewAdd2Cart;
@property (strong, nonatomic) IBOutlet UILabel      *lblProductName;
@property (strong, nonatomic) IBOutlet UILabel      *lblProductPrice;
@property (strong, nonatomic) IBOutlet UIImageView  *imgProductImage;
@property (strong, nonatomic) IBOutlet UITextField  *txtQuantity;


@end

@implementation Add2CartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.viewAdd2Cart setHidden:YES];
    
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                               style:UIBarButtonItemStyleBordered
                                                              target:self
                                                              action:@selector(cancelTapped:)];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                               style:UIBarButtonItemStyleBordered
                                                              target:self
                                                              action:@selector(add2CartTapped:)];
    
    self.navigationItem.leftBarButtonItem   = cancel;
    self.navigationItem.rightBarButtonItem  = add;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //ANIMATE TRANSITION EFFECT();
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    //ANIMATE CONTAINER();
    [self.viewAdd2Cart setFrame:CGRectMake(0, 64, width, 0)];
    
    [UIView animateWithDuration:0.50 animations:^{
        //SET POSITION
        [self.viewAdd2Cart setHidden:NO];
        [self.viewAdd2Cart setFrame:CGRectMake(0, 64, width, height)];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lblProductName.text    = [self.selected  valueForKey:@"name"];
    self.lblProductPrice.text   = kToPrice([self.selected valueForKey:@"price"]);
    self.imgProductImage.image  = [UIImage imageNamed:[self.selected valueForKey:@"images"][0]];
    
    [self initAppTheme];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
}

#pragma mark - Custom Methods
- (void)initAppTheme{
    self.background.image = self.blurred;
    self.view.backgroundColor = [UIColor clearColor];
    self.background.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    UIImageView *navBarTitle = [[UIImageView alloc] initWithImage:kAppLogo_Nav];
    [self.navigationItem setTitleView:navBarTitle];

    self.lblProductName.font    = kFONT_CentGothicBold(24);
    self.lblProductPrice.font   = kFONT_CentGothic(22);
}

- (void)cancelTapped:(UIBarButtonItem*)sender{
    [UIView animateWithDuration:0.40 animations:^{
        [self.viewAdd2Cart setFrame:CGRectMake(0, 64, width, 0)];
    } completion:^(BOOL finished) {
        [self.viewAdd2Cart setHidden:YES];
        self.background.image = nil;
        [self.navigationController popViewControllerAnimated:NO];
    }];
}

- (void)add2CartTapped:(UIBarButtonItem*)sender{
    Utilities *convert = [Utilities new];
    float price = [[self.selected valueForKey:@"price"] floatValue];
    UIImage *image = [UIImage imageNamed:[self.selected objectForKey:@"images"][0]];
    
    
    NSDictionary *param = @{
                            @"name" : [self.selected valueForKey:@"name"],
                            @"image": [convert imageToData:image],
                            @"price": [NSNumber numberWithFloat:price],
                            @"qty"  : [NSNumber numberWithInteger:[[NSString stringWithFormat:@"%@",self.txtQuantity.text] integerValue]],
                            };
    
    CartInterface *cart = [CartInterface new];
    
    [cart postWithParameters:param completion:^(BOOL finished) {
        [kNotifCenter postNotificationName:@"pop" object:self];
        [self.navigationController popViewControllerAnimated:NO];
    }];
}

- (IBAction)plusTapped:(id)sender{
    [self.txtQuantity setText:[NSString stringWithFormat:@"%ld", (long)[self.txtQuantity.text integerValue] +1]];
}

- (IBAction)minusTapped:(id)sender{
    if ([self.txtQuantity.text integerValue] > 1) {
        [self.txtQuantity setText:[NSString stringWithFormat:@"%ld", (long)[self.txtQuantity.text integerValue] -1]];
    }else{
        [self.txtQuantity setText:@"1"];
    }
}

- (void)alert:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kAppName
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - Delegate Methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (!buttonIndex == [alertView cancelButtonIndex]) {
        NSLog(@"show login");
    }else{
        NSLog(@"cancel");
    }
}

@end
