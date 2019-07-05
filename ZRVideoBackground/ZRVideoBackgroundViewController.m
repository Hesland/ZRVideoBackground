//
//  ZRVideoBackgroundViewController.m
//  ZRVideoBackground
//
//  Created by Hesland on 2019/7/1.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <AVKit/AVKit.h>
#import "ZRVideoBackgroundViewController.h"

@interface ZRVideoBackgroundViewController ()

@property (nonatomic, strong) AVPlayerViewController *avPlayerController;

@end

@implementation ZRVideoBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.avPlayerController = [[AVPlayerViewController alloc] init];
    
    [self.view addSubview:self.avPlayerController.view];
    [self.view sendSubviewToBack:self.avPlayerController.view];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(repeatSetting) name:AVPlayerItemDidPlayToEndTimeNotification object:self.avPlayerController.player.currentItem];
    
    self.avPlayerController.view.frame = [UIScreen mainScreen].bounds;
    self.avPlayerController.showsPlaybackControls = NO;
    self.avPlayerController.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    if (self.videoPath.length) {
        NSURL *url = [NSURL fileURLWithPath:self.videoPath];
        self.avPlayerController.player = [AVPlayer playerWithURL:url];
        [self.avPlayerController.player play];
        self.avPlayerController.player.volume = 0.0;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)repeatSetting {
    [self.avPlayerController.player seekToTime:kCMTimeZero];
    [self.avPlayerController.player play];
}

@end
