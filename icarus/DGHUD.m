//
//  DGHUD.m
//  icarus
//
//  Created by Dmitry Grekov on 5/26/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGHUD.h"

@implementation DGHUD

+ (id) hudWithSize:(CGSize)size andLines:(NSArray *)lines{
    DGHUD *background = [super spriteNodeWithColor:[UIColor blackColor] size:size];
    background.position = CGPointZero;
    
    DGLabel *line1 = [DGLabel label:lines[0]];
    DGLabel *line2 = [DGLabel label:lines[1]];
    DGLabel *line3 = [DGLabel label:lines[2]];
    DGLabel *line4 = [DGLabel label:lines[3]];
    line1.position = CGPointMake(-120, 50);
    line2.position = CGPointMake(-120, 30);
    line3.position = CGPointMake(-120, 10);
    line4.position = CGPointMake(-120, -10);
    
    
    [background addChild:line1];
    [background addChild:line2];
    [background addChild:line3];
    [background addChild:line4];
    
    return background;
}

+ (id) happyHudWithSize:(CGSize)size andLines:(NSArray *)lines{
    return [DGHUD hudWithSize:size andLines:lines];
}

+ (id) sadHudWithSize:(CGSize)size andLines:(NSArray *)lines{
    DGHUD *hud = [DGHUD hudWithSize:size andLines:lines];
    SKSpriteNode *grave = [SKSpriteNode spriteNodeWithImageNamed:@"grave"];
    grave.xScale = 2;
    grave.yScale = 2;
    grave.texture.filteringMode = SKTextureFilteringNearest;
    grave.position = CGPointMake(0, -50);
    [hud addChild:grave];
    
    
    return hud;
}

@end
