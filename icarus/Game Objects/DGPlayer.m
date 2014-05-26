//
//  DGPlayer.m
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGPlayer.h"

@implementation DGPlayer

+ (DGPlayer *) player{
    
    NSArray *frames = @[
                        [SKTexture textureWithImageNamed:@"player2_01"],
                        [SKTexture textureWithImageNamed:@"player2_03"],
                        [SKTexture textureWithImageNamed:@"player2_05"],
                        [SKTexture textureWithImageNamed:@"player2_07"],
                        [SKTexture textureWithImageNamed:@"player2_09"],
                        [SKTexture textureWithImageNamed:@"player2_11"]];
    
    for (SKTexture *texture in frames) {
        texture.filteringMode = SKTextureFilteringNearest;
    }
    
    DGPlayer *player = [DGPlayer spriteNodeWithTexture:[frames objectAtIndex:1]];
    player.texture.filteringMode = SKTextureFilteringNearest;
    player.xScale = 2;
    player.yScale = 2;
    
    player.isTouching = NO;
    
    [player runAction:[SKAction repeatActionForever:
                     [SKAction animateWithTextures:frames
                                      timePerFrame:0.10f
                                            resize:NO
                                           restore:YES]] withKey:@"flyingFlappyBird"];
    
    /*
     * Create a physics and specify its geometrical shape so that collision algorithm
     * can work more prominently
     */
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.friction = 5;
    player.physicsBody.categoryBitMask = PLAYER_CATEGORY;
    player.physicsBody.contactTestBitMask = BIRD_CATEGORY;
    player.physicsBody.collisionBitMask = BIRD_CATEGORY;
    return player;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.isTouching = YES;
    
        for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if(self.xScale < 0){
            //we are flipped
            location.x = -location.x;
        }
            
        if(location.x < 0){
            self.direction = DGPlayerDirectionLeft;
            self.xScale = -2;
        } else if (location.x == 0){
            self.direction = DGPlayerDirectionNone;
        } else {
            self.direction = DGPlayerDirectionRight;
            self.xScale = 2;
        }
//        self.physicsBody.velocity = CGVectorMake(0, 100);
//        
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.isTouching = NO;
}

-(void) update:(CFTimeInterval)currentTime{
    if(self.isTouching){
        float force = 0.1f;
        switch (self.direction) {
            case DGPlayerDirectionLeft:
                force = -2;
                break;
            case DGPlayerDirectionRight:
                force = 2;
                break;
            case DGPlayerDirectionNone:
                force = 0;
                break;
            default:
                break;
        }
        [self runAction:[SKAction moveBy:CGVectorMake(force, 0) duration:0]];
        [self.physicsBody applyImpulse:CGVectorMake(0, 0.2)];
        NSLog(@"Applying Force: %f, 0.5", force);
    }
}
@end
