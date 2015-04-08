#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface Gas : NSObject

@property CGFloat priceOld;
@property CGFloat priceNew;
@property CGFloat conversionFactor;
@property (weak, nonatomic) NSString *oldCurrency;
@property (weak, nonatomic) NSString *currency;


+ (Gas *)getInstance;

@end