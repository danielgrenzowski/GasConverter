#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "OldPriceViewController.h"
#import "NetworkService.h"
#import "Gas.h"


@class NewCurrencyTableViewController;

@protocol NewCurrencyTableViewControllerDelegate <NSObject>
- (void)newCurrencyTableViewControllerDidSelect:(NewCurrencyTableViewController *)controller theNewCurrency:(NSString *)currency;
@end


@interface NewCurrencyTableViewController : UITableViewController <OldPriceViewControllerDelegate>

@property (nonatomic, weak) id <NewCurrencyTableViewControllerDelegate> delegate;
@property (strong, nonatomic) NSString *oldCurrency;
@property NSMutableArray *currenciesArray;

@end
