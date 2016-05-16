//
//  iOSHelper.h
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface iOSHelper : NSObject
+(UIColor*)getColorWithHexValue:(NSString*)hexValue;
+(void)showAlertWithTitle:(NSString *)title Message:(NSString *)message ForViewController:(UIViewController *)viewController;
@end
