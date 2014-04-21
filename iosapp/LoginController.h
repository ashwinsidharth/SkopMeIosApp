//
//  LoginController.h
//  iosapp
//
//  Created by ashwin sidharthan on 21/04/14.
//  Copyright (c) 2014 SkopMe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UILabel *message;

- (IBAction)loginButton_Click:(id)sender;
@end
