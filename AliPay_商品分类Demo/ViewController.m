//
//  ViewController.m
//  AliPay_商品分类Demo
//
//  Created by locklight on 17/1/7.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "ViewController.h"
#import "LLBusinessTypeView.h"
#import "LLBusinessType.h"


@interface ViewController ()
@property (nonatomic, strong) NSArray *businessTypeData;
@property (weak, nonatomic) IBOutlet LLBusinessTypeView *typeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    _businessTypeData = [self loadbusinessTypeData];
    //class创建页面
//    LLBusinessTypeView *typeView = [[LLBusinessTypeView alloc]
//                                            initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180)];
//    [self.view addSubview:typeView];
//    typeView.businessTypeData = _businessTypeData;
    //sb或xib创建页面
    _typeView.businessTypeData = _businessTypeData;
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
