//
//  RegisterViewController.m
//  Autohaus
//
//  Created by IOS Developer on 3/12/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "RegisterViewController.h"
#import "BaseConfig.h"
#import "WebserviceCall.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewAccountDetails;
- (IBAction)cancelPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFullName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCountry;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAreaCode;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;
- (IBAction)signUpPressed:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Create an Account";
    self.navigationItem.leftBarButtonItem.title = @"Cancel";
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:NAV_ITEM_COLOR,NSForegroundColorAttributeName,kFONT_HelveticaNeueLight(16),NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
    self.viewAccountDetails.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"textfield_sign_up_iPhone"]];
    
    
    self.textFieldFullName.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldFullName.textColor = COLOR_GRAY(102.0f);
    self.textFieldEmailAddress.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldEmailAddress.textColor = COLOR_GRAY(102.0f);
    self.textFieldPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldPassword.textColor = COLOR_GRAY(102.0f);
    self.textFieldConfirmPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldConfirmPassword.textColor = COLOR_GRAY(102.0f);
    self.textFieldCountry.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldCountry.textColor = COLOR_GRAY(102.0f);
    self.textFieldPhoneNumber.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldPhoneNumber.textColor = COLOR_GRAY(102.0f);
    self.textFieldAreaCode.font = kFONT_HelveticaNeue(16.0f);
    self.textFieldAreaCode.textColor = COLOR_GRAY(30.0f);
    
    self.btnSignUp.layer.cornerRadius = 2.0f;
    self.btnSignUp.backgroundColor = LOGIN_BUTTON_COLOR;
    [self.btnSignUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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


#pragma mark - UITextField Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    switch (textField.tag) {
        case 1:
            [self.textFieldEmailAddress becomeFirstResponder];
            break;
        case 2:
            [self.textFieldPassword becomeFirstResponder];
            break;
        case 3:
            [self.textFieldConfirmPassword becomeFirstResponder];
            break;
        case 4:
            [self.textFieldCountry becomeFirstResponder];
            break;
        case 5:
            [self.textFieldPhoneNumber becomeFirstResponder];
            break;
        default:
            [textField resignFirstResponder];
            break;
    }
    
    
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (range.location == 0 && [string length] == 0) {
        
        switch (textField.tag) {
            case 1:
                self.textFieldFullName.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldFullName.textColor = COLOR_GRAY(102.0f);
                break;
            case 2:
                self.textFieldEmailAddress.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldEmailAddress.textColor = COLOR_GRAY(102.0f);
                break;
            case 3:
                self.textFieldPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldPassword.textColor = COLOR_GRAY(102.0f);
                break;
            case 4:
                self.textFieldConfirmPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldConfirmPassword.textColor = COLOR_GRAY(102.0f);
                break;
            case 5:
                self.textFieldCountry.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldCountry.textColor = COLOR_GRAY(102.0f);
                break;
            case 6:
                self.textFieldPhoneNumber.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldPhoneNumber.textColor = COLOR_GRAY(102.0f);
                break;
            default:
                break;
        }
        
        
        
    }
    else {
        
        switch (textField.tag) {
            case 1:
                self.textFieldFullName.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldFullName.textColor = COLOR_GRAY(30.0f);
                break;
            case 2:
                self.textFieldEmailAddress.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldEmailAddress.textColor = COLOR_GRAY(30.0f);
                break;
            case 3:
                self.textFieldPassword.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldPassword.textColor = COLOR_GRAY(30.0f);
                break;
            case 4:
                self.textFieldConfirmPassword.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldConfirmPassword.textColor = COLOR_GRAY(30.0f);
                break;
            case 5:
                self.textFieldCountry.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldCountry.textColor = COLOR_GRAY(30.0f);
                break;
            case 6:
                self.textFieldPhoneNumber.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldPhoneNumber.textColor = COLOR_GRAY(30.0f);
                break;
            default:
                break;
        }
        
    }
    
    
    return YES;
}

#pragma mark - Custom Methods
- (IBAction)signUpPressed:(id)sender {
    
    [[WebserviceCall new] registerWithParameters:@{@"user_email":self.textFieldEmailAddress.text,@"user_pass":self.textFieldPassword.text} completion:^(id response) {
        
        APIResponse responseAPI = (APIResponse)[[[response objectForKey:@"response"] objectForKey:@"status"] integerValue];
        
        if (responseAPI == APIResponseNotFound) {
            NSLog(@"notfound");
        }
        else if (responseAPI == APIResponseWrongCredentials) {
            NSLog(@"wrong login");
        }
        else if (responseAPI == APIResponseEmailFailed) {
            NSLog(@"email not sent");
        }
        else if (responseAPI == APIResponseSuccessful) {
            NSLog(@"success");
        }
    }];
}

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
