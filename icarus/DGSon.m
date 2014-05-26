//
//  DGSon.m
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGSon.h"

@implementation DGSon

+ (DGSon *) son{
    
    NSArray *frames = @[
                        [SKTexture textureWithImageNamed:@"child1_01"],
                        [SKTexture textureWithImageNamed:@"child1_03"],
                        [SKTexture textureWithImageNamed:@"child1_05"]];
    
    for (SKTexture *texture in frames) {
        texture.filteringMode = SKTextureFilteringNearest;
    }
    DGSon *son = [DGSon spriteNodeWithTexture:[frames objectAtIndex:1]];
    [son runAction:[SKAction repeatActionForever:
                       [SKAction animateWithTextures:frames
                                        timePerFrame:0.10f
                                              resize:NO
                                             restore:YES]] withKey:@"flyingFlappyBird"];
    son.xScale = 2;
    son.yScale = 2;
    son.isFollowing = YES;
    
    return son;
}

- (void) update:(CFTimeInterval)currentTime{
    
    float accelFactor = 0.05f;
    CGPoint currentPosition = self.position;
    CGPoint targetPosition = CGPointMake(self.myParent.position.x-24, self.myParent.position.y);
    
    if (self.isFollowing) {
        double dx = abs(targetPosition.x-currentPosition.x);
        double dy = abs(targetPosition.y-currentPosition.y);
        double dist = dx*dx + dy*dy;
        if(dist > 2000){
            self.isFollowing = NO;
        }
//        if(targetPosition.x-currentPosition.x > 0){
//            self.xScale = -2;
//        } else{
//            self.xScale = 2;
//        }
        
       self.position = CGPointMake(currentPosition.x+(targetPosition.x - currentPosition.x)*accelFactor,
                            currentPosition.y+(targetPosition.y - currentPosition.y)*accelFactor);
    } else{
       [self runAction:[SKAction moveByX:60 y:300 duration:60]];
    }
}

@end
