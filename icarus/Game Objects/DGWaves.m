//
//  DGWaves.m
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGWaves.h"

@implementation DGWaves

+ (DGWaves *) waves{
    
    NSArray *frames = @[
                        [SKTexture textureWithImageNamed:@"waves_01"],
                        [SKTexture textureWithImageNamed:@"waves_02"],
                        [SKTexture textureWithImageNamed:@"waves_03"],
                        [SKTexture textureWithImageNamed:@"waves_04"],
                        [SKTexture textureWithImageNamed:@"waves_05"],
                    //    [SKTexture textureWithImageNamed:@"waves_06"],
                        [SKTexture textureWithImageNamed:@"waves_07"],
                        [SKTexture textureWithImageNamed:@"waves_08"],
                        [SKTexture textureWithImageNamed:@"waves_09"],
                        [SKTexture textureWithImageNamed:@"waves_10"],
                        [SKTexture textureWithImageNamed:@"waves_11"],
                        [SKTexture textureWithImageNamed:@"waves_12"]];
    for (SKTexture *texture in frames) {
        texture.filteringMode = SKTextureFilteringNearest;
    }
    
    DGWaves *waves = [[DGWaves alloc] init];
    for (int i = -10; i<14; i++) {
        DGWaves *wave = [DGWaves spriteNodeWithTexture:[frames objectAtIndex:1]];
        wave.texture.filteringMode = SKTextureFilteringNearest;
        [wave runAction:[SKAction repeatActionForever:
                          [SKAction animateWithTextures:frames
                                           timePerFrame:0.10f
                                                 resize:NO
                                                restore:YES]] withKey:@"flyingFlappyBird"];
        wave.position = CGPointMake(wave.size.width*i,wave.position.y);
        [waves addChild:wave];
        
    }
    
    /*
     * Create a physics and specify its geometrical shape so that collision algorithm
     * can work more prominently
     */
    //    bird.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bird.size];
    //    bird.physicsBody.categoryBitMask = DGColliderTypeBird;
    //    bird.physicsBody.contactTestBitMask = DGColliderTypePillar | DGColliderTypeGround;
    //    bird.physicsBody.collisionBitMask = DGColliderTypeNone;
    //    [bird animate];
    return waves;
}


@end
