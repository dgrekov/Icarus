//
//  DGPlayer.h
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


typedef enum : uint8_t {
    DGPlayerDirectionNone       = 0,
    DGPlayerDirectionLeft       = 1,
    DGPlayerDirectionRight     = -1,
} DGPlayerDirection;

@interface DGPlayer : SKSpriteNode

@property (nonatomic) BOOL isTouching;
@property (nonatomic) DGPlayerDirection direction;

+ (DGPlayer *) player;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)update:(CFTimeInterval)currentTime;
@end
