//
//  LXYWaterFlowLayout.h
//  01_瀑布流
//
//  Created by mac2 on 16/7/14.
//  Copyright © 2016年 mac2. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXYWaterFlowLayout;

@protocol LXYWaterFlowLayoutDelegate <NSObject>

@required
- (CGFloat)waterflowLayout:(LXYWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (NSInteger)columnCountInWaterflowLayout:(LXYWaterFlowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(LXYWaterFlowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(LXYWaterFlowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(LXYWaterFlowLayout *)waterflowLayout;

@end


@interface LXYWaterFlowLayout : UICollectionViewLayout


/** 代理 */
@property (nonatomic, weak) id<LXYWaterFlowLayoutDelegate> delegate;

@end
