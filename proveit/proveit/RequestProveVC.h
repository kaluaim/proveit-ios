#import <UIKit/UIKit.h>

@interface RequestProveVC : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmented;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *expireSegmented;

@end
