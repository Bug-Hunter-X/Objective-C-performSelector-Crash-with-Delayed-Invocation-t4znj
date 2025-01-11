This code snippet demonstrates a potential issue in Objective-C related to the use of `performSelector:withObject:afterDelay:` when dealing with objects that might be deallocated before the selector is invoked.  If the object `myObject` is deallocated before the delay elapses, sending `myMessage` will likely result in a crash.

```objectivec
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
    [self performSelector:@selector(callMyMessage:) withObject:myObject afterDelay:2.0];
}

-(void)callMyMessage:(MyClass *)obj {
    [obj myMessage];
}
@end
```