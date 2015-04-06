#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


//@protocol NetworkServiceDelegate;
//@end

@interface NetworkService : NSObject

//@property (weak, nonatomic) id<NetworkServiceDelegate> delegate;

+ (NSArray *)fetchAllCurrencies;


//- (void)fetchAllCurrencies;
+ (CGFloat)changePriceFrom:(NSString *)theOldCurrency to:(NSString *)theNewCurrency;

@end

//@protocol NetworkServiceDelegate <NSObject>
//
//- (NSArray *)currencyListUpdated;
//- (double)currencyMultiplierUpdated;
//
//@end