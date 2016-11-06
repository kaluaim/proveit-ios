#import "RegisterVC.h"
@import Firebase;

@interface RegisterVC ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // to get currently signed in user
    FIRUser *user = [FIRAuth auth].currentUser;
    _ref = [[FIRDatabase database] reference];
    
    if (user != nil) {
        // User is signed in.
        NSLog(@"--------------> user singed in: %@", user.email);
        [self dismissModalStack];
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
            

            // add user info to db
            [[[_ref child:@"users"] child:user.uid] setValue:@{@"email": user.email,
                                                               @"username": @"",
                                                               @"display-name": @"",
                                                               @"date-created": [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]], // get current timezone
                                                               @"date-updated": [NSNumber numberWithInt:0]}]; // add image
            
            
            
            
//            [user sendEmailVerificationWithCompletion:^(NSError *_Nullable error) {
//                if (error) {
//                    // An error happened.
//                    NSLog(@"=========> error happened sendEmailVerificationWithCompletion");
//                } else {
//                    // Email sent.
//                    NSLog(@"=========> done  sendEmailVerificationWithCompletion");
//                }
//            }];
//            
            
            
            
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
