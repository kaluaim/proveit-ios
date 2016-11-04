#import "LaunchVC.h"
@import Firebase;
@interface LaunchVC ()

@end

@implementation LaunchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
   

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    // to get currently signed in user
    FIRUser *user = [FIRAuth auth].currentUser;
    
    if (user != nil) {
        // User is signed in.
        NSLog(@"--------------> user singed in: %@", user.email);
        // go to landing page
    } else {
        // No user is signed in.
        NSLog(@"----------------> no user logeding");
    }
    
}
@end
