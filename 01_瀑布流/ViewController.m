//
//  ViewController.m
//  01_瀑布流
//
//  Created by mac2 on 16/7/14.
//  Copyright © 2016年 mac2. All rights reserved.
//

#import "ViewController.h"
#import "LXYWaterFlowLayout.h"
#import "LXYShop.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "LXYShopCell.h"

@interface ViewController () <UICollectionViewDataSource, LXYWaterFlowLayoutDelegate>

/** 所有的商品数据 */
@property (nonatomic, strong) NSMutableArray *shops;

/** collectionView */
@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation ViewController

static NSString * const LXYShopId = @"shop";

- (NSMutableArray *)shops {
    
    if (_shops == nil) {
        _shops = [NSMutableArray array];
    }
    
    return _shops;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 创建布局
    [self setupLayout];
    
    // 刷新数据
    [self setupRefresh];
   
    
}

- (void)setupRefresh {
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewShops)];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreShops)];
    
    self.collectionView.mj_footer.hidden = YES;
    
}

#pragma mark - 加载新数据
- (void)loadNewShops {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *shops = [LXYShop mj_objectArrayWithFilename:@"1.plist"];
        [self.shops removeAllObjects];
        [self.shops addObjectsFromArray:shops];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.mj_header endRefreshing];
        
    });
    
}

- (void)loadMoreShops {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *shops = [LXYShop mj_objectArrayWithFilename:@"1.plist"];
        [self.shops addObjectsFromArray:shops];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.mj_footer endRefreshing];
        
    });
    
}

- (void)setupLayout {
    // 创建布局
    LXYWaterFlowLayout *layout = [[LXYWaterFlowLayout alloc] init];
    layout.delegate = self;
    
    // 创建collectionView

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LXYShopCell class]) bundle:nil] forCellWithReuseIdentifier:LXYShopId];
    
    self.collectionView = collectionView;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    self.collectionView.mj_footer.hidden = self.shops.count == 0;
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LXYShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LXYShopId forIndexPath:indexPath];
    
    cell.shop = self.shops[indexPath.row];
    
    return cell;
}

#pragma mark - LXYWaterFlowLayoutDelegate
- (CGFloat)waterflowLayout:(LXYWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth {
    LXYShop *shop = self.shops[index];
    return itemWidth * shop.h / shop.w;
}

- (CGFloat)rowMarginInWaterflowLayout:(LXYWaterFlowLayout *)waterflowLayout {
    return 20;
}






@end
