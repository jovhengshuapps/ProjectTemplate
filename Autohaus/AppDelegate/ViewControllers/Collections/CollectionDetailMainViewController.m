//
//  CollectionDetailMainViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/13/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "CollectionDetailMainViewController.h"
#import "CollectionDetailSubViewController.h"
#import "Add2CartViewController.h"
#import "InquiryViewController.h"
#import "BlurringView.h"
#import "UIImage+ImageEffects.h"
#import "BaseConfig.h"

@interface CollectionDetailMainViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollActive;
@property (strong, nonatomic) UIImageView  *imageActive;
@property (strong, nonatomic) IBOutlet UITableView *tableViewMain;
@property (weak, nonatomic) IBOutlet UIView *viewActionButtons;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddCart;
@property (weak, nonatomic) IBOutlet UIButton *buttonInquire;

- (IBAction)inquirePressed:(id)sender;
- (IBAction)add2CartPressed:(id)sender;
- (IBAction)switchTapped:(id)sender;

@end

@implementation CollectionDetailMainViewController
//@synthesize image;
@synthesize selected;

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
    [self.scrollActive setZoomScale:1.0];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAppTheme];
    
    if (self.imageActive == nil) {
        self.imageActive = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageActive.contentMode = UIViewContentModeScaleAspectFill;
        self.imageActive.clipsToBounds = YES;
    }
    
    UIImage *imageProduct = [UIImage imageNamed:@"login_logo_iPhone"];
    
    NSURL *imageURL = [NSURL URLWithString:[self.selected valueForKey:@"image"]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        if (imageData) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Update the UI
                [self.imageActive setImage:[UIImage imageWithData:imageData]];
                [self.scrollActive addSubview:self.imageActive];
            });
        }
        else {
            [self.imageActive setImage:imageProduct];
            [self.scrollActive addSubview:self.imageActive];
        }
    });
    

    self.scrollActive.minimumZoomScale = 1.0;
    self.scrollActive.maximumZoomScale = 6.0;
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.imageActive.frame = CGRectMake(10.0f, 10.0f, self.scrollActive.frame.size.width - 20.0f, 253.0f);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
- (void)initAppTheme{
    
    UIImageView *navBarTitle = [[UIImageView alloc] initWithImage:kAppLogo_Nav];
    [self.navigationItem setTitleView:navBarTitle];

    self.viewActionButtons.backgroundColor = SHOP_ITEM_DESC_ACTIONBOX;
    [self.buttonAddCart setBackgroundColor:SHOP_ITEM_DESC_ADDCARTBTNCOLOR];
    self.buttonAddCart.titleLabel.font = SHOP_ITEM_DESC_ADDCARTBTNFONT;
    [self.buttonAddCart setTitleColor:SHOP_ITEM_DESC_ADDCARTBTNTXTCLR forState:UIControlStateNormal];
    [self.buttonInquire setBackgroundColor:SHOP_ITEM_DESC_ADDCARTBTNCOLOR];
    self.buttonInquire.titleLabel.font = SHOP_ITEM_DESC_ADDCARTBTNFONT;
    [self.buttonInquire setTitleColor:SHOP_ITEM_DESC_ADDCARTBTNTXTCLR forState:UIControlStateNormal];
    
}


#pragma mark IBActions
- (IBAction)inquirePressed:(id)sender{
//    InquiryViewController *inquiry = kStoryboard(@"InquiryViewController");
//    UIImage* blur = [self.view convertViewToImage];
//    blur = [blur applyBlurWithRadius:20
//                           tintColor:[UIColor colorWithWhite:1.0 alpha:0.2]
//               saturationDeltaFactor:1.3
//                           maskImage:nil];
//    
//    inquiry.backgroundImage = blur;
//    [self.navigationController pushViewController:inquiry animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushInquiry"]) {
        
        InquiryViewController *inquiry = (InquiryViewController*)[segue destinationViewController];
        UIImage* blur = [self.view convertViewToImage];
        blur = [blur applyBlurWithRadius:20
                               tintColor:[UIColor colorWithWhite:1.0 alpha:0.2]
                   saturationDeltaFactor:1.3
                               maskImage:nil];
        
        inquiry.backgroundImage = blur;
    }
    else if ([segue.identifier isEqualToString:@"pushAddCart"]) {
        
        Add2CartViewController *add2Cart = (Add2CartViewController*)[segue destinationViewController];
        UIImage* blur = [self.view convertViewToImage];
        blur = [blur applyBlurWithRadius:20
                               tintColor:[UIColor colorWithWhite:1.0 alpha:0.2]
                   saturationDeltaFactor:1.3
                               maskImage:nil];
        
        
        add2Cart.selected = [NSMutableDictionary dictionaryWithDictionary:self.selected];
        add2Cart.blurred = blur;
    }
}


- (IBAction)add2CartPressed:(id)sender{
//    Add2CartViewController *add2Cart = kStoryboard(@"Add2CartViewController");
//    UIImage* blur = [self.view convertViewToImage];
//    blur = [blur applyBlurWithRadius:20
//                           tintColor:[UIColor colorWithWhite:1.0 alpha:0.2]
//               saturationDeltaFactor:1.3
//                           maskImage:nil];
//    
//
//    add2Cart.selected = self.selected;
//    add2Cart.blurred = blur;
//    [self.navigationController pushViewController:add2Cart animated:NO];
}

- (IBAction)switchTapped:(id)sender{
    CollectionDetailSubViewController *sub = kStoryboard(@"CollectionDetailSubViewController");
    sub.selected = self.selected;
    [self.navigationController pushViewController:sub animated:YES];
//    [self.tableViewMain selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] animated:YES scrollPosition:UITableViewScrollPositionTop];
}
#pragma mark Animations


#pragma mark - Delegate Methods

#pragma mark UIScrollView
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    if ([scrollView isEqual:self.scrollActive]) {
        return self.imageActive;
    }
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.tableViewMain]) {
        [self.scrollActive setZoomScale:1.0 animated:YES];
    }
}

#pragma mark - MFMailComposeViewController Delegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [controller dismissViewControllerAnimated:YES completion:^{
        [self.tabBarController.tabBar setTranslucent:YES];
    }];
}

#pragma mark - UITableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 25.0f)];
    viewHeader.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        CGRect frame = viewHeader.frame;
        frame.size.height = 50.0f;
        viewHeader.frame = frame;
        UILabel *labelProductName = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 0.0f, viewHeader.frame.size.width-15.0f, 25.0f)];
        labelProductName.font = SHOP_ITEM_DESC_TITLEFONT;
        labelProductName.textColor = SHOP_ITEM_DESC_TEXTCOLOR;
        labelProductName.backgroundColor = [UIColor whiteColor];
        labelProductName.text = self.selected[@"name"];
        [viewHeader addSubview:labelProductName];
        
        UILabel *labelProductPrice = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 25.0f, viewHeader.frame.size.width-15.0f, 25.0f)];
        labelProductPrice.font = SHOP_ITEM_DESC_PRICEFONT;
        labelProductPrice.textColor = SHOP_ITEM_DESC_PRICECOLOR;
        labelProductPrice.backgroundColor = [UIColor whiteColor];
        labelProductPrice.text = kToPrice(self.selected[@"price"]);
        [viewHeader addSubview:labelProductPrice];
    }
    else {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 0.0f, viewHeader.frame.size.width-15.0f, 25.0f)];
        label.font = SHOP_ITEM_DESC_TITLEFONT;
        label.textColor = SHOP_ITEM_DESC_TEXTCOLOR;
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"Product Description";
        [viewHeader addSubview:label];
    }
    return viewHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50.0f;
    }
    return 25.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 20.0f;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 20.0f)];
    return viewHeader;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGRect labelSize = [self.selected[@"desc"] boundingRectWithSize:CGSizeMake(self.tableViewMain.frame.size.width, 9999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:SHOP_ITEM_DESC_TITLECOLOR,NSForegroundColorAttributeName,SHOP_ITEM_DESC_TITLEFONT,NSFontAttributeName, nil] context:nil];
    
    return labelSize.size.height + 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CellProduct";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
   
    
    UIWebView *webView = (UIWebView*)[cell viewWithTag:1111];
    
    if (webView == nil) {
        webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        webView.scalesPageToFit = NO;
        webView.userInteractionEnabled = NO;
        webView.tag = 1111;
        [cell.contentView addSubview:webView];
        
        webView.backgroundColor = [UIColor clearColor];
        webView.opaque = NO;
        
    }
    
    CGRect labelSize = [self.selected[@"desc"] boundingRectWithSize:CGSizeMake(self.tableViewMain.frame.size.width, 9999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:SHOP_ITEM_DESC_TITLECOLOR,NSForegroundColorAttributeName,SHOP_ITEM_DESC_TITLEFONT,NSFontAttributeName, nil] context:nil];
    
    webView.frame = CGRectMake(5.0f, 5.0f, labelSize.size.width - 10.0f, labelSize.size.height + 50.0f);
    
    NSString *htmlString = [NSString stringWithFormat:@"<span style=\"font-family: 'HelveticaNeue-CondensedBold'; font-size: 18\">%@</span>",self.selected[@"desc"]];
    
    [webView loadHTMLString:htmlString baseURL:nil];
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    cell.textLabel.hidden = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
