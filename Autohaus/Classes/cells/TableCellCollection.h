//
//  TableCellCollection.h
//  GingerDolls
//
//  Created by IOS Developer on 3/4/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableCellCollectionDelegate <NSObject>

- (void) collectionCellDidSelectItem:(NSInteger)row;

@end

@interface TableCellCollection : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) id<TableCellCollectionDelegate> delegate;
@property (strong, nonatomic) UICollectionView *collectionViewMain;
@property (strong, nonatomic) NSArray *arrayList;
@end
