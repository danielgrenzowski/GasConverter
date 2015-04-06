#import "NetworkService.h"
#import "YQL.h"


@implementation NetworkService

+ (NSArray *)fetchAllCurrencies {
    //fetch a list of currency symbols from Yahoo Finance API asynchronously
    //when fetch returns, call self.delegate currencyListUpdate:updatedList
    
    return [[NSMutableArray alloc] initWithObjects:@"USD", @"CAD", @"JPY", @"EUR", @"GBP", nil];
}

+ (CGFloat)changePriceFrom:(NSString *)theOldCurrency to:(NSString *)theNewCurrency
{
    NSDictionary *results = [YQL query:[NSString stringWithFormat:@"SELECT * FROM yahoo.finance.xchange WHERE pair=\"%@%@\"", theOldCurrency, theNewCurrency]];
    
    NSString *myStr = [[results valueForKeyPath:@"query.results.rate.Rate"] description];
    NSLog(@"Conversion rate is %@", myStr);
    
    return (CGFloat)[myStr floatValue];
}

@end
