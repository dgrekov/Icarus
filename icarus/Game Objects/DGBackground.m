//
//  DGBackground.m
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGBackground.h"

@implementation DGBackground
+ (DGBackground *) backgroundWithSize:(CGSize)size{
    NSLog(@"Window Size: %@", NSStringFromCGSize(size));
    DGBackground *background = [super spriteNodeWithImageNamed:@"background"];
    CGFloat ratio = size.width / background.size.width;
    background.size = CGSizeMake(background.size.width*ratio, background.size.height*ratio);
    background.position = CGPointZero;
    
    
    SKSpriteNode *sun = [SKSpriteNode spriteNodeWithImageNamed:@"backgroundSun"];
    sun.position = CGPointMake(100, 50);
    sun.xScale = 2;
    sun.yScale = 2;
    sun.texture.filteringMode = SKTextureFilteringNearest;
    
    [background addChild:sun];
    
    DGWaves *waves = [DGWaves waves];
    waves.position = CGPointMake(0, -80);
    waves.xScale = 1.5;
    waves.yScale = 1.5;
    [background addChild:waves];
    
    return background;
}


@end
