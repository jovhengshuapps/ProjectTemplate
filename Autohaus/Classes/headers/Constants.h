//
//  Constants.h
//  GingerDolls
//
//  Created by Angelo Lesano on 8/8/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#ifndef GingerDolls_Constants_h
#define GingerDolls_Constants_h

//APP Constants
#define kAppName                @"Ginger Dolls"
#define kAppEmail               @[@"enquiry@gingerdoll.sg"]
#define kAppTelNumber           @"tel://+65 9450 9516"
#define kAppAddress_Title       kAppName
#define kAppAddress_Subtitle    @"1 Derp Bldg. Herp Derp Road, Derpington City, Le Derp 259182"
#define kAppLocation_lat        1.339001
#define kAppLocation_long       103.778958

#define kAppLogo_Nav            [UIImage imageNamed:@"navbar_logo_iPhone"]

//----SHORTCUTS
#define kAppScreen              [[UIScreen mainScreen]bounds]
#define kNotifCenter            [NSNotificationCenter defaultCenter]
#define kUSER_DEFAULTS          [NSUserDefaults standardUserDefaults]
#define kSCREEN_iPHONE5         ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
#define kAppSystemVersion       [[[UIDevice currentDevice] systemVersion] floatValue]
#define kStoryboard(v)          [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:(v)]
//#define kToString(A,B)             [NSString stringWithFormat:(A), (B)]

//----EXTENDED SHORTCUTS
#define kToPrice(v)             [NSString stringWithFormat:@"$ %.2f", [(v) floatValue]]

//----SWATCHES
#define kSWATCH_NavBG           [UIColor colorWithRed:106/255.0f    green:78/255.0f     blue:90/255.0f  alpha:1.0]
#define kSWATCH_TabBG           [UIColor colorWithRed:226/255.0f    green:195/255.0f    blue:211/255.0f alpha:1.0]
#define kSWATCH_Pink            [UIColor colorWithRed:183/255.0f    green:47/255.0f     blue:107/255.0f alpha:1.0]
#define kSWATCH_Brown           [UIColor colorWithRed:103/255.0f    green:78/255.0f     blue:86/255.0f  alpha:1.0]

#define kSWATCH_ProductName     [UIColor colorWithRed:188/255.0f    green:49/255.0f     blue:106/255.0f alpha:0.90]
#define kSWATCH_Price           [UIColor colorWithRed:193/255.0f    green:107/255.0f    blue:146/255.0f alpha:1.0]

#define kSWATCH_CellSection     [UIColor colorWithRed:234/255.0f    green:234/255.0f    blue:234/255.0f alpha:1.0]
#define kSWATCH_Title           [UIColor colorWithRed:188/255.0f    green:49/255.0f     blue:106/255.0f alpha:1.0]
#define kSWATCH_Content         [UIColor colorWithRed:226/255.0f    green:195/255.0f    blue:211/255.0f alpha:1.0]





//----FONTS
#define kFONT_CentGothic(v)     [UIFont fontWithName:@"CenturyGothic" size:v]
#define kFONT_CentGothicBold(v) [UIFont fontWithName:@"CenturyGothic-Bold" size:v]
#define kFONT_Default(v)        [UIFont fontWithName:@"HelveticaNeue" size:v]

//----USER TYPE
#define kLoginTypeUser      @"LoginTypeUser"
#define kLoginTypeAdmin     @"LoginTypeAdmin"
#define kloginTypeGeneral   @"LoginTypeGeneral"

#endif
