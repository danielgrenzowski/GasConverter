#import <UIKit/UIKit.h>
#import "OldPriceViewController.h"


@class NewCurrencyTableViewController;

@protocol NewCurrencyTableViewControllerDelegate <NSObject>
- (void)newCurrencyTableViewControllerDidSelect:(NewCurrencyTableViewController *)controller theNewCurrency:(NSString *)currency;
@end


@interface NewCurrencyTableViewController : UITableViewController <OldPriceViewControllerDelegate>

@property (nonatomic, weak) id <NewCurrencyTableViewControllerDelegate> delegate;
@property (strong, nonatomic) NSString *oldCurrency;
@property NSMutableArray *currenciesArray;

@end
