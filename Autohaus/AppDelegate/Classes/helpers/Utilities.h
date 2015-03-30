//
//  Utilities.h v1.0.1
//  Template
//
//  Created by Angelo Lesano on 3/7/14.
//  Copyright (c) 2014 Angelo Lesano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utilities : NSObject

- (NSData*)imageToData:(UIImage*)image;
- (UIImage*)dataToImage:(NSData*)data;
- (UIImage*)URLToImage:(NSString *)urlPath;
- (BOOL)NSStringIsValidEmail:(NSString *)checkString;
-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews;

@end
