//
//  BlurringView.m
//  Pek Sin Choon
//
//  Created by Angelo Lesano on 5/16/14.
//  Copyright (c) 2014 JuzMedia Labs. All rights reserved.
//

#import "BlurringView.h"

@implementation UIView(BlurringView)

-(UIImage *)convertViewToImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
