//
//  Constants.h
//  Autohaus
//

#ifndef Autohaus_Constants_h
#define Autohaus_Constants_h

//APP Constants
#define kAppName                @"Autohaus"
#define kAppEmail               @[@"enquiry@gingerdoll.sg"]
#define kAppTelNumber           @"tel://+65 9450 9516"
#define kAppAddress_Title       kAppName
#define kAppAddress_Subtitle    @"1 Derp Bldg. Herp Derp Road, Derpington City, Le Derp 259182"
#define kAppLocation_lat        1.339001
#define kAppLocation_long       103.778958

#define kAppLogo_Nav            [UIImage imageNamed:@"navbar_iPhone"]

//----TABS
#define kTabHome                1
#define kTabAbout               1
#define kTabShop                1
#define kTabCart                1
#define kTabTestimonial         1
#define kTabMore                1


//----SHORTCUTS
#define kAppScreen              [[UIScreen mainScreen]bounds]
#define kNotifCenter            [NSNotificationCenter defaultCenter]
#define kUSER_DEFAULTS          [NSUserDefaults standardUserDefaults]
#define kSCREEN_iPHONE5         ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
#define kAppSystemVersion       [[[UIDevice currentDevice] systemVersion] floatValue]
#define kStoryboard(v)          [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:(v)]

//----EXTENDED SHORTCUTS
#define kToPrice(v)             [NSString stringWithFormat:@"$ %.2f", [(v) floatValue]]

//----COLOR SHORTCUTS
#define COLOR_GRAY(v)           [UIColor colorWithRed:v/255.0f    green:v/255.0f    blue:v/255.0f alpha:1.0]
#define COLOR_RGB(r,g,b)        [UIColor colorWithRed:r/255.0f    green:g/255.0f    blue:b/255.0f alpha:1.0]



//----FONTS
#define kFONT_CentGothic(v)     [UIFont fontWithName:@"CenturyGothic" size:v]
#define kFONT_CentGothicBold(v) [UIFont fontWithName:@"CenturyGothic-Bold" size:v]
#define kFONT_HelveticaNeue(v)        [UIFont fontWithName:@"HelveticaNeue" size:v]
#define kFONT_HelveticaNeueLight(v)        [UIFont fontWithName:@"HelveticaNeue-Light" size:v]
#define kFONT_HelveticaNeueBold(v)        [UIFont fontWithName:@"HelveticaNeue-Bold" size:v]
#define kFONT_HelveticaNeueCondensedBold(v)        [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:v]
#define kFONT_HelveticaNeueThinItalic(v)        [UIFont fontWithName:@"HelveticaNeue-ThinItalic" size:v]
#define kFONT_HelveticaNeueMedium(v)        [UIFont fontWithName:@"HelveticaNeue-Medium" size:v]

//----USER TYPE
#define kLoginTypeUser      @"LoginTypeUser"
#define kLoginTypeAdmin     @"LoginTypeAdmin"
#define kloginTypeGeneral   @"LoginTypeGeneral"



//--CONFIGURATION

#define TABVIEW_SHOW_HOME                                   1
#define TABVIEW_SHOW_SHOP                                   1
#define TABVIEW_SHOW_CART                                   1
#define TABVIEW_SHOW_TESTIMONIAL                            1
#define TABVIEW_SHOW_MORE                                   1


#define NAV_TITLE_FONT                                      kFONT_HelveticaNeue(16.0f)
#define NAV_TITLE_COLOR                                     COLOR_RGB(35.0f,175.0f,229.0f)
#define NAV_ITEM_FONT                                       kFONT_HelveticaNeueLight(16.0f)
#define NAV_ITEM_COLOR                                      COLOR_RGB(154.0f,167.0f,196.0f)
#define NAV_BAR_COLOR                                       COLOR_RGB(45.0f,45.0f,48.0f)
#define TAB_BAR_COLOR                                       COLOR_RGB(45.0f,45.0f,48.0f)
#define TAB_BAR_ITEM_NORMAL                                 COLOR_GRAY(224.0f)
#define TAB_BAR_ITEM_SELECTED                               COLOR_RGB(35.0f,175.0f,229.0f)

#define TAB_HOME_LOGO_NORMAL                                [UIImage imageNamed:@"tab_home_iPhone"]
#define TAB_HOME_LOGO_SELECTED                              [UIImage imageNamed:@"tab_home_selected_iPhone"]
#define TAB_SHOP_LOGO_NORMAL                                [UIImage imageNamed:@"tab_shop_iPhone"]
#define TAB_SHOP_LOGO_SELECTED                              [UIImage imageNamed:@"tab_shop_selected_iPhone"]
#define TAB_CART_LOGO_NORMAL                                [UIImage imageNamed:@"tab_cart_iPhone"]
#define TAB_CART_LOGO_SELECTED                              [UIImage imageNamed:@"tab_cart_selected_iPhone"]
#define TAB_TESTIMONIALS_LOGO_NORMAL                        [UIImage imageNamed:@"tab_testimonials_iPhone"]
#define TAB_TESTIMONIALS_LOGO_SELECTED                      [UIImage imageNamed:@"tab_testimonials_selected_iPhone"]
#define TAB_MORE_LOGO_NORMAL                                [UIImage imageNamed:@"tab_more_iPhone"]
#define TAB_MORE_LOGO_SELECTED                              [UIImage imageNamed:@"tab_more_selected_iPhone"]

#define LOGIN_BUTTON_FONT                                   kFONT_HelveticaNeueCondensedBold(20.0f)
#define LOGIN_BUTTON_TEXTCOLOR                              [UIColor whiteColor]
#define LOGIN_BUTTON_COLOR                                  COLOR_RGB(42.0f,65.0f,127.0f)
#define LOGIN_BUTTON_CORNER                                 6.0f
#define LOGIN_MAIN_LOGO                                     [UIImage imageNamed:@"login_logo_iPhone"]
#define LOGIN_TERMS                                         [UIImage imageNamed:@"button_terms_iPhone"]

#define HOME_ABOUT_IMAGE                                    [UIImage imageNamed:@"image_about_home_iPhone"]
#define HOME_ABOUT_TEXT                                     @"Autohaus is an automotive parts and accessories retailer that is dedicated in bringing both value and quality to its customers."
#define HOME_SECTION_TEXTFONT                               kFONT_HelveticaNeueCondensedBold(18.0f)
#define HOME_SECTION_TEXTCOLOR                              [UIColor whiteColor]
#define HOME_SECTION_BARCOLOR                               COLOR_RGB(69.0f,178.0f,118.0f)
#define HOME_CELL_BGCOLOR                                   COLOR_GRAY(230.0f)
#define HOME_CELL_TEXTFONT                                  kFONT_HelveticaNeueMedium(16.0f)
#define HOME_CELL_TEXTCOLOR                                 COLOR_GRAY(63.0f)
#define HOME_CELL_CORNER                                    6.0f

#define SHOP_SECTION_BGCOLOR                                COLOR_GRAY(230.0f)
#define SHOP_SECTION_CORNER                                 6.0f
#define SHOP_SECTION_CELL_FONT                              kFONT_HelveticaNeueMedium(18.0f)
#define SHOP_SECTION_CELL_COLOR                             COLOR_GRAY(63.0f)
#define SHOP_SEPARATOR_COLOR                                COLOR_GRAY(230.0f)
#define SHOP_SEPARATOR_SIZE                                 4.0f


#define TESTIMONIAL_BOX_CORNER                              6.0f
#define TESTIMONIAL_BOX_COLOR                               COLOR_GRAY(230.0f)
#define TESTIMONIAL_MSG_FONT                                kFONT_HelveticaNeueMedium(14.0f)
#define TESTIMONIAL_MSG_COLOR                               COLOR_GRAY(63.0f)
#define TESTIMONIAL_NAME_FONT                               kFONT_HelveticaNeueCondensedBold(16.0f)
#define TESTIMONIAL_NAME_COLOR                              COLOR_RGB(69.0f,178.0f,118.0f)
#define TESTIMONIAL_TITLE_FONT                              kFONT_HelveticaNeueLight(16.0f)
#define TESTIMONIAL_TITLE_COLOR                             COLOR_GRAY(63.0f)

#define MORE_SECTION_FONT                                   kFONT_HelveticaNeueCondensedBold(18.0f)
#define MORE_SECTION_COLOR                                  [UIColor whiteColor]
#define MORE_SECTION_BAR_COLOR                              COLOR_RGB(69.0f,178.0f,118.0f)
#define MORE_CELL_FONT                                      kFONT_HelveticaNeueMedium(16.0f)
#define MORE_CELL_BOX_COLOR                                 COLOR_GRAY(230.0f)
#define MORE_CELL_COLOR                                     COLOR_GRAY(63.0f)
#define MORE_CELL_CORNER                                    6.0f
#endif
