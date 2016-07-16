//
//  LXYShop.h
//  01_瀑布流
//
//  Created by mac2 on 16/7/15.
//  Copyright © 2016年 mac2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXYShop : NSObject

/** 宽度 */
@property (nonatomic, assign) CGFloat w;

/** 高度 */
@property (nonatomic, assign) CGFloat h;

/** 图片 */
@property (nonatomic, copy) NSString *img;

/** 价格 */
@property (nonatomic, copy) NSString *price;

@end
