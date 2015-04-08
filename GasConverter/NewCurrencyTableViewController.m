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

#pragma mark - TableView Data Source

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

#pragma mark - TableView Actions

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *currency = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self.delegate newCurrencyTableViewControllerDidSelect:self theNewCurrency:currency];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OldPriceViewController *oldPriceViewController = (OldPriceViewController *)segue.destinationViewController;
    oldPriceViewController.delegate = self;
}

#pragma mark - OldPriceViewControllerDelegate

- (void)oldPriceViewControllerDidSelect:(OldPriceViewController *)controller oldPrice:(NSString *)price;
{
    Gas *gasSingleton = [Gas getInstance];
    gasSingleton.priceOld = (CGFloat)price.floatValue;

    
    CGFloat conversionFactor = [NetworkService changePriceFrom:gasSingleton.oldCurrency to:gasSingleton.currency];

    gasSingleton.priceNew = gasSingleton.priceOld * conversionFactor;
    
    NSString *successMessage = [NSString stringWithFormat: @"$%.2f %@ is $%.2f %@!", gasSingleton.priceOld, gasSingleton.oldCurrency, gasSingleton.priceNew, gasSingleton.currency];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Conversion Completed!" message:successMessage delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
    [alert show];

    
}

@end
