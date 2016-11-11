#import "RequestProveVC.h"
#import "ProveitUtilities.h"
@import Firebase;

@interface RequestProveVC ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) NSNumber *expireAfter;
@end

@implementation RequestProveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _ref = [[FIRDatabase database] reference];
    
    // setup default settings from userDefaul
    _type = [NSNumber numberWithInt:1];
    _expireAfter = [NSNumber numberWithInt:1];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [_typeSegmented addTarget:self action:@selector(typeChanged) forControlEvents:UIControlEventValueChanged];
    [_expireSegmented addTarget:self action:@selector(expireChanged) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)didTapSend:(id)sender {
    // vaildate
    
    // send
    FIRUser *user = [FIRAuth auth].currentUser;
    
    
    // get receuver
    // check that sender not receiver
    [[[[_ref child:@"users"] queryOrderedByChild:@"email"] queryEqualToValue:_emailField.text] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"-------------------> Done getting user %@", snapshot);
        NSDictionary *postDict = snapshot.value;
        
        if ([snapshot exists]) {
            NSLog(@"we are in");
//            NSLog(@"%@ Key %@ Value", snapshot.key,snapshot.value);
//            
//            NSLog(@"---------> user incooming: %@", postDict);
//            NSLog(@"---------> user incooming: %@", [[postDict allKeys] objectAtIndex:0]);
//            NSLog(@"---------> user incooming: %@", [[postDict objectForKey:[[postDict allKeys] objectAtIndex:0]] objectForKey:@"email"]);
//            NSNumber *dateCreated = (NSNumber *) [[postDict objectForKey:[[postDict allKeys] objectAtIndex:0]] objectForKey:@"date-created"];
//            NSLog(@"---------> user incooming: %@", [ProveitUtilities localTimeZonForTimeIntervalSince1970:dateCreated]);
            
            [[[_ref child:@"proves"] childByAutoId] setValue:@{@"sender": user.uid,
                                                               @"receiver": [[postDict allKeys] objectAtIndex:0],
                                                               @"prove": @"",
                                                               @"send-date": [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]], // get current timezone
                                                               @"end-date": [NSNumber numberWithInt:-1],
                                                               @"type": _type,
                                                               @"status": [NSNumber numberWithInt:1],
                                                               @"expire-after": _expireAfter}];
        } else {
            // user not exist
            NSLog(@"------------> user not exist");
        }
        
    }];
    
    
    // go back to home
    
    //[self performSegueWithIdentifier:@"toSelectUser" sender:nil];
}

- (void)typeChanged {
    
    switch (_typeSegmented.selectedSegmentIndex) {
        case 0:
            NSLog(@"------------> type is 1");
            _type = [NSNumber numberWithInt:1];
            break;
        
        case 1:
            NSLog(@"------------> type is 2");
            _type = [NSNumber numberWithInt:2];
            break;
            
        default:
            break;
    }
        
}

- (void)expireChanged {
    
    switch (_expireSegmented.selectedSegmentIndex) {
        case 0:
            NSLog(@"------------> exire is 1");
            _expireAfter = [NSNumber numberWithInt:1];
            break;
            
        case 1:
            NSLog(@"------------> exire is 4");
            _expireAfter = [NSNumber numberWithInt:4];
            break;
            
        case 2:
            NSLog(@"------------> exire is 8");
            _expireAfter = [NSNumber numberWithInt:8];
            break;
            
        case 3:
            NSLog(@"------------> exire is 12");
            _expireAfter = [NSNumber numberWithInt:12];
            break;
            
        default:
            break;
    }
    
}
@end
