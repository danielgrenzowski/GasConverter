#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


//  YQL.h
//  yql-ios
//
//  Created by Guilherme Chapiewski on 10/19/12.
//  Copyright (c) 2012 Guilherme Chapiewski. All rights reserved.
//


@interface YQL : NSObject

+ (NSDictionary *)query:(NSString *)statement;

@end
