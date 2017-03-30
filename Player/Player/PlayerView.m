//
//  PlayerView.m
//  Player
//
//  Created by lgq on 2017/3/29.
//  Copyright © 2017年 liukun. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

+ (Class)layerClass{
    return [AVPlayerLayer class];
}

- (AVPlayer *)player{
    return [(AVPlayerLayer*)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player{
    [((AVPlayerLayer *)[self layer]) setPlayer:player];
}

@end
