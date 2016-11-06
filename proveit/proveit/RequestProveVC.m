#import "RequestProveVC.h"

@interface RequestProveVC ()

@end

@implementation RequestProveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didTapSend:(id)sender {
    // vaildate
    
    // send
    
    // go back to home
    
    [self performSegueWithIdentifier:@"toSelectUser" sender:nil];
}

@end
