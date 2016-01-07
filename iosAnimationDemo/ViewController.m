//
//  ViewController.m
//  iosAnimationDemo
//
//  Created by inowei on 12/30/15.
//  Copyright © 2015 inowei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIActivityIndicatorView *spinner;
    CGPoint position;
    UIImageView *errorMessage;

    
}
@property (weak, nonatomic) IBOutlet UIImageView *bubble1;
@property (weak, nonatomic) IBOutlet UIImageView *bubble2;
@property (weak, nonatomic) IBOutlet UIImageView *bubble3;
@property (weak, nonatomic) IBOutlet UIImageView *bubble4;
@property (weak, nonatomic) IBOutlet UIImageView *Logo;
@property (weak, nonatomic) IBOutlet UIImageView *dotImageView;
@property (weak, nonatomic) IBOutlet UITextField *Username;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UIButton *login;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.bubble1.transform=CGAffineTransformMakeScale(0, 0);
    self.bubble2.transform=CGAffineTransformMakeScale(0, 0);
    self.bubble3.transform=CGAffineTransformMakeScale(0, 0);
    self.bubble4.transform=CGAffineTransformMakeScale(0, 0);
    position=self.login.center;
    [self.Logo setCenter:CGPointMake(self.Logo.center.x-self.view.bounds.size.width, self.Logo.center.y)];
    
    [self.dotImageView setCenter:CGPointMake(self.dotImageView.center.x-self.view.bounds.size.width, self.dotImageView.center.y)];
    
    //adjust place of placehoder.
    [self.Username setCenter:CGPointMake(self.Username.center.x-self.view.bounds.size.width, self.Username.center.y)];
    [self.Password setCenter:CGPointMake(self.Password.center.x-self.view.bounds.size.width, self.Password.center.y)];
    [self.login setCenter:CGPointMake(self.login.center.x-self.view.bounds.size.width, self.login.center.y)];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 38, self.Username.frame.size.height)];
    
    self.Username.leftView=paddingView;
    self.Username.leftViewMode=UITextFieldViewModeAlways;
    UIImageView *user=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fa-user"]];
    [user setFrame:CGRectMake(10, 9, user.frame.size.width, user.frame.size.height)];
    [self.Username addSubview:user];
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 38, self.Password.frame.size.height)];
    
    self.Password.leftView=paddingView1;
    self.Password.leftViewMode=UITextFieldViewModeAlways;
    
    UIImageView *key=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fa-key"]];
    [key setFrame:CGRectMake(10, 9, key.frame.size.width, key.frame.size.height)];
    [self.Password addSubview:key];
    spinner=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    errorMessage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"errormessage"]];
    [self.view addSubview:errorMessage];
    errorMessage.hidden=1;
    
    [errorMessage setCenter:position];
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:nil animations:^{
        self.bubble1.transform=CGAffineTransformMakeScale(1, 1);
        self.bubble2.transform=CGAffineTransformMakeScale(1, 1);
        } completion:nil];
    [UIView animateWithDuration:0.8 delay:0.4 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:nil animations:^{

    
        self.bubble3.transform=CGAffineTransformMakeScale(1, 1);
        self.bubble4.transform=CGAffineTransformMakeScale(1, 1);} completion:nil];
    [UIView animateWithDuration:0.8 delay:0.4 options:nil animations:^{
        
        [self.Logo setCenter:CGPointMake(self.Logo.center.x+self.view.bounds.size.width, self.Logo.center.y)];

        
        } completion:nil];
    [UIView animateWithDuration:4.9 delay:0.8 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:nil animations:^{
        
        
        [self.dotImageView setCenter:CGPointMake(self.dotImageView.center.x+self.view.bounds.size.width, self.dotImageView.center.y)];
} completion:nil];
    [UIView animateWithDuration:0.4 delay:0.4 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        [self.Username setCenter:CGPointMake(self.Username.center.x+self.view.bounds.size.width, self.Username.center.y)];
        
    }completion:nil];
    [UIView animateWithDuration:0.4 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        [self.Password setCenter:CGPointMake(self.Password.center.x+self.view.bounds.size.width, self.Password.center.y)];
        
    }completion:nil];
    
    [UIView animateWithDuration:0.4 delay:0.6 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        [self.login setCenter:CGPointMake(self.login.center.x+self.view.bounds.size.width, self.login.center.y)];
        
    }completion:nil];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginClick:(id)sender {
    
    [self.login addSubview:spinner];
    [spinner setFrame:CGRectMake(8, 8, spinner.frame.size.width, spinner.frame.size.height)];
    [spinner startAnimating];
    [self.login setCenter:CGPointMake(self.login.center.x-30, self.login.center.y)];
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:nil animations:^{
        [self.login setCenter:CGPointMake(self.login.center.x+30, self.login.center.y+75
                                          )];
        
        
    } completion:^(BOOL finished){
        [UIView transitionWithView:errorMessage duration:0.4 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionTransitionFlipFromTop animations:^{
            errorMessage.hidden=0;
        }completion:nil];
        
    }];
    
    
    
}

@end
