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
#import "BaseConfig.h"


static int width    = 320;
static int height   = 147;

@interface Add2CartViewController ()
@property (strong, nonatomic) IBOutlet UIImageView  *background;
@property (strong, nonatomic) IBOutlet UIView       *viewAdd2Cart;
@property (strong, nonatomic) IBOutlet UILabel      *lblProductName;
@property (strong, nonatomic) IBOutlet UILabel      *lblProductPrice;
@property (strong, nonatomic) IBOutlet UIImageView  *imgProductImage;
@property (strong, nonatomic) IBOutlet UITextField  *txtQuantity;
@property (weak, nonatomic) IBOutlet UILabel *qtyLabel;


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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initAppTheme];
    self.lblProductName.text    = [self.selected  objectForKey:@"name"];
    self.lblProductPrice.text   = kToPrice([self.selected objectForKey:@"price"]);
    
//    NSLog(@"imageURL:%@",[self.selected objectForKey:@"image"]);
    
    UIImage *imageProduct = [UIImage imageNamed:@"login_logo_iPhone"];
    
    NSURL *imageURL = [NSURL URLWithString:[self.selected objectForKey:@"image"]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        if (imageData) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Update the UI
                self.imgProductImage.image  = [UIImage imageWithData:imageData];
                
                
            });
        }
        else {
            self.imgProductImage.image  = imageProduct;
        }
    });
    
    
    
    [self.viewAdd2Cart setHidden:YES];
    [self animateViewAdd2Cart];
}

- (void) animateViewAdd2Cart {
    
    //ANIMATE TRANSITION EFFECT();
    CATransition *transition = [CATransition animation];
    transition.duration = 0.6;
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    //ANIMATE CONTAINER();
    [self.viewAdd2Cart setFrame:CGRectMake(0, 0, width, 0)];
    
    [UIView animateWithDuration:0.50 animations:^{
        //SET POSITION
        [self.viewAdd2Cart setHidden:NO];
        [self.viewAdd2Cart setFrame:CGRectMake(0, 0, width, height)];
    }];
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

    self.lblProductName.font    = SHOP_ADDCART_NAME_FONT;
    self.lblProductName.textColor = SHOP_ADDCART_NAME_COLOR;
    self.lblProductPrice.font   = SHOP_ADDCART_PRICE_FONT;
    self.lblProductPrice.textColor = SHOP_ADDCART_PRICE_COLOR;
    self.qtyLabel.font = SHOP_ADDCART_QTYLABEL_FONT;
    self.qtyLabel.textColor = SHOP_ADDCART_QTYLABEL_COLOR;
    self.imgProductImage.layer.borderColor = SHOP_ADDCART_IMAGE_BORDERCOLOR.CGColor;
    self.imgProductImage.layer.borderWidth = 2.0f;
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
    
    
    [[WebserviceCall new] addToCartWithParameters:@{@"item_id":@0001,@"qty":[NSNumber numberWithInteger:[self.txtQuantity.text integerValue]]} completion:^(id response) {
        
        
        Utilities *convert = [Utilities new];
        float price = [[self.selected valueForKey:@"price"] floatValue];
        UIImage *image = self.imgProductImage.image;//[UIImage imageNamed:[self.selected objectForKey:@"image"]];
        //    NSLog(@"price:%f[%@]",price,[self.selected valueForKey:@"price"]);
        NSDictionary *param = @{
                                @"name" : [self.selected objectForKey:@"name"],
                                @"image": [convert imageToData:image],
                                @"price": [NSNumber numberWithFloat:price],
                                @"qty"  : [NSNumber numberWithInteger:[self.txtQuantity.text integerValue]],
                                };
        
        
        CartInterface *cart = [CartInterface new];
        
        [cart postWithParameters:param completion:^(BOOL finished) {
            [kNotifCenter postNotificationName:@"pop" object:self];
            [self.navigationController popViewControllerAnimated:NO];
        }];
        
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
