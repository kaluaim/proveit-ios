#import <UIKit/UIKit.h>
@import Firebase;

@interface ProveitVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) FIRDatabaseReference *ref;
@end
