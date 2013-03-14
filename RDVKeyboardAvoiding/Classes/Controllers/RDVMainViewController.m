// RDVMainViewController.m
//
// Copyright (c) 2013 Robert Dimitrov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RDVMainViewController.h"
#import "RDVKeyboardAvoidingScrollView.h"

@interface RDVMainViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;
@property (nonatomic, strong) UITextField *textField3;
@property (nonatomic, strong) UITextField *textField4;
@property (nonatomic, strong) UITextField *textField5;
@property (nonatomic, strong) UITextField *textField6;

@property (nonatomic, strong) NSArray *textFields;
@property (nonatomic, weak) UITextField *activeField;

@property (nonatomic, strong) UIButton *completeButton;

@end

@implementation RDVMainViewController

@synthesize textField1, textField2, textField3, textField4, textField5, textField6, completeButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Keyboard avoiding";
    }
    return self;
}

#pragma mark - View lifecycle

- (void)loadView {
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    CGFloat elementWidth = roundf(applicationFrame.size.width - 2 * 20);
    
    UIScrollView *scrollView = [[RDVKeyboardAvoidingScrollView alloc] initWithFrame:applicationFrame];
    [scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setAlwaysBounceVertical:YES];
    
    textField1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, elementWidth, 30)];
    [textField1 setBorderStyle:UITextBorderStyleRoundedRect];
    [textField1 setDelegate:self];
    [scrollView addSubview:textField1];
    
    textField2 = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(textField1.frame) + 20,
                                                               elementWidth, 30)];
    [textField2 setBorderStyle:UITextBorderStyleRoundedRect];
    [textField2 setDelegate:self];
    [scrollView addSubview:textField2];
    
    textField3 = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(textField2.frame) + 20,
                                                               elementWidth, 30)];
    [textField3 setBorderStyle:UITextBorderStyleRoundedRect];
    [textField3 setDelegate:self];
    [scrollView addSubview:textField3];
    
    textField4 = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(textField3.frame) + 20,
                                                               elementWidth, 30)];
    [textField4 setBorderStyle:UITextBorderStyleRoundedRect];
    [textField4 setDelegate:self];
    [scrollView addSubview:textField4];
    
    textField5 = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(textField4.frame) + 20,
                                                               elementWidth, 30)];
    [textField5 setBorderStyle:UITextBorderStyleRoundedRect];
    [textField5 setDelegate:self];
    [scrollView addSubview:textField5];
    
    textField6 = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(textField5.frame) + 20,
                                                               elementWidth, 30)];
    [textField6 setBorderStyle:UITextBorderStyleRoundedRect];
    [textField6 setDelegate:self];
    [scrollView addSubview:textField6];
    
    self.textFields = @[textField1, textField2, textField3, textField4, textField5, textField6];
    
    completeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [completeButton setFrame:CGRectMake(20, CGRectGetMaxY(textField6.frame) + 20, elementWidth, 40)];
    [completeButton setTitle:@"Complete" forState:UIControlStateNormal];
    [completeButton addTarget:self action:@selector(completeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:completeButton];
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, CGRectGetMaxY(completeButton.frame) + 20)];
    
    self.view = scrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIGestureRecognizer *tapGestureRegognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(hideKeyboard:)];
    [tapGestureRegognizer setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tapGestureRegognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (void)completeButtonTapped:(id)sender {
    NSLog(@"completeButtonTapped:");
}

- (void)hideKeyboard:(id)sender {
    [self.activeField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.activeField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger textFieldIndex = [self.textFields indexOfObject:textField];
    
    if (textFieldIndex < self.textFields.count - 1) {
        [(UITextField *)self.textFields[textFieldIndex + 1] becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
