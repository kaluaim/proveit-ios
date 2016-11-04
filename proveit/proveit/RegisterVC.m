#import "RegisterVC.h"
@import Firebase;

@interface RegisterVC ()

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (IBAction)doRegister {
    
    // do vaildition
    [[FIRAuth auth] createUserWithEmail:_emailField.text password:_passwordField.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"=========> user created: %@", user.email);
        } else {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    }];
    
}
@end
