#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Gas.h"


@class OldPriceViewController;

@protocol OldPriceViewControllerDelegate <NSObject>
- (void)oldPriceViewControllerDidSelect:(OldPriceViewController *)controller oldPrice:(CGFloat *)price;
@end

@interface OldPriceViewController : UIViewController

@property (strong, nonatomic) NSString *oldCurrency;
@property (strong, nonatomic) NSString *currency;

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@end
