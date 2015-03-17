//
//  HomeRootViewController.h
//  GingerDolls
//
//  Created by Angelo Lesano on 8/8/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CollectionHeaderLabel.h"
#import "CollectionCellImage.h"

@interface HomeRootViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionHome;
@property (strong, nonatomic) NSArray *arrayOfCollection;
@end
