#import "LoginVC.h"
@import Firebase;
//@import FirebaseAuth;
//@import FirebaseAuthUI;

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // to get currently signed in user
    FIRUser *user = [FIRAuth auth].currentUser;
    
    if (user != nil) {
        // User is signed in.
        NSLog(@"--------------> user singed in: %@", user.email);
        // go to landing page
        _logoutButton.hidden = NO;
        [self dismissModalStack];
    } else {
        // No user is signed in.
        NSLog(@"----------------> no user logeding");
        _logoutButton.hidden = YES;
    }

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    
}

- (IBAction)doLogin {
    
    // do vailditon
    [[FIRAuth auth] signInWithEmail:_emailField.text password:_passwordField.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"=========> user logedin: %@", user.email);
            _logoutButton.hidden = NO;
            [self dismissModalStack];
        } else {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}




-(void)dismissModalStack {
    UIViewController *vc = self.presentingViewController;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:NULL];
}
@end
