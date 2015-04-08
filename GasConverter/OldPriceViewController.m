#import "OldPriceViewController.h"


@interface OldPriceViewController ()

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end


@implementation OldPriceViewController

#pragma - Loading Methods

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

#pragma mark - TextField Delegate

- (void)textFieldDidEndEditing:(UITextField *)sender
{
    
    if ([self isNumeric:sender.text])
    {
        if ([sender.text floatValue] != 0) {
            sender.backgroundColor = [UIColor whiteColor];
            
            [self.delegate oldPriceViewControllerDidSelect:self oldPrice:sender.text];
        }
        
    } else
    {
        sender.backgroundColor = [UIColor redColor];
        
        NSString *failureMessage = [NSString stringWithFormat: @"%@", @"Unable to recognize number - please try again."];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Conversion Failed!" message:failureMessage delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
        
        [alert show];
    }
}

#pragma mark - Hiding the Keyboard

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
