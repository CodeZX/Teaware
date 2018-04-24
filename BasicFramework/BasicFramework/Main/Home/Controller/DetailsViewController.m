//
//  DetailsViewController.m
//  BasicFramework
//
//  Created by apple on 2018/4/24.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsCollectionViewCell.h"
#import "DetailsCollectionView.h"

@interface DetailsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIView *containerView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [self setupUI];
    [self setupUI1];
}


- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.hidden = YES;
}
- (void)setupUI1 {
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.bounces = NO;
    scrollView.alwaysBounceVertical  = NO;
//    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT)];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.edges.equalTo(self.view);
        make.left.top.equalTo(self.view);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(SCREEN_HEIGHT);
    }];
    self.scrollView.backgroundColor = RandomColor;
    
    UIView *containerView  = [UIView new];
    containerView.backgroundColor = WhiteColor;
    [scrollView addSubview:containerView];
    self.containerView = containerView;
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(SCREEN_WIDTH * 4);
        make.height.equalTo(SCREEN_HEIGHT);
    }];
    
    
    DetailsCollectionView *detailsCollectionView  = [DetailsCollectionView new];
    detailsCollectionView.backgroundColor = WhiteColor;
    [containerView addSubview:detailsCollectionView];
    self.containerView = containerView;
    [detailsCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.containerView);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(SCREEN_HEIGHT);
    }];
//

    
}

- (void)setupUI {
    
    self.view.backgroundColor = WhiteColor;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 1.设置列间距
    layout.minimumInteritemSpacing = 1;
    // 2.设置行间距
    layout.minimumLineSpacing = 1;
    // 3.设置每个item的大小
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    // 4.设置Item的估计大小,用于动态设置item的大小，结合自动布局（self-sizing-cell）
//    layout.estimatedItemSize = CGSizeMake(320, Sen);
    // 5.设置布局方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 6.设置头视图尺寸大小
//    layout.headerReferenceSize = CGSizeMake(50, 50);
    // 7.设置尾视图尺寸大小
//    layout.footerReferenceSize = CGSizeMake(50, 50);
    // 8.设置分区(组)的EdgeInset（四边距）
//    layout.sectionInset = UIEdgeInsetsMake(10, 20, 30, 40);
    // 9.10.设置分区的头视图和尾视图是否始终固定在屏幕上边和下边
    layout.sectionFootersPinToVisibleBounds = YES;
    layout.sectionHeadersPinToVisibleBounds = YES;
    
    
    
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    collectionView.backgroundColor = GrayColor;
    
    [self.collectionView registerClass:[DetailsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}
#pragma mark -------------------------- collectionView delegate ----------------------------------------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell.contentView.backgroundColor = RandomColor;
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
