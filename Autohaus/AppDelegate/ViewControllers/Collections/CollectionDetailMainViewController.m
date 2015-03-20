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
#import "BlurringView.h"
#import "UIImage+ImageEffects.h"
#import "Constants.h"

@interface CollectionDetailMainViewController ()
@property (strong, nonatomic) UIImageView  *imageActive;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollActive;
@property (strong, nonatomic) IBOutlet UITableView *tableViewMain;
@property (weak, nonatomic) IBOutlet UIView *viewActionButtons;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddCart;
@property (weak, nonatomic) IBOutlet UIButton *buttonInquire;

- (IBAction)inquirePressed:(id)sender;
- (IBAction)add2CartPressed:(id)sender;
- (IBAction)switchTapped:(id)sender;

@end

@implementation CollectionDetailMainViewController

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
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAppTheme];
    
    UIImage *image = [UIImage imageNamed:[self.selected valueForKey:@"images"]];
    self.imageActive = [[UIImageView alloc] initWithImage:image];
    self.imageActive.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    [self.scrollActive addSubview:self.imageActive];

    self.scrollActive.minimumZoomScale = 1.0;
    self.scrollActive.maximumZoomScale = 6.0;
    
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
    MFMailComposeViewController *mailer = [MFMailComposeViewController new];
    if ([MFMailComposeViewController canSendMail]) {
        [mailer setMailComposeDelegate:self];
        [mailer setSubject:@""];
        [mailer setToRecipients:kAppEmail];
        [self presentViewController:mailer animated:YES completion:^{
            [self.tabBarController.tabBar setTranslucent:NO];
        }];
    }
}

- (IBAction)add2CartPressed:(id)sender{
    Add2CartViewController *add2Cart = kStoryboard(@"Add2CartViewController");
    UIImage* blur = [self.view convertViewToImage];
    blur = [blur applyBlurWithRadius:20
                           tintColor:[UIColor colorWithWhite:1.0 alpha:0.2]
               saturationDeltaFactor:1.3
                           maskImage:nil];
    

    add2Cart.selected = self.selected;
    add2Cart.blurred = blur;
    [self.navigationController pushViewController:add2Cart animated:NO];
}

- (IBAction)switchTapped:(id)sender{
    CollectionDetailSubViewController *sub = kStoryboard(@"CollectionDetailSubViewController");
    sub.content = [self.selected objectForKey:@"desc"];
    [self.navigationController pushViewController:sub animated:NO];
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
        labelProductPrice.text = self.selected[@"name"];
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

-(CGFloat)textViewHeight:(UITextView *)textView {
    [textView.layoutManager ensureLayoutForTextContainer:textView.textContainer];
    CGRect usedRect = [textView.layoutManager usedRectForTextContainer:textView.textContainer];
    return ceilf(usedRect.size.height + textView.textContainerInset.top
                 +textView.textContainerInset.bottom) + 65.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITextView *protoTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 252, 44)];
    protoTextView.text = self.selected[@"desc"];
    float height = [self textViewHeight:protoTextView];
    return height + 65.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CellProduct";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    UITextView *textViewDescription = [[UITextView alloc] initWithFrame:CGRectMake(20.0f, 0.0f, cell.contentView.frame.size.width-20.0f, 44.0f)];
    
    textViewDescription.editable = YES;
    textViewDescription.font = SHOP_ITEM_DESC_TITLEFONT;
    textViewDescription.textColor = SHOP_ITEM_DESC_TITLECOLOR;
    textViewDescription.editable = NO;
    textViewDescription.scrollEnabled = NO;
    
    
    textViewDescription.text = self.selected[@"desc"];
    [cell.contentView addSubview:textViewDescription];
    CGRect frame = textViewDescription.frame;
    frame.size.height = [self textViewHeight:textViewDescription];
    textViewDescription.frame = frame;
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
