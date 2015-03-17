//
//  Cart.h
//  GingerDolls
//
//  Created by Angelo Lesano on 8/14/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cart : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * qty;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSNumber * price;

@end
