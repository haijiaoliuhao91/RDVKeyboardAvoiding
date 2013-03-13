# RDVKeyboardAvoiding

Handy scrollView, taking care of moving content from underneath the keyboard. It is build upon the code
from [iOS SDK: Keeping Content From Underneath the Keyboard](http://mobile.tutsplus.com/tutorials/iphone/ios-sdk-keeping-content-from-underneath-the-keyboard/?search_index=1).

## Setup

Drop the `RDVKeyboardAvoidingScrollView.h` and `RDVKeyboardAvoidingScrollView.m` into your project. If you don't have ARC
enabled, you will need to set a `-fobjc-arc` compiler flag on the `.m` source file. For use with `UIViewController` classes,
include `RDVKeyboardAvoidingScrollView.h` in your `UIViewController` subclass and set its view to be an instance of this class.
If you are using a xib file, set the view's class in the `Identity Inspector`.

## Example Usage

Initialize view controller's view to be an instance of `RDVKeyboardAvoiding`:

``` objective-c
- (void)loadView {
	CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];

	RDVKeyboardAvoiding *scrollView = [[RDVKeyboardAvoiding alloc] initWithFrame:applicationFrame];
	[scrollView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
	scrollView.keyboardAvoidingDelegate = self;

	// code...

	self.view = scrollView;
}
```

Set the `activeView` property of `RDVKeyboardAvoidingScrollView` in `textFieldDidEndEditing:` or `textViewDidEndEditing:` delegate methods:

``` objective-c
- (void)textFieldDidBeginEditing:(UITextField *)textField {
	[(RDVKeyboardAvoiding *)self.view setActiveView:textField];
}
```

Set it to `nil` in `textFieldDidEndEditing:` or `textViewDidEndEditing:`:

``` objective-c
- (void)textFieldDidEndEditing:(UITextField *)textField {
	[(RDVKeyboardAvoiding *)self.view setActiveView:nil];
}
```

## Contact

[Robert Dimitrov](http://github.com/robbdimitrov)  
[@robbdimitrov](https://twitter.com/robbdimitrov)

## License

RDVKeyboardAvoiding is available under the MIT license. See the LICENSE file for more info.
