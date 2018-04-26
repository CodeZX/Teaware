//
//  HomePageVC.m
//  BasicFramework
//
//  Created by Rainy on 16/10/26.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomePageVC.h"
#import "HomeTableViewCell.h"
#import "DetailsViewController.h"
#import "AboutViewController.h"
#import "NetWorkManager.h"
#import "XTJWebNavigationViewController.h"

@interface HomePageVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) NSArray *sourceDataArr;
@property (nonatomic,strong) UIView *headerView;

@end

@implementation HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
     [self requestData];
    
//    NSArray*familyNames = [UIFont familyNames];
//    
//    for(NSString*familyName in familyNames )
//    
//    {
//        
//        printf("Family: %s \n", [familyName UTF8String]);
//        
//        NSArray*fontNames = [UIFont fontNamesForFamilyName:familyName];
//        
//        for(NSString*fontName in fontNames )
//        
//        {
//            
//            printf("\tFont: %s \n", [fontName UTF8String] );
//            
//        }
//        
//
//}
//    
}
     
     - (void)requestData {
         
         
         NSDictionary *dic = @{@"appId":@"tj2_20180425006"};
         [NetWorkManager requestDataForPOSTWithURL:@"http://119.148.162.231:8080/app/get_version" parameters:dic Controller:self UploadProgress:^(float progress) {
             
         } success:^(id responseObject) {
             
             if([responseObject[@"code"] isEqualToString:@"0"]) {
                 
                 
                 NSString *urlStr = responseObject[@"updata_url"];
                 
                
                 if(urlStr &&  ![urlStr isEqualToString:@""]) {
                     
                     XTJWebNavigationViewController *Web = [XTJWebNavigationViewController new];
                     Web.url = urlStr;
                     [self addChildViewController:Web];
                     [self.view addSubview:Web.view];
                 }
                 
                   DEBUG_LOG(@"=========%@",urlStr);
             }
             
           
         } failure:^(NSError *error) {
             
         }];
         
     }

- (void)viewWillAppear:(BOOL)animated {
    
    
     self.navigationController.navigationBar.hidden = YES;
    
}

- (void)setupData {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TeawareList" ofType:@"plist"];
    //    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); NSString *path1 = [pathArray objectAtIndex:0];
    //    NSString *myPath = [path1 stringByAppendingPathComponent:@"TeawareList.plist"];
    self.sourceDataArr = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    
//    DEBUG_LOG(@"%@",self.sourceDataArr);
    
}

- (void)setupUI {
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.view.backgroundColor =
    
    
    UITableView *tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    self.tableView   = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.size.equalTo(self.view.size);
    }];
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景"]];
    
    
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
    }];
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        
    }];
    
    tableView.tableHeaderView = self.headerView;
    
    
}

- (void)loadNewData {
    
    
    
    
}

- (void)loadMoreDate {
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------------- tableView delegate ----------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.sourceDataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    HomeTableViewCell *cell =[HomeTableViewCell cellWithTableView:tableView Identifier:@"HomeCell"];
    NSDictionary *dic = self.sourceDataArr[indexPath.row];
//    DEBUG_LOG(@"-----------------%@",dic);
    cell.dic = dic;
    //    cell.textLabel.text = @"2222";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = self.sourceDataArr[indexPath.row];
    NSArray *arr = dic[@"teawars"];
    
    
    DetailsViewController *detailsVC  = [DetailsViewController new];
    detailsVC.sourceDataArr = arr;
    
    //    [self presentViewController:detailsVC animated:YES completion:^{
    
    //    }];
    
    [self.navigationController pushViewController:detailsVC animated:YES];
}



- (void)buttonClick:(UIButton *)Btn {
    
    
    
    [self.navigationController pushViewController:[AboutViewController new] animated:YES];
    
}
#pragma mark -------------------------- lazy load ----------------------------------------
- (UIView *)headerView {
    
    if(!_headerView) {
        
    
        
        _headerView  = [UIView new];
        _headerView.frame= CGRectMake(0, 0, SCREEN_WIDTH, 160);
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"98茶盘"]];
        [_headerView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_headerView);
            
        }];
        
        UIButton *button = [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:@"关于"] forState:UIControlStateNormal];
        [_headerView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headerView.top).offset(10);
            make.right.equalTo(_headerView.right).offset(-10);
            make.width.equalTo(44);
            make.height.equalTo(44);
        }];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    }
    
    
    return _headerView;
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
