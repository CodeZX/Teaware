//
//  AboutViewController.m
//  关于
//
//  Created by 周峻觉 on 2018/4/24.
//  Copyright © 2018年 周峻觉. All rights reserved.
//

#import "AboutViewController.h"

#define kKeyWindow                      [UIApplication sharedApplication].keyWindow
#define kScreenBounds                   [UIScreen mainScreen].bounds
#define kScreenSize                     [UIScreen mainScreen].bounds.size
#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight                   [UIScreen mainScreen].bounds.size.height
#define kScreenScale                    [UIScreen mainScreen].scale
#define kStatusHeight                   [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavBarHeight                   44
#define kStatusAndNavBarHeight          (kStatusHeight+kNavBarHeight)
#define kExtendedHeightAtIphoneXBottom  (kStatusHeight>20?34:0)

@interface AboutViewController ()

@property(nonatomic, strong)UIImageView* backgroundImageView;
@property(nonatomic, strong)UIButton* backButton;
@property(nonatomic, strong)UIScrollView* scrollView;
@property(nonatomic, strong)UIImageView* logoImageView;
@property(nonatomic, strong)UILabel* contentLabel;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.logoImageView];
    [self.scrollView addSubview:self.contentLabel];
    
    //NSLog(@"%@", [UIFont familyNames]);
    NSLog(@"1%@", NSStringFromCGRect(self.view.frame));
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    NSLog(@"2%@", NSStringFromCGRect(self.view.frame));
    
    self.backgroundImageView.frame = self.view.bounds;
    self.backButton.frame = CGRectMake(0, kStatusHeight, kNavBarHeight, kNavBarHeight);
    self.scrollView.frame = CGRectMake(0, kStatusAndNavBarHeight, kScreenWidth, kScreenHeight-kStatusAndNavBarHeight);
    
    self.logoImageView.frame = CGRectMake((self.scrollView.bounds.size.width-155)*0.5, 40, 155, 171);
    self.contentLabel.frame = CGRectMake(40, CGRectGetMaxY(self.logoImageView.frame)+40, self.scrollView.bounds.size.width-80, 900);
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, CGRectGetMaxY(self.contentLabel.frame)+40);
}

- (void)backAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景"]];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroundImageView;
}

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"茶叶"] forState:UIControlStateNormal];
        _backButton.contentMode = UIViewContentModeCenter;
        [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        
    }
    return _scrollView;
}

- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.image = [UIImage imageNamed:@"98茶盘"];
    }
    return _logoImageView;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        UIFont* font = [UIFont fontWithName:@"Songti TC" size:16];
        //UIFont* font = [UIFont systemFontOfSize:16];
        
        NSString* content = @"茶盘是用来置茶杯的，\n可圆月形、可棋盘形……\n最重要的四字诀：宽、平、浅、白，\n盘面要宽，\n可依人数多寡，多放几个杯。\n盘底要平，\n才不会使茶杯不稳，易于摇晃，\n边要浅，色要白，\n为了烘托茶杯、茶壶，使之雅观。\n这是茶盘的自我写照。\n\n对于一个喜欢茶的我来说，\n除了饮茶带来的健康生活外，\n也常常思考，茶器给人的精神感受。\n看似无用的茶盘，却给我别样的感悟：\n\n茶盘是茶具里最有涵养的好好先生，\n终生甘当配角，\n有了茶盘，壶、杯等才好粉墨登场，\n演绎出一场关于茶文化的好戏，\n在无我茶会，\n似乎那茶盘一摆，就能在繁杂与琐碎中平出一片清凉而广阔的天地。\n十把壶摆在一起也没有一面茶盘摆在那里更有饮茶的氛围，\n前者只会感觉杂乱，\n后者才有一统局面的整肃。\n确实遇到因陋就简的局面，\n譬如羁旅异地，莽原丛林中，幕天席地而坐，\n只有壶和杯子，那壶与杯的摆放也必然是遵循其原来在茶盘上的位置，\n心境到了，似乎什么都有了。\n";
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
        _contentLabel = [[UILabel alloc] init];
        //_contentLabel.font = [UIFont systemFontOfSize:25];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
//        _contentLabel.textColor = [UIColor redColor];
        //_contentLabel.text = @"茶盘是用来置茶杯的，\n可圆月形、可棋盘形……\n最重要的四字诀：宽、平、浅、白，\n就是盘面要宽，以便就客人人数多寡，可以放多几个杯。\n盘底要平，才不会使茶杯不稳，易于摇晃，\n边要浅，色要白，这都是为了烘托茶杯、茶壶，使之雅观。\n这是茶盘的自我写照。\n\n对于一个喜欢茶的我来说，\n除了饮茶带来的健康生活外，\n也常常思考，茶器给人的精神感受。\n而看似最无用的茶盘，却给我别样的感悟：\n\n茶盘是茶具里最有涵养和度量的好好先生，\n终生甘当配角，\n有了茶盘，壶、杯、公道等才好粉墨登场，\n演绎出一场关于茶文化的好戏，\n即便是在郊外或公园的无我茶会，\n似乎那茶盘一摆，就能在繁杂与琐碎中平出一片清凉而广阔的天地。\n十把壶摆在一起也没有一面茶盘摆在那里更有饮茶的氛围，\n前者只会感觉杂乱，\n后者才有一统局面的整肃。\n确实遇到因陋就简的局面，\n譬如羁旅异地，莽原丛林中，幕天席地而坐，\n只有壶和杯子，那壶与杯的摆放也必然是遵循其原来在茶盘上的位置，\n心境到了，似乎什么都有了。\n";
        _contentLabel.attributedText = attString;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
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
