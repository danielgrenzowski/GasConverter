#import "OldPriceViewController.h"
#import "NetworkService.h"


@interface OldPriceViewController ()

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end


@implementation OldPriceViewController

#pragma mark - Loading methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    _tap.enabled = NO;
    [self.view addGestureRecognizer:_tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)sender
{
    
    if ([self isNumeric:sender.text])
    {

        Gas *gasSingleton = [Gas getInstance];
        gasSingleton.priceOld = [sender.text floatValue];

        if (gasSingleton.priceOld != 0) {
            sender.backgroundColor = [UIColor whiteColor];
            

            CGFloat conversionFactor = [NetworkService changePriceFrom:gasSingleton.oldCurrency to:gasSingleton.currency];
            
            gasSingleton.priceNew = gasSingleton.priceOld * conversionFactor;
            
            NSString *successMessage = [NSString stringWithFormat: @"$%.2f %@ is $%.2f %@!", gasSingleton.priceOld, gasSingleton.oldCurrency, gasSingleton.priceNew, gasSingleton.currency];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Conversion Completed!" message:successMessage delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    } else
    {
        sender.backgroundColor = [UIColor redColor];
        
        NSString *failureMessage = [NSString stringWithFormat: @"%@", @"Unable to recognize number - please try again."];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Conversion Failed!" message:failureMessage delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
        
        [alert show];
    }

    
    
}

#pragma mark - Hiding the keyboard

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _tap.enabled = YES;
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void)hideKeyboard
{
    [self.priceTextField resignFirstResponder];
    _tap.enabled = NO;
}

#pragma mark - Private

- (BOOL)isNumeric:(NSString *)s
{
    NSScanner *sc = [NSScanner scannerWithString:s];
    if ( [sc scanFloat:NULL] )
    {
        return [sc isAtEnd];
    }
    return NO;
}


@end
