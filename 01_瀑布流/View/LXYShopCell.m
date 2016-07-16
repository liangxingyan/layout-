//
//  LXYShopCell.m
//  01_瀑布流
//
//  Created by mac2 on 16/7/15.
//  Copyright © 2016年 mac2. All rights reserved.
//

#import "LXYShopCell.h"
#import "LXYShop.h"
#import "UIImageView+WebCache.h"


@interface LXYShopCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation LXYShopCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setShop:(LXYShop *)shop {
    _shop = shop;
    
    // 图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    
    // 价格
    self.price.text = shop.price;
    self.price.textColor = [UIColor redColor];
    
}

@end
