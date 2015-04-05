#import "NewCurrencyTableViewController.h"


@interface NewCurrencyTableViewController ()

@end


@implementation NewCurrencyTableViewController

#pragma - Loading Methods

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currenciesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newCurrencyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.currenciesArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Table View Actions

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *currency = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self.delegate newCurrencyTableViewControllerDidSelect:self theNewCurrency:currency];
}

#pragma mark - OldPriceViewControllerDelegate

- (void)oldPriceViewControllerDidSelect:(OldPriceViewController *)controller oldPrice:(CGFloat *)price;
{
//    Gas *gasSingleton = [Gas getInstance];
//    gasSingleton.currency = currency;
//    [controller performSegueWithIdentifier:@"secondSegue" sender:controller];
    
}

@end
