// RDVKeyboardAvoidingScrollView.h
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

#import <UIKit/UIKit.h>

@class RDVKeyboardAvoidingScrollView;

@protocol RDVKeyboardAvoidingScrollViewDelegate <NSObject>

@optional
// Sent before reordering subviews
- (void)keyboardAvoidingScrollViewWillReorderSubviews:(RDVKeyboardAvoidingScrollView *)keyboardAvoidingView;

// Sent after reordering subviews
- (void)keyboardAvoidingScrollViewDidReorderSubviews:(RDVKeyboardAvoidingScrollView *)keyboardAvoidingView;

@end

@interface RDVKeyboardAvoidingScrollView : UIScrollView

// Set the activeView on textField(View)DidBeginEditing
@property (weak, nonatomic) UIView *activeView;

// Delegate to respons to the RDVKeyboardAvoidingScrollViewDelegate protocol methods
@property (nonatomic, weak) id <RDVKeyboardAvoidingScrollViewDelegate> keyboardAvoidingDelegate;

@end
