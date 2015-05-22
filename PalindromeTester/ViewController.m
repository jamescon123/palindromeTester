//
//  ViewController.m
//  PalindromeTester
//
//  Created by James Connerton on 2015-05-21.
//  Copyright (c) 2015 James Connerton. All rights reserved.
//

// Plaindrome

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIColor *blueColor = [UIColor colorWithRed:(48/255.0) green:(139/255.0) blue:(139/255.0) alpha:1];
     UIColor *redColor = [UIColor colorWithRed:(231/255.0) green:(80/255.0) blue:(80/255.0) alpha:1];
    [self.view setBackgroundColor:blueColor];
    
    CGFloat statusBarHeight = CGRectGetMaxY([[UIApplication sharedApplication] statusBarFrame]);
    UILabel *palindromeTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, statusBarHeight+20, self.view.frame.size.width-20, 50)];
    palindromeTitle.text = @"Palindrome Tester";
    palindromeTitle.textColor = [UIColor whiteColor];
    palindromeTitle.textAlignment = NSTextAlignmentCenter;
    palindromeTitle.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:palindromeTitle];
    
    
    self.enterPhraseTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height/4, self.view.frame.size.width-20, 40)];
    self.enterPhraseTextField.delegate = self;
    self.enterPhraseTextField.placeholder = @"Test a phrase";
    self.enterPhraseTextField.textColor = [UIColor blackColor];
    self.enterPhraseTextField.backgroundColor = [UIColor whiteColor];
    self.enterPhraseTextField.returnKeyType = UIReturnKeyGo;
    self.enterPhraseTextField.keyboardType = UIKeyboardTypeAlphabet;
    [self.enterPhraseTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    UIView *spacer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.enterPhraseTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.enterPhraseTextField setLeftView:spacer];
    [self.view addSubview:self.enterPhraseTextField];
    
    self.enterPhraseString = [[NSString alloc] init];
    
    CGFloat maxTextFieldYValue = CGRectGetMaxY(self.enterPhraseTextField.frame);
    self.testPhraseButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-(self.view.frame.size.width/4)/2, maxTextFieldYValue+20, self.view.frame.size.width/4, 40)];
    self.testPhraseButton.backgroundColor =redColor;
    [self.testPhraseButton setTitle:@"Test" forState:UIControlStateNormal];
    [self.testPhraseButton addTarget:self action:@selector(testPhraseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.testPhraseButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self testIfPalidrome];
    self.enterPhraseString = textField.text;
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.enterPhraseTextField resignFirstResponder];
}
-(void)testPhraseButtonAction:(UIButton*)sender {
    [self.enterPhraseTextField resignFirstResponder];
    [self testIfPalidrome];
}
-(void)testIfPalidrome {
    self.enterPhraseString = [self.enterPhraseTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
   self.enterPhraseString = [self.enterPhraseString lowercaseString];
    
    if([self.enterPhraseString length] == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a phrase" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alertView show];
        
    } else {
        
        int i;
        for (i=0; i<[self.enterPhraseString length]; i++) {

           if([self.enterPhraseString characterAtIndex:i] == [self.enterPhraseString characterAtIndex:[self.enterPhraseString length]-i-1]) {
               
               if(i == [self.enterPhraseString length]-1) {
                    UIColor *greenColor = [UIColor colorWithRed:(64/255.0) green:(185/255.0) blue:(64/255.0) alpha:1];
                   UILabel *isAPalindromeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width-20, 50)];
                   isAPalindromeLabel.backgroundColor = greenColor;
                   isAPalindromeLabel.text = @"Yes! This is a palindrome";
                   isAPalindromeLabel.textAlignment = NSTextAlignmentCenter;
                   
                   [self.view addSubview:isAPalindromeLabel];
                   
                   CGFloat maxButtonY = CGRectGetMaxY(self.testPhraseButton.frame);
                  
                   [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                       isAPalindromeLabel.frame = CGRectMake(10, maxButtonY+20, self.view.frame.size.width-20, 50);
                   } completion:^(BOOL finished) {
                       [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveLinear animations:^{
                           isAPalindromeLabel.alpha = 0;
                       } completion:^(BOOL finished) {
                           [isAPalindromeLabel removeFromSuperview];
                       }];
                       
                   }];
               }
            }
            else {
                UIColor *orangeColor = [UIColor colorWithRed:(231/255.0) green:(148/255.0) blue:(80/255.0) alpha:1];
                UILabel *notPalindromeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width-20, 50)];
                notPalindromeLabel.backgroundColor = orangeColor;
                notPalindromeLabel.text = @"No! This is not a palindrome";
                notPalindromeLabel.textAlignment = NSTextAlignmentCenter;
                
                [self.view addSubview:notPalindromeLabel];
                
                CGFloat maxButtonY = CGRectGetMaxY(self.testPhraseButton.frame);
                
                [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    notPalindromeLabel.frame = CGRectMake(10, maxButtonY+20, self.view.frame.size.width-20, 50);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveLinear animations:^{
                        notPalindromeLabel.alpha = 0;
                    } completion:^(BOOL finished) {
                        [notPalindromeLabel removeFromSuperview];
                    }];
                    
                }];
                break;
            }
            
           
        }
     
    }
}

@end
