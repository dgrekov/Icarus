//
//  DGMyScene.h
//  icarus
//

//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "DGHUDStartGame.h"
#import "DGHUDDeath.h"
#import "DGHUDWin.h"
#import "DGBackground.h"
#import "DGPlayer.h"
#import "DGSon.h"
#import "DGBird.h"
#import "DGLabel.h"

@interface DGMyScene : SKScene <SKPhysicsContactDelegate>

@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) NSTimeInterval gameStartedTimeInterval;
@property (nonatomic) DGPlayer *player;
@property (nonatomic) DGSon *son;

@property (nonatomic) BOOL isPlaying;
@property (nonatomic) BOOL isScreenTouched;
@property (nonatomic) BOOL isSonDead;
@property (nonatomic) BOOL isWinning;
@property (nonatomic) CGSize screenSize;
@property (nonatomic) int endings;
@property (nonatomic) int lives;
@property (nonatomic) int waterPoints;
@property (nonatomic) NSMutableArray *lifeSprites;

@property (nonatomic) long long maskOfEndings;

@end
