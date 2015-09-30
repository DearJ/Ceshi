//
//  ViewController.m
//  mas
//
//  Created by 鬼马 on 15/9/29.
//  Copyright © 2015年 鬼马. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property(nonatomic , strong) UIView *view3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
    
    self.view3 = [UIView new];
    self.view3.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.view3];
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view4];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.width.mas_equalTo(@(100));
        make.height.equalTo(view1.mas_width);
        
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view1.mas_centerY);
        make.left.equalTo(view1.mas_right).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(view1.mas_height);
    }];
    
    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).offset(150);
        make.left.equalTo(view1.mas_left);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(self.view3.mas_width).multipliedBy(0.5);
    }];
    
    NSLog(@"第二次");
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundImage:[UIImage imageNamed:@"babyAvatar"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view3);
        make.centerY.equalTo(self.view3.mas_top).offset(7);
        make.size.mas_equalTo(CGSizeMake(85, 98));
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.view3.bounds];
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view3.frame.size.width/2, 0) radius:44 startAngle:M_PI endAngle:2*M_PI clockwise:NO]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 0;
    shapeLayer.path = path.CGPath;
    [self.view3.layer setMask:shapeLayer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
