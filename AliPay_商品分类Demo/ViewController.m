//
//  ViewController.m
//  AliPay_商品分类Demo
//
//  Created by locklight on 17/1/7.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LLBusinessTypeFlowLayout.h"
#import "LLBusinessType.h"
#import "LLBussnissTypeCell.h"


static NSString *ID = @"businessType";
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *businessTypeData;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    _businessTypeData = [self loadbusinessTypeData];
    //创建布局对象
    LLBusinessTypeFlowLayout *flowLayout =[[LLBusinessTypeFlowLayout alloc]init];
    //创建视图
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    //设置collectionView背景色
    collectionView.backgroundColor = [UIColor whiteColor];
    //添加到父控件
    [self.view addSubview:collectionView];
    
    //设置视图约束
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(150);
    }];
    
    //创建分页显示器
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    pageControl.numberOfPages = 2;
    [self.view addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(collectionView.mas_bottom).offset(0);
    }];
    
    _pageControl = pageControl;
    
    //设置数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //注册cell
    [collectionView registerClass:[LLBussnissTypeCell class] forCellWithReuseIdentifier:ID];
}

#pragma mark    代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x /scrollView.bounds.size.width + 0.4999;
    _pageControl.currentPage = page;
}

#pragma mark 数据源方法
//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每组有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.businessTypeData.count;
}
//item中cell内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    LLBussnissTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //设置cell内子控件数据
    cell.businessType = self.businessTypeData[indexPath.item];
    //返回cell
    return cell;
}

//加载数据
- (NSArray *)loadbusinessTypeData{
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"businessType.plist" withExtension:nil]];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[LLBusinessType businessTypeWithDict:dict]];
    }
    return arrM.copy;
}

@end
