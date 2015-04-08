#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class OldPriceViewController;

@protocol OldPriceViewControllerDelegate <NSObject>
- (void)oldPriceViewControllerDidSelect:(OldPriceViewController *)controller oldPrice:(NSString *)price;
@end

@interface OldPriceViewController : UIViewController

@property (nonatomic, weak) id <OldPriceViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *oldCurrency;
@property (strong, nonatomic) NSString *currency;

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@end
