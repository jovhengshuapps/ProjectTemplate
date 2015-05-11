//
//  CollectionDetailSubViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/13/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "CollectionDetailSubViewController.h"
#import "BaseConfig.h"

@interface CollectionDetailSubViewController ()
@property (strong, nonatomic) IBOutlet UITableView  *tableViewMain;

- (IBAction)switchTapped:(id)sender;

@end

@implementation CollectionDetailSubViewController

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
    [UIView animateWithDuration:0.4
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAppTheme];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:0.4
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
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

}

- (IBAction)switchTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}
#pragma mark - Delegate Methods



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
        UILabel *labelProductName = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 10.0f, viewHeader.frame.size.width-15.0f, 25.0f)];
        labelProductName.font = SHOP_ITEM_DESC_TITLEFONT;
        labelProductName.textColor = SHOP_ITEM_DESC_TEXTCOLOR;
        labelProductName.backgroundColor = [UIColor whiteColor];
        labelProductName.text = self.selected[@"name"];
        [viewHeader addSubview:labelProductName];
        
        UILabel *labelProductPrice = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 35.0f, viewHeader.frame.size.width-15.0f, 25.0f)];
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
        return 60.0f;
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
