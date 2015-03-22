//
//  TableCellCollection.m
//  GingerDolls
//
//  Created by IOS Developer on 3/4/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "TableCellCollection.h"
#import "CollectionCellImage.h"
#import "Constants.h"

@implementation TableCellCollection
@synthesize delegate;
@synthesize collectionViewMain;
@synthesize arrayList;

- (void)awakeFromNib {
    // Initialization code
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout setScrollDirection:(UICollectionViewScrollDirection)UICollectionViewScrollDirectionHorizontal];
    [collectionViewFlowLayout setMinimumLineSpacing:5.0f];
    self.collectionViewMain = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, 100.0f) collectionViewLayout:collectionViewFlowLayout];
    self.collectionViewMain.backgroundColor = [UIColor clearColor];
    
    self.collectionViewMain.delegate = self;
    self.collectionViewMain.dataSource = self;
    [self.contentView addSubview:self.collectionViewMain];
    [self.collectionViewMain registerClass:[CollectionCellImage class] forCellWithReuseIdentifier:@"CellImageID"];
    [self.collectionViewMain setShowsVerticalScrollIndicator:NO];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollection Data Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.arrayList count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"CellImageID";
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    
    UIImage *image = [UIImage imageNamed:[self.arrayList objectAtIndex:row]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [cell.contentView addSubview:imageView];

    cell.contentView.clipsToBounds = YES;
    
    [[cell layer] setBorderWidth:0.0f];
    [[cell layer] setBorderColor:[UIColor clearColor].CGColor];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    
    
    for (NSUInteger row = 0; row <= [self.arrayList count]; row++) {
        if (row == indexPath.row) {
            //Add border
            [[[collectionView cellForItemAtIndexPath:indexPath] layer] setBorderWidth:2.0f];
            [[[collectionView cellForItemAtIndexPath:indexPath] layer] setBorderColor: kSWATCH_Pink.CGColor];
        }
        else {
            NSIndexPath *index = [NSIndexPath indexPathForRow:row inSection:0];
            [[[collectionView cellForItemAtIndexPath:index] layer] setBorderWidth:0.0f];
            [[[collectionView cellForItemAtIndexPath:index] layer] setBorderColor:[UIColor clearColor].CGColor];
        }
    }
    
    [self.delegate collectionCellDidSelectItem:indexPath.row];
    
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100.0f, 100.0f);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 5, 0, 0); // top, left, bottom, right
}

@end
