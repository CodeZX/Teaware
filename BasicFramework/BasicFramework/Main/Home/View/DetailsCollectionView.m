//
//  DetailsCollectionView.m
//  BasicFramework
//
//  Created by ZX on 2018/4/25.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import "DetailsCollectionView.h"

@interface DetailsCollectionView ()

@property (nonatomic,weak) UIImageView *contentImg;
@property (nonatomic,weak) UILabel *textLabel;
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIScrollView *textScrollView;
@end

@implementation DetailsCollectionView

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
////        [self setupUI];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self  = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景"]];
    
//    UIScrollView *scrollView = [UIScrollView new];
//    scrollView.backgroundColor = [UIColor redColor];
//    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH * 3, 200)];
//    scrollView.pagingEnabled = YES;
//    [self addSubview:scrollView];
//    self.scrollView = scrollView;
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.bottom.equalTo(self.centerY).offset(-20);
//        make.centerX.equalTo(self);
//        make.size.equalTo(CGSizeMake(SCREEN_WIDTH - 10,200));
//    }];
//    self.scrollView.backgroundColor = RandomColor;
//
    
    
        UIImageView *contentImg = [UIImageView new];
        [self addSubview:contentImg];
        self.contentImg = contentImg;
        [contentImg mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.bottom.equalTo(self.centerY).offset(-35);
            make.centerX.equalTo(self);
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH - 80,200));
        }];
//        self.contentImg.backgroundColor = RandomColor;
    
    
    UIScrollView *textScrollView = [UIScrollView new];
    textScrollView.backgroundColor = kClearColor;//    [textScrollView setContentSize:CGSizeMake(SCREEN_WIDTH, 200)];
    textScrollView.bounces = NO;
    textScrollView.showsVerticalScrollIndicator = NO;
    textScrollView.showsHorizontalScrollIndicator = NO;
//    textScrollView.pagingEnabled = YES;
    [self addSubview:textScrollView];
    self.textScrollView = textScrollView;
    [textScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.centerY).offset(20);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self.bottom);
    }];
//    self.textScrollView.backgroundColor = RandomColor;
    
    

    UILabel  *textLabel = [UILabel new];
//    textLabel.backgroundColor = RandomColor;
    textLabel.numberOfLines = 0;
    textLabel.textAlignment = NSTextAlignmentCenter;
    [textScrollView addSubview:textLabel];
    self.textLabel = textLabel;
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(textScrollView);
        make.width.equalTo(SCREEN_WIDTH - 20);
        
    }];
//    self.textLabel.backgroundColor = RedColor;
    
     UIFont* font = [UIFont fontWithName:@"Songti TC" size:13];
    NSString* content = @"茶盘是用来置茶杯的，\n可圆月形、可棋盘形……\n最重要的四字诀：宽、平、浅、白，\n盘面要宽，\n可依人数多寡，多放几个杯。\n盘底要平，\n才不会使茶杯不稳，易于摇晃，\n边要浅，色要白，\n为了烘托茶杯、茶壶，使之雅观。\n这是茶盘的自我写照。\n\n对于一个喜欢茶的我来说，\n除了饮茶带来的健康生活外，\n也常常思考，茶器给人的精神感受。\n看似无用的茶盘，却给我别样的感悟：\n\n茶盘是茶具里最有涵养的好好先生，\n终生甘当配角，\n有了茶盘，壶、杯等才好粉墨登场，\n演绎出一场关于茶文化的好戏，\n在无我茶会，\n似乎那茶盘一摆，\n就能在繁杂与琐碎中平出一片清凉而广阔的天地。\n十把壶摆在一起也没有一面茶盘摆在那里更有饮茶的氛围，\n前者只会感觉杂乱，\n后者才有一统局面的整肃。\n确实遇到因陋就简的局面，\n譬如羁旅异地，莽原丛林中，幕天席地而坐，\n只有壶和杯子，\n那壶与杯的摆放也必然是遵循其原来在茶盘上的位置，\n心境到了，似乎什么都有了。\n";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    NSAttributedString* attString = [[NSAttributedString alloc] initWithString:content
                                                                    attributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                font,NSFontAttributeName,
                                                                                [UIColor blackColor],NSForegroundColorAttributeName,
                                                                                @(1),NSKernAttributeName,
                                                                                paragraphStyle,NSParagraphStyleAttributeName,
                                                                                nil]];
//    self.textLabel.attributedText = attString;
    
    
}



- (void)setDic:(NSDictionary *)dic {
    
    _dic = dic;
    
    NSString *content = dic[@"content"];
    UIFont* font = [UIFont fontWithName:@"Songti TC" size:13];
//    NSString* content = @"茶盘是用来置茶杯的，\n可圆月形、可棋盘形……\n最重要的四字诀：宽、平、浅、白，\n盘面要宽，\n可依人数多寡，多放几个杯。\n盘底要平，\n才不会使茶杯不稳，易于摇晃，\n边要浅，色要白，\n为了烘托茶杯、茶壶，使之雅观。\n这是茶盘的自我写照。\n\n对于一个喜欢茶的我来说，\n除了饮茶带来的健康生活外，\n也常常思考，茶器给人的精神感受。\n看似无用的茶盘，却给我别样的感悟：\n\n茶盘是茶具里最有涵养的好好先生，\n终生甘当配角，\n有了茶盘，壶、杯等才好粉墨登场，\n演绎出一场关于茶文化的好戏，\n在无我茶会，\n似乎那茶盘一摆，\n就能在繁杂与琐碎中平出一片清凉而广阔的天地。\n十把壶摆在一起也没有一面茶盘摆在那里更有饮茶的氛围，\n前者只会感觉杂乱，\n后者才有一统局面的整肃。\n确实遇到因陋就简的局面，\n譬如羁旅异地，莽原丛林中，幕天席地而坐，\n只有壶和杯子，\n那壶与杯的摆放也必然是遵循其原来在茶盘上的位置，\n心境到了，似乎什么都有了。\n";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    NSAttributedString* attString = [[NSAttributedString alloc] initWithString:content
                                                                    attributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                font,NSFontAttributeName,
                                                                                [UIColor blackColor],NSForegroundColorAttributeName,
                                                                                @(1),NSKernAttributeName,
                                                                                paragraphStyle,NSParagraphStyleAttributeName,
                                                                                nil]];
    self.textLabel.attributedText = attString;
    
    self.contentImg.image = [UIImage imageNamed:dic[@"image"]];
    
}
@end
