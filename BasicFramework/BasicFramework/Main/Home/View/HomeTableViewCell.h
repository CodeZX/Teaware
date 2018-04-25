//
//  HomeTableViewCell.h
//  BasicFramework
//
//  Created by apple on 2018/4/24.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,strong) NSDictionary *dic;
+ (instancetype)cellWithTableView:(UITableView *)tableView Identifier:(NSString *)identifier;

@end
