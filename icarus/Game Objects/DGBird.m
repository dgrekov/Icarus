//
//  DGBird.m
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGBird.h"

@implementation DGBird

+ (DGBird *) bird{
    
    NSArray *frames = @[
                        [SKTexture textureWithImageNamed:@"enemy1_01"],
                        [SKTexture textureWithImageNamed:@"enemy1_02"],
                        [SKTexture textureWithImageNamed:@"enemy1_03"],
                        [SKTexture textureWithImageNamed:@"enemy1_04"]];
    
    for (SKTexture *texture in frames) {
        texture.filteringMode = SKTextureFilteringNearest;
    }
    DGBird *bird = [DGBird spriteNodeWithTexture:[frames objectAtIndex:1]];
    [bird runAction:[SKAction repeatActionForever:
                       [SKAction animateWithTextures:frames
                                        timePerFrame:0.10f
                                              resize:NO
                                             restore:YES]] withKey:@"flyingFlappyBird"];
    NSInteger y = arc4random() % 100;
    CGPoint point = CGPointMake(300, y-50);
    
    [bird runAction:[SKAction sequence:@[
                                         [SKAction moveTo:point duration:0],
                                         [SKAction moveToX:-300 duration:12],
                                         [SKAction removeFromParent]]]];
    bird.xScale = 2;
    bird.yScale = 2;
    bird.position = CGPointMake(10000, 10000);
    bird.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bird.size];
    bird.physicsBody.affectedByGravity = NO;
    bird.physicsBody.categoryBitMask = BIRD_CATEGORY;
    bird.physicsBody.contactTestBitMask = PLAYER_CATEGORY;
    bird.physicsBody.collisionBitMask = PLAYER_CATEGORY;
    
    
    return bird;
}

-(void)update:(CFTimeInterval)currentTime{
    
}

@end
