//
//  Utilities.m
//  Template
//
//  Created by Angelo Lesano on 3/7/14.
//  Copyright (c) 2014 Angelo Lesano. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities
- (BOOL)NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (NSData*)imageToData:(UIImage *)image{
    NSData *imageData = UIImagePNGRepresentation(image);
    return imageData;
}

- (UIImage*)dataToImage:(NSData *)data{
    UIImage *image = [[UIImage alloc]initWithData:data];
    return image;
}

-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews
{
    if ([view isKindOfClass:[UILabel class]])
    {
        UILabel *lbl = (UILabel *)view;
        [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
    }
    
    if (isSubViews)
    {
        for (UIView *sview in view.subviews)
        {
            [self setFontFamily:fontFamily forView:sview andSubViews:YES];
        }
    }
}

//APP SPECIFIC METHODS
@end
