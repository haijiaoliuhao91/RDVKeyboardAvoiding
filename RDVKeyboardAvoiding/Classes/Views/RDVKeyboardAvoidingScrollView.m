// RDVKeyboardAvoidingScrollView.m
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

#import "RDVKeyboardAvoidingScrollView.h"

@interface RDVKeyboardAvoidingScrollView ()

@end

@implementation RDVKeyboardAvoidingScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWasShown:)
                                                     name:UIKeyboardDidShowNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillChangeFrame:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - Keyboard avoiding

- (void)keyboardWasShown:(NSNotification *)notification {
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [self moveContentFromBeneathTheKeyboard:keyboardSize];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [self moveContentFromBeneathTheKeyboard:keyboardSize];
}

- (void)moveContentFromBeneathTheKeyboard:(CGSize)keyboardSize {
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
    
    if (self.activeView) {
        CGRect aRect = self.frame;
        aRect.size.height -= keyboardSize.height;
        if (!CGRectContainsPoint(aRect, self.activeView.frame.origin) ) {
            CGPoint scrollPoint = CGPointMake(0.0, CGRectGetMinY(self.activeView.frame) - (keyboardSize.height - 15));
            [self setContentOffset:scrollPoint animated:YES];
        }
    }
}

#pragma mark - Methods

- (void)setActiveView:(UIView *)activeView {
    _activeView = activeView;
    
    [self displayActiveView];
}

// change content offset to display the active view
- (void)displayActiveView {
    
}

@end
