#import "ProveitVC.h"
#import "ProveCell.h"

@interface ProveitVC ()

@end

@implementation ProveitVC
NSString *const kProveCell = @"ProveCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    _ref = [[FIRDatabase database] reference];
    [_tableView registerNib:[UINib nibWithNibName:kProveCell bundle:nil] forCellReuseIdentifier:kProveCell];
}

#pragma -mark TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return 1;}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {return @"Pending requestes";}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProveCell *proveCell;
    
    @try {
        
        if(indexPath.section == 0) {
            
            switch (indexPath.row) {
                case 0:
                    proveCell = [tableView dequeueReusableCellWithIdentifier:kProveCell forIndexPath:indexPath];
                    proveCell.textLabel.text = @"text";
                    return proveCell;
                    break;
                    
                default:
                    break;
            }
            
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR: %@", exception);
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        return 120;
    }
    
    return 44;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
