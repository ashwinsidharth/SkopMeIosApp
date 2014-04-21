//
//  LoginController.m
//  iosapp
//
//  Created by ashwin sidharthan on 21/04/14.
//  Copyright (c) 2014 SkopMe. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()
{

}

@end

@implementation LoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginButton_Click:(id)sender {
    
    NSString *restCallString = @"http://192.168.0.12/Skop/api/Account/Login";
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    
    [NSURLConnection sendAsynchronousRequest:restRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary* headers = [(NSHTTPURLResponse *)response allHeaderFields];
             
             if ([headers objectForKey:@"Authorization-Token"]) {
                 // contains object
                 //self.firstNameText.text = [headers objectForKey:@"Authorization-Token"];
             }
             
             
             NSDictionary *dataJson = [NSJSONSerialization JSONObjectWithData:data                                                                      options:0
                 error:NULL];
             
             self.message.text = @"successful login!!";
             //[[dataJson objectForKey:@"id"] stringValue];
         }
     }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
