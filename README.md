# RDVKeyboardAvoiding

Simple and powerful scrollView, taking care of moving content from underneath the keyboard.

## Setup

Drop the `RDVKeyboardAvoidingScrollView.h` and `RDVKeyboardAvoidingScrollView.m` into your project. If you don't have ARC
enabled, you will need to set a `-fobjc-arc` compiler flag on the `.m` source file. For use with `UIViewController` classes,
include `RDVKeyboardAvoidingScrollView.h` in your `UIViewController` subclass and set its view to be an instance of this class.
If you are using a xib file, set the view's class in the `Identity Inspector`.

## Requirements

* ARC
* iOS 5.0 or newer

## Example Usage

Initialize view controller's view to be an instance of `RDVKeyboardAvoiding`:

``` objective-c
- (void)loadView {
	CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];

	RDVKeyboardAvoiding *scrollView = [[RDVKeyboardAvoiding alloc] initWithFrame:applicationFrame];
	[scrollView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];

	// code...

	self.view = scrollView;
}
```

## Contact

[Robert Dimitrov](http://github.com/robbdimitrov)  
[@robbdimitrov](https://twitter.com/robbdimitrov)

## License

RDVKeyboardAvoiding is available under the MIT license. See the LICENSE file for more info.
