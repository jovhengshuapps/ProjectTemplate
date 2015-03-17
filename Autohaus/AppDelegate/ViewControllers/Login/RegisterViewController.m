//
//  RegisterViewController.m
//  Autohaus
//
//  Created by IOS Developer on 3/12/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "RegisterViewController.h"
#import "Constants.h"

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
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kSWATCH_NavItemText,NSForegroundColorAttributeName,kFONT_HelveticaNeueLight(16),NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
    self.viewAccountDetails.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"textfield_sign_up_iPhone"]];
    
    
    self.textFieldFullName.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldFullName.textColor = kSWATCH_Gray102;
    self.textFieldEmailAddress.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldEmailAddress.textColor = kSWATCH_Gray102;
    self.textFieldPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldPassword.textColor = kSWATCH_Gray102;
    self.textFieldConfirmPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldConfirmPassword.textColor = kSWATCH_Gray102;
    self.textFieldCountry.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldCountry.textColor = kSWATCH_Gray102;
    self.textFieldPhoneNumber.font = kFONT_HelveticaNeueThinItalic(16.0f);
    self.textFieldPhoneNumber.textColor = kSWATCH_Gray102;
    self.textFieldAreaCode.font = kFONT_HelveticaNeue(16.0f);
    self.textFieldAreaCode.textColor = kSWATCH_Gray30;
    
    self.btnSignUp.layer.cornerRadius = 2.0f;
    self.btnSignUp.backgroundColor = kSWATCH_BlueButton;
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
                self.textFieldFullName.textColor = kSWATCH_Gray102;
                break;
            case 2:
                self.textFieldEmailAddress.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldEmailAddress.textColor = kSWATCH_Gray102;
                break;
            case 3:
                self.textFieldPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldPassword.textColor = kSWATCH_Gray102;
                break;
            case 4:
                self.textFieldConfirmPassword.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldConfirmPassword.textColor = kSWATCH_Gray102;
                break;
            case 5:
                self.textFieldCountry.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldCountry.textColor = kSWATCH_Gray102;
                break;
            case 6:
                self.textFieldPhoneNumber.font = kFONT_HelveticaNeueThinItalic(16.0f);
                self.textFieldPhoneNumber.textColor = kSWATCH_Gray102;
                break;
            default:
                break;
        }
        
        
        
    }
    else {
        
        switch (textField.tag) {
            case 1:
                self.textFieldFullName.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldFullName.textColor = kSWATCH_Gray30;
                break;
            case 2:
                self.textFieldEmailAddress.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldEmailAddress.textColor = kSWATCH_Gray30;
                break;
            case 3:
                self.textFieldPassword.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldPassword.textColor = kSWATCH_Gray30;
                break;
            case 4:
                self.textFieldConfirmPassword.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldConfirmPassword.textColor = kSWATCH_Gray30;
                break;
            case 5:
                self.textFieldCountry.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldCountry.textColor = kSWATCH_Gray30;
                break;
            case 6:
                self.textFieldPhoneNumber.font = kFONT_HelveticaNeue(16.0f);
                self.textFieldPhoneNumber.textColor = kSWATCH_Gray30;
                break;
            default:
                break;
        }
        
    }
    
    
    return YES;
}

#pragma mark - Custom Methods
- (IBAction)signUpPressed:(id)sender {
}

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
