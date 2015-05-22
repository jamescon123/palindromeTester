//
//  ViewController.h
//  PalindromeTester
//
//  Created by James Connerton on 2015-05-21.
//  Copyright (c) 2015 James Connerton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic ,strong) UITextField *enterPhraseTextField;
@property (nonatomic, strong) UIButton *testPhraseButton;
@property (nonatomic, strong) NSString *enterPhraseString;
@end

