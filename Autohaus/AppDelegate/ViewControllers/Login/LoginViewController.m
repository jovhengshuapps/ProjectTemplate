//
//  LoginViewController.m
//  Autohaus
//
//  Created by IOS Developer on 3/12/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
- (IBAction)skipLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewEmailPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UILabel *lblNotMember;
@property (weak, nonatomic) IBOutlet UIView *viewCreateAccount;
@property (weak, nonatomic) IBOutlet UIButton *btnCreateAccount;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
- (IBAction)forgotPasswordPresed:(id)sender;
- (IBAction)loginPressed:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"Login";
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:NAV_ITEM_COLOR,NSForegroundColorAttributeName,kFONT_HelveticaNeueLight(16),NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    self.viewEmailPassword.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"textfield_login_iPhone"]];
    
    self.textFieldEmail.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldEmail.textColor = COLOR_GRAY(102.0f);
    self.textFieldPassword.textColor = COLOR_GRAY(102.0f);
        
    self.btnLogin.layer.cornerRadius = LOGIN_BUTTON_CORNER;
    self.btnLogin.backgroundColor = LOGIN_BUTTON_COLOR;
    self.btnLogin.titleLabel.font = LOGIN_BUTTON_FONT;
    [self.btnLogin setTitleColor:LOGIN_BUTTON_TEXTCOLOR forState:UIControlStateNormal];
    [self.btnLogin setTintColor:LOGIN_BUTTON_COLOR];
    
    
    self.lblNotMember.font = kFONT_HelveticaNeueLight(16.0f);
    self.lblNotMember.textColor = COLOR_GRAY(80.0f);
    
    self.btnCreateAccount.layer.cornerRadius = LOGIN_BUTTON_CORNER;
    self.btnCreateAccount.backgroundColor = LOGIN_BUTTON_COLOR;
    self.btnCreateAccount.titleLabel.font = LOGIN_BUTTON_FONT;
    [self.btnCreateAccount setTitleColor:LOGIN_BUTTON_TEXTCOLOR forState:UIControlStateNormal];
    [self.btnCreateAccount setTintColor:LOGIN_BUTTON_COLOR];
    
    self.imageViewLogo.image = LOGIN_MAIN_LOGO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Custom Methods

- (IBAction)skipLogin:(id)sender {
    
    UIViewController *vc = (UIViewController*)kStoryboard(@"mainTabView");
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}

- (IBAction)forgotPasswordPresed:(id)sender {
}

- (IBAction)loginPressed:(id)sender {
    
    WebserviceCall *call = [[WebserviceCall alloc] init];
    
    [call initCallWithServiceURL:WS_LOGIN withParameters:@{@"user_login":self.textFieldEmail.text,@"user_pass":self.textFieldPassword.text} withCompletionHandler:^(id responseObject) {
        NSError *error = nil;
        NSLog(@"data:%@",[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error]);
//        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
//        
//        WebserviceCallResponse response = (WebserviceCallResponse)[[[jsonResponse objectForKey:@"response"] objectForKey:@"status"] integerValue];
//        
//        if (response == WebserviceCallResponseNotFound) {
//            NSLog(@"notfound");
//        }
//        else if (response == WebserviceCallResponseWrongCredentials) {
//            NSLog(@"wrong login");
//        }
//        else if (response == WebserviceCallResponseSuccessful) {
//            NSLog(@"success");
//        }
//        
//        NSLog(@"[%li]error:%@\n\nresponse:%@",response,error,jsonResponse);
        
    }];
    
}


#pragma mark - UITextField Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.textFieldEmail])
        [self.textFieldPassword becomeFirstResponder];
    else
        [textField resignFirstResponder];
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (range.location == 0 && [string length] == 0) {
        
        if ([textField isEqual:self.textFieldEmail]) {
            self.textFieldEmail.font = kFONT_HelveticaNeueThinItalic(16.0f);
            self.textFieldEmail.textColor = COLOR_GRAY(102.0f);
        }
        else {
            self.textFieldPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
            self.textFieldPassword.textColor = COLOR_GRAY(102.0f);
        }
        
    }
    else {
        if ([textField isEqual:self.textFieldEmail]) {
            self.textFieldEmail.font = kFONT_HelveticaNeue(16.0f);
            self.textFieldEmail.textColor = COLOR_GRAY(30.0f);
        }
        else {
            self.textFieldPassword.font = kFONT_HelveticaNeue(16.0f);
            self.textFieldPassword.textColor = COLOR_GRAY(30.0f);
        }
    }
    
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if ([textField isEqual:self.textFieldEmail]) {
        self.textFieldEmail.font = kFONT_HelveticaNeueThinItalic(16.0f);
        self.textFieldEmail.textColor = COLOR_GRAY(102.0f);
    }
    else {
        self.textFieldPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
        self.textFieldPassword.textColor = COLOR_GRAY(102.0f);
    }
    return YES;
}


@end
