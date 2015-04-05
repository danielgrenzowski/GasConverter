#import "OldCurrencyTableViewController.h"
#import "NetworkService.h"

@interface OldCurrencyTableViewController ()

@property NSMutableArray *currenciesArray;

@end


@implementation OldCurrencyTableViewController

#pragma - Loading methods

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
    self.currenciesArray = [NSMutableArray new];
    [self.currenciesArray addObjectsFromArray:[NetworkService fetchAllCurrencies]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    static NSString *CellIdentifier = @"oldCurrencyCell";
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
    Gas *gasSingleton = [Gas getInstance];
    gasSingleton.oldCurrency = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self performSegueWithIdentifier:@"firstSegue" sender:self];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NewCurrencyTableViewController *newCurrencyTableViewController = (NewCurrencyTableViewController *)segue.destinationViewController;
    newCurrencyTableViewController.currenciesArray = self.currenciesArray;
    newCurrencyTableViewController.delegate = self;
}

#pragma mark - NewCurrencyViewControllerDelegate

- (void)newCurrencyTableViewControllerDidSelect:(NewCurrencyTableViewController *)controller theNewCurrency:(NSString *)currency
{
    Gas *gasSingleton = [Gas getInstance];
    gasSingleton.currency = currency;
    [controller performSegueWithIdentifier:@"secondSegue" sender:controller];
    
}

@end
