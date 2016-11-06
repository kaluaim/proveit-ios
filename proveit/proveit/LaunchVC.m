#import "LaunchVC.h"
#import "ProveitUtilities.h"
@import Firebase;

@interface LaunchVC ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation LaunchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _ref = [[FIRDatabase database] reference];
   

}

- (void)viewWillAppear:(BOOL)animated {
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [super viewWillAppear:YES];
    // to get currently signed in user
    FIRUser *user = [FIRAuth auth].currentUser;
    
    if (user != nil) {
        // User is signed in.
        NSLog(@"--------------> user singed in: %@", user.email);
        NSLog(@"--------------> user singed in: %@", user.displayName);
        NSLog(@"--------------> user singed in: %@", user.photoURL);
        NSLog(@"--------------> user singed in: %@", user.uid);
        
        
        
        
//        @try {
//            [[[_ref child:@"indexes"] child:@"dddd@gmailDOTcom"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//                
//                // testing getting 10 id as kaluaim
//                [[[_ref child:@"users"] child:snapshot.value[@"dddd@gmailDOTcom"]] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//                    // Get user value
//                    NSLog(@"---------> user incooming: %@", snapshot.value[@"email"]);
//                    NSNumber *dateCreated = (NSNumber *) snapshot.value[@"date-created"];
//                    NSLog(@"---------> user incooming: %@", [ProveitUtilities localTimeZonForTimeIntervalSince1970:dateCreated]);
//                    
//                    // ...
//                } withCancelBlock:^(NSError * _Nonnull error) {
//                    NSLog(@"%@", error.localizedDescription);
//                }];
//                
//                
//            }];
//            
//        
//        } @catch (NSException *exception) {
//            
//        } @finally {
//            
//        }
        
        
        
//        [[[_ref child:@"users"] queryEqualToValue:@"test@gmail.com" childKey:@"email"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//            NSLog(@"---------> user incooming: %@", snapshot.value[@"email"]);
//            NSNumber *dateCreated = (NSNumber *) snapshot.value[@"date-created"];
//            NSLog(@"---------> user incooming: %@", [ProveitUtilities localTimeZonForTimeIntervalSince1970:dateCreated]);
//        } withCancelBlock:^(NSError * _Nonnull error) {
//            NSLog(@"%@", error.localizedDescription);
//        }];
        
        [[[[_ref child:@"users"] queryOrderedByChild:@"email"] queryEqualToValue:@"kaluaim@gmail.com"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            NSLog(@"-------------------> Done getting user %@", snapshot);
            NSDictionary *postDict = snapshot.value;
            
            if ([snapshot exists]) {
                NSLog(@"we are in");
                NSLog(@"%@ Key %@ Value", snapshot.key,snapshot.value);
                
                NSLog(@"---------> user incooming: %@", postDict);
                NSLog(@"---------> user incooming: %@", [[postDict allKeys] objectAtIndex:0]);
                NSLog(@"---------> user incooming: %@", [[postDict objectForKey:[[postDict allKeys] objectAtIndex:0]] objectForKey:@"email"]);
                NSNumber *dateCreated = (NSNumber *) [[postDict objectForKey:[[postDict allKeys] objectAtIndex:0]] objectForKey:@"date-created"];
                NSLog(@"---------> user incooming: %@", [ProveitUtilities localTimeZonForTimeIntervalSince1970:dateCreated]);
            }
            
        }];
        
        
        // go to landing page
        [self performSegueWithIdentifier:@"toProveit" sender:nil];
    } else {
        // No user is signed in.
        NSLog(@"----------------> no user logeding");
        [self performSegueWithIdentifier:@"toLogin" sender:nil];
    }
}
@end
