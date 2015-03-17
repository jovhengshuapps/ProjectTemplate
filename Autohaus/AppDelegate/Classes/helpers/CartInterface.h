//
//  CartInterface.h
//  Template
//
//  Created by Angelo Lesano on 3/13/14.
//  Copyright (c) 2014 Angelo Lesano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CartInterface : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)postWithParameters:(NSDictionary*)param completion:(void(^)(BOOL finished))completed;
- (void)deleteFrom:(NSString *)url tableViewIndex:(int)index;
- (NSArray*)getFrom:(NSString*)url sortBy:(NSString*)sortBy;
@end

#define kPlaceholderImage   [UIImage imageNamed:[NSString stringWithFormat:@"%@",@"appicon_iPhone"]]
#define kEntityName         @"Cart"
#define key_quantity        @"qty"
