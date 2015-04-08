#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


//@protocol NetworkServiceDelegate <NSObject>;
//@end

@interface NetworkService : NSObject

//@property (weak, nonatomic) id<NetworkServiceDelegate> delegate;

+ (NSArray *)fetchAllCurrencies;

+ (CGFloat)changePriceFrom:(NSString *)theOldCurrency to:(NSString *)theNewCurrency;

@end
