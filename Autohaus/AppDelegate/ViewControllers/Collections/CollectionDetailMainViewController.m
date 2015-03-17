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

@interface CollectionDetailMainViewController (){
#warning TEMPORARY
    NSArray *colors;
}
//@property (strong, nonatomic) IBOutlet UIImageView  *background;
@property (strong, nonatomic) /*IBOutlet*/ UIImageView  *imageActive;
//@property (strong, nonatomic) IBOutlet UIScrollView *scrollImageList;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollColorList;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollActive;
@property (strong, nonatomic) IBOutlet UILabel      *productName;
@property (strong, nonatomic) IBOutlet UILabel      *productPrice;
@property (strong, nonatomic) IBOutlet UIView       *containerName;
@property (strong, nonatomic) IBOutlet UIView       *containerPrice;

@property (strong, nonatomic) IBOutlet UITableView *tableViewMain;

@property (strong, nonatomic) NSArray *imageList;

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
    self.imageList = [self.selected valueForKey:@"images"];
//    [self loadImageList:[self.selected valueForKey:@"images"] selectedIndex:0];
    [self loadColorList:colors selectedIndex:0];
    [self.scrollActive setZoomScale:1.0];
//    [self.scrollActive setContentOffset:CGPointMake(+40, 0) animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAppTheme];
    
    self.productName.text = [self.selected valueForKey:@"name"];
    self.productPrice.text = kToPrice([self.selected valueForKey:@"price"]);
    self.productName.font = kFONT_CentGothic(24);
    self.productName.minimumScaleFactor = 0.35;
    self.productPrice.font = kFONT_CentGothicBold(22);
    
    UIImage *image = [UIImage imageNamed:[self.selected valueForKey:@"images"][0]];
    self.imageActive = [[UIImageView alloc] initWithImage:image];
    self.imageActive.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    [self.scrollActive addSubview:self.imageActive];
//    self.imageActive.image = [UIImage imageNamed:[self.selected valueForKey:@"images"][0]];

    self.scrollActive.minimumZoomScale = 1.0;
    self.scrollActive.maximumZoomScale = 6.0;
//    self.scrollActive.contentSize = CGSizeMake(self.imageActive.frame.size.width-40.0f, self.imageActive.frame.size.height);
    
    
    
#warning MANUAL OVERRIDE
    colors = @[
               [UIColor purpleColor],
               [UIColor redColor],
               [UIColor yellowColor],
               ];
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

//- (void)loadImageList:(NSArray*)images selectedIndex:(NSInteger)index{
//    __block int originx = 5;
//    __block int originy = 5;
//    __block int buttonh = 100;
//    __block int buttonw = 100;
//    __block int margin  = 5;
//    
//    for (int x = 0; x < [images count]; x++) {
//        
//        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, buttonw, buttonh)];
//        [button setImage: [UIImage imageNamed:images[x]] forState:UIControlStateNormal];
//        [button.imageView setContentMode:UIViewContentModeScaleAspectFill];
//        [button addTarget:self action:@selector(imageItemPressed:) forControlEvents:UIControlEventTouchUpInside];
//        [button setTag:x];
//        
//        
//        if (x == index) {
//            //Add border
//            [[button layer] setBorderWidth:2.0f];
//            [[button layer] setBorderColor: kSWATCH_Pink.CGColor];
//            originx = originx;
//        }else{
//            originx = originx + button.frame.size.width +margin;
//        }
//        button.frame = CGRectMake(originx, originy, buttonw, buttonh);
//        
//        [self.scrollImageList addSubview:button];
//        [self.scrollImageList setContentSize:CGSizeMake(originx+buttonw+margin, 0)];
//    }
//}

- (void)loadColorList:(NSArray*)color selectedIndex:(NSInteger)index{
    __block int buttonh = 35, buttonw = 35, margin = 5;
    
    [self.scrollColorList setContentSize:CGSizeMake(0, [color count]*(buttonh+(margin)))];
    __block int originx = (self.scrollColorList.frame.size.width/2) - (buttonw/2);
    __block int originy = self.scrollColorList.contentSize.height - (buttonh + margin);
    
    for (int x = 0; x < [color count]; x++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, buttonw, buttonh)];
        [button setBackgroundColor:(UIColor *)[colors objectAtIndex:x]];
        [button addTarget:self action:@selector(colorItemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [[button layer] setCornerRadius:button.bounds.size.width/2.0];
        [button setTag:x];
        [[button layer] setBorderColor: [UIColor whiteColor].CGColor];
        
        [[button layer] setBorderWidth: (x == index) ? 5.0f : 3.0f];
        originy = (x == index) ? originy : originy - (button.frame.size.height +margin);

        button.frame = CGRectMake(originx, originy, buttonw, buttonh);
        
        [self.scrollColorList addSubview:button];
    }
    CGPoint bottomOffset = CGPointMake(0, self.scrollColorList.contentSize.height - self.scrollColorList.bounds.size.height);
    [self.scrollColorList setContentOffset:bottomOffset animated:YES];
}

//- (void)imageItemPressed:(UIButton*)sender{
//    [self.scrollActive setZoomScale:1.0 animated:YES];
//    self.imageActive.image = [UIImage imageNamed:[self.selected valueForKey:@"images"][sender.tag]];
//    
//    //Remove Border on all buttons
//    NSArray *images = [self.scrollImageList subviews];
//    for (id subviews in images) {
//        if ([subviews isKindOfClass:[UIButton class]]) {
//            [[(UIButton*)subviews layer] setBorderWidth:0.0f];
//            [[(UIButton*)subviews layer] setBorderColor:[UIColor clearColor].CGColor];
//        }
//    }
//    
//    [self loadColorList:colors selectedIndex:0];
//    
//    //Add border
//    [[sender layer] setBorderWidth:2.0f];
//    [[sender layer] setBorderColor:kSWATCH_Pink.CGColor];
//}

- (void)colorItemPressed:(UIButton*)sender{
    NSArray *images = [self.scrollColorList subviews];
    for (id subviews in images) {
        if ([subviews isKindOfClass:[UIButton class]])
            [[(UIButton*)subviews layer] setBorderWidth:3.0f];
    }
    [[sender layer] setBorderWidth:5.0f];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CellCollectionID";
    
    TableCellCollection *cell = (TableCellCollection*)[tableView dequeueReusableCellWithIdentifier:identifier];
   
    
    if (cell == nil) {
        cell = [[TableCellCollection alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        
    }
   
    cell.arrayList = [NSArray arrayWithArray:self.imageList];
    cell.delegate = self;
    
    [cell.collectionViewMain reloadData];
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - TableCellCollection Delegate Method
- (void)collectionCellDidSelectItem:(NSInteger)row {
    
    [self.scrollActive setZoomScale:1.0 animated:YES];
    self.imageActive.image = [UIImage imageNamed:[self.imageList objectAtIndex:row]];
    [self loadColorList:colors selectedIndex:0];
}


@end
