//
//  HomeRootViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/8/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "HomeRootViewController.h"
#import "CollectionCellText.h"

@interface HomeRootViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewAbout;
@property (weak, nonatomic) IBOutlet UILabel *labelAbout;
- (IBAction)viewAbout:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewForAbout;
@end

@implementation HomeRootViewController
@synthesize collectionHome;
@synthesize arrayOfCollection;

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
    
    [self getData];
    
    [self setupAbout];
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
    
}


- (void) setupAbout {
    self.imageViewAbout.image = HOME_ABOUT_IMAGE;
    NSString *aboutText = HOME_ABOUT_TEXT;
    NSRange range = [aboutText rangeOfString:kAppName];
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:aboutText];
    [string addAttribute:NSFontAttributeName value:kFONT_HelveticaNeueBold(18.0f) range:range];
    [string addAttribute:NSFontAttributeName value:kFONT_HelveticaNeue(18.0f) range:NSMakeRange(range.length, aboutText.length - range.length)];
    
    self.labelAbout.attributedText = string;
}

- (void) getData {
    
    self.arrayOfCollection = nil;
    [[WebserviceCall new] getProductsCompletion:^(id response) {
//            NSLog(@"response:%@",response);
        NSMutableArray *list = [[NSMutableArray alloc] init];
        NSMutableArray *categoryChecker = [[NSMutableArray alloc] init];
        
        
        for (NSDictionary *products in response[@"response"][@"products"]) {
            if (![categoryChecker containsObject:products[@"category"]]) {
                [categoryChecker addObject:products[@"category"]];
                NSDictionary *item = [[NSDictionary alloc] initWithObjectsAndKeys:products[@"category"],@"text",@"",@"image", nil];
                [list addObject:item];
            }
            
        }
        
        NSDictionary *section = [NSDictionary dictionaryWithObjectsAndKeys:@"Product Categories", @"title", list, @"list", nil];
        
        self.arrayOfCollection = [NSArray arrayWithObjects:section, nil];
        
        
        [self.collectionHome reloadData];
    }];
    
    
}

//- (BOOL) doesArray:(NSArray*) array containsString:(NSString*)string {
//    BOOL result = NO;
//    if (array) {
//        for (NSString *value in array) {
//            if ([value isEqualToString:string]) {
//                result = YES;
//                break;
//            }
//        }
//    }
//    return result;
//}

#pragma mark - UICollection Data Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.arrayOfCollection count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self.arrayOfCollection objectAtIndex:section] objectForKey:@"list"]count];
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 0, 10); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionHeaderLabel *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"%@", [[self.arrayOfCollection objectAtIndex:indexPath.section] objectForKey:@"title"]];
        headerView.labelHeader.text = title;
        headerView.labelHeader.font = HOME_SECTION_TEXTFONT;
        headerView.labelHeader.textColor = HOME_SECTION_TEXTCOLOR;
        headerView.backgroundColor = HOME_SECTION_BARCOLOR;
        
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        reusableview = footerview;
    }
    
    return reusableview;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"Cell";
    
    CollectionCellText *cell = (CollectionCellText *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSDictionary *item = [[[self.arrayOfCollection objectAtIndex:indexPath.section] objectForKey:@"list"] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [item objectForKey:@"text"];
    cell.textLabel.font = HOME_CELL_TEXTFONT;
    cell.textLabel.textColor = HOME_CELL_TEXTCOLOR;
    
    cell.backgroundColor = HOME_CELL_BGCOLOR;
    cell.layer.cornerRadius = HOME_CELL_CORNER;
    
    return cell;
}

- (IBAction)viewAbout:(id)sender {
    
    UIViewController *vc = kStoryboard(@"aboutVC");
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
