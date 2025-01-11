```objectivec
#import <UIKit/UIKit.h>

@interface MyClass : NSObject
- (void)myMessage; 
@end

@implementation MyClass
- (void)myMessage {
    NSLog (@"Message received");
}
@end

@interface ViewController : UIViewController
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    MyClass *myObject = [[MyClass alloc] init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        if (myObject) {
            [myObject myMessage];
        }
    });
}
@end
```