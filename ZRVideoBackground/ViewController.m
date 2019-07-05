//
//  ViewController.m
//  ZRVideoBackground
//
//  Created by Hesland on 2019/7/1.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *login;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.videoPath = [[NSBundle mainBundle] pathForResource:@"videoBackground" ofType:@".mp4"];
}

- (void)setupUI {
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.frame = CGRectMake(50, [UIScreen mainScreen].bounds.size.height - 200, [UIScreen mainScreen].bounds.size.width - 100, 50);
    [login setTitle:@"login" forState:UIControlStateNormal];
    login.titleLabel.textColor = [UIColor whiteColor];
    login.backgroundColor = [UIColor greenColor];
    
    [login addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:login];
    self.login = login;
}

- (void)buttonClick:(id)sender {
    UILabel *label = self.login.titleLabel;
    [label setFont:[UIFont fontWithName:@"MFJinHei_Noncommercial-Regular" size:16]];
}


@end
