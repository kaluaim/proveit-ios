#import "ProveitVC.h"
#import "ProveCell.h"

@interface ProveitVC ()
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation ProveitVC
NSString *const kProveCell = @"ProveCell";
NSString *const kProveCell2 = @"cell2";
NSString *const kProveCell3 = @"cell3";

- (void)viewDidLoad {
    [super viewDidLoad];
    _ref = [[FIRDatabase database] reference];
    [_tableView registerNib:[UINib nibWithNibName:kProveCell bundle:nil] forCellReuseIdentifier:kProveCell];
    [_tableView registerNib:[UINib nibWithNibName:kProveCell2 bundle:nil] forCellReuseIdentifier:kProveCell2];
    [_tableView registerNib:[UINib nibWithNibName:kProveCell3 bundle:nil] forCellReuseIdentifier:kProveCell3];
    
    
    // Setup the pull to refresh view.
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.backgroundColor = [UIColor colorWithRed:0.84 green:0.24 blue:0.24 alpha:1.0];
    _refreshControl.tintColor = [UIColor whiteColor];
    [_refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [_tableView addSubview:_refreshControl];
}

#pragma -mark TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return 2;}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {return @"Pending requestes";}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProveCell *proveCell;
    
    @try {
        
        if(indexPath.section == 0) {
            
            switch (indexPath.row) {
                case 0:
                    proveCell = [tableView dequeueReusableCellWithIdentifier:kProveCell forIndexPath:indexPath];
                    return proveCell;
                    break;
                    
                case 1:
                    proveCell = [tableView dequeueReusableCellWithIdentifier:kProveCell2 forIndexPath:indexPath];
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
    [self performSegueWithIdentifier:@"prove-detail" sender:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (void)refresh:(UIRefreshControl *)refreshControl {
    NSLog(@"-----------> pull to refresh");
    [_refreshControl endRefreshing];
}

@end
