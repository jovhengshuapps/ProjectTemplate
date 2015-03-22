//
//  HomeRootViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/8/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "HomeRootViewController.h"
#import "Constants.h"
#import "CollectionHeaderLabel.h"
#import "CollectionCellImage.h"

@interface HomeRootViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionHome;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollBanner;
@property (strong, nonatomic) NSArray *arrayOfCollection;
@end

@implementation HomeRootViewController

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
    [self loadBannerItems];
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
- (void)loadBannerItems{
    NSArray *tempItems = @[
                            [UIImage imageNamed:@"sliding_banner_1_iPhone"],
                            [UIImage imageNamed:@"sliding_banner_2_iPhone"],
                            [UIImage imageNamed:@"sliding_banner_3_iPhone"],
                            ];
    
    int originx = 0;
    int originy = 0;
    int bannerw = self.view.bounds.size.width;
    int bannerh = 152;
    
    for (int x = 0; x < [tempItems count]; x++) {
        UIImageView *banner= [[UIImageView alloc]initWithImage:[tempItems objectAtIndex:x]];
        [banner setContentMode:UIViewContentModeScaleToFill];
        [banner setFrame:CGRectMake(originx, originy, bannerw, bannerh)];
        
        if (x == 0) {
            originx = 0;
        }else{
            originx = originx + banner.frame.size.width;
        }
        [banner setFrame:CGRectMake(originx, originy, bannerw, bannerh)];
        [self.scrollBanner addSubview:banner];
        [self.scrollBanner setContentSize:CGSizeMake(originx+bannerw, 0)];
    }
}



#pragma mark - UICollection Data Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 5, 0, 5); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionHeaderLabel *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Featured #%li", indexPath.section + 1];
        headerView.labelHeader.text = title;
        headerView.labelHeader.font = kFONT_CentGothicBold(18);
        
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
    
    CollectionCellImage *cell = (CollectionCellImage *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.productImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image_featured_%li_iPhone", indexPath.row + 1]];
    
    return cell;
}

@end
