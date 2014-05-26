//
//  DGMyScene.m
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//


#import "DGMyScene.h"

int count_bits(long long s);

@implementation DGMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.physicsWorld.gravity = CGVectorMake(0.0f, -1.0f);
        self.physicsWorld.contactDelegate = self;
        /* Setup your scene here */
        self.screenSize = size;
        self.isPlaying = NO;
        [self addChild:[DGHUDStartGame hudWithSize:size]];
        self.endings = 0;
        self.lifeSprites = [NSMutableArray array];
    }
    return self;
}


- (void) startGame{
    [self removeAllChildren];
    self.player = [DGPlayer player];
    self.player.position = CGPointMake(-100, 0);
    self.son = [DGSon son];
    self.son.myParent = self.player;
    self.son.position = CGPointMake(-130, 15);
    [self addChild:[DGBackground backgroundWithSize:self.screenSize]];
    [self addChild:self.player];
    [self addChild:self.son];
    self.isPlaying = YES;
    self.isScreenTouched = NO;
    self.lives = 2;
    self.isSonDead = NO;
    self.isWinning = NO;
    self.waterPoints = 0;
    
    for(int i=0; i<=self.lives; i++){
        SKSpriteNode *life = [SKSpriteNode spriteNodeWithImageNamed:@"life"];
        life.position = CGPointMake(-120+i*20, 70);
        life.xScale = 1;
        life.yScale = 1;
        life.texture.filteringMode = SKTextureFilteringNearest;
        [self addChild:life];
        [self.lifeSprites addObject:life];
    }
    

    
}

-(void) stopGame{
    [self removeAllChildren];
    [self.lifeSprites removeAllObjects];
    self.isPlaying = NO;
    self.isSonDead = !self.son.isFollowing;
    if(count_bits(self.maskOfEndings) >=10){
        [self addChild:[DGHUDWin hudWithSize:self.size andType:DGWinFinal andEndings:count_bits(self.maskOfEndings)]];
    } else if(self.isWinning && !self.isSonDead && self.lives == 2){
        self.maskOfEndings = self.maskOfEndings | DGWinPerfect;
        [self addChild:[DGHUDWin hudWithSize:self.size andType:DGWinPerfect andEndings:count_bits(self.maskOfEndings)]];
    } else if(self.isWinning && self.waterPoints >= 500){
        self.maskOfEndings = self.maskOfEndings | DGWinCheap;
        [self addChild:[DGHUDWin hudWithSize:self.size andType:DGWinCheap andEndings:count_bits(self.maskOfEndings)]];
    } else if(self.isWinning && self.isSonDead && self.lives == 2){
        self.maskOfEndings = self.maskOfEndings | DGWinPointless;
        [self addChild:[DGHUDWin hudWithSize:self.size andType:DGWinPointless andEndings:count_bits(self.maskOfEndings)]];
    } else if(self.isWinning && self.isSonDead && self.lives < 2){
        self.maskOfEndings = self.maskOfEndings | DGWinSad;
        [self addChild:[DGHUDWin hudWithSize:self.size andType:DGWinSad andEndings:count_bits(self.maskOfEndings)]];
    } else if(self.isWinning){
        self.maskOfEndings = self.maskOfEndings | DGWinNormal;
        [self addChild:[DGHUDWin hudWithSize:self.size andType:DGWinNormal andEndings:count_bits(self.maskOfEndings)]];
    } else if (!self.isScreenTouched) {
        self.maskOfEndings = self.maskOfEndings | DGDeathNatural;
        [self addChild:[DGHUDDeath hudWithSize:self.size andType:DGDeathNatural andEndings:count_bits(self.maskOfEndings)]];
    } else if (self.player.position.y > 70){
        self.maskOfEndings = self.maskOfEndings | DGDeathSunny;
        [self addChild:[DGHUDDeath hudWithSize:self.size andType:DGDeathSunny andEndings:count_bits(self.maskOfEndings)]];
    } else if (self.player.position.y <-70){
        self.maskOfEndings = self.maskOfEndings | DGDeathWatery;
        [self addChild:[DGHUDDeath hudWithSize:self.size andType:DGDeathWatery andEndings:count_bits(self.maskOfEndings)]];
    } else if (self.lives <= 0 && !self.isSonDead){
        self.maskOfEndings = self.maskOfEndings | DGDeathHopeful;
        [self addChild:[DGHUDDeath hudWithSize:self.size andType:DGDeathHopeful andEndings:count_bits(self.maskOfEndings)]];
    } else if (self.lives <= 0 && self.isSonDead){
        self.maskOfEndings = self.maskOfEndings | DGDeathRegular;
        [self addChild:[DGHUDDeath hudWithSize:self.size andType:DGDeathRegular andEndings:count_bits(self.maskOfEndings)]];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    if(self.isPlaying){
        [self.player touchesBegan:touches withEvent:event];
        self.isScreenTouched = YES;
    } else{
        [self startGame];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.player touchesEnded:touches withEvent:event];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if(self.isPlaying){
        [self.player update:currentTime];
        [self.son update:currentTime];
        CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
        CFTimeInterval timeSinceStart = currentTime - self.gameStartedTimeInterval;
        self.lastUpdateTimeInterval = currentTime;
        if (timeSinceLast > 1) { // more than a second since last update
            timeSinceLast = 1.0 / 60.0;
            self.lastUpdateTimeInterval = currentTime;
        }
        if(timeSinceStart > 20){
            self.isWinning = YES;
            [self stopGame];
        }
        
        [self updateWithTimeSinceLastUpdate:timeSinceLast];
        if(self.player.position.y>90 || self.player.position.y < -90){
            [self stopGame];
        }
        if(self.player.position.y < -60){
            self.waterPoints++;        }
        if(self.lives <-0){
            [self stopGame];
        }
    } else {
        self.gameStartedTimeInterval = currentTime;
    }
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 1) {
        self.lastSpawnTimeInterval = 0;
        [self addChild:[DGBird bird]];
    }
}


- (void) didBeginContact:(SKPhysicsContact *)contact{
    SKPhysicsBody *firstBody, *secondBody;
    
    firstBody = contact.bodyA;
    secondBody = contact.bodyB;
    
    if(firstBody.categoryBitMask == BIRD_CATEGORY || secondBody.categoryBitMask == BIRD_CATEGORY){
        SKNode *node = [self.lifeSprites objectAtIndex:self.lives];
        [node removeFromParent];
        self.lives--;
        if(firstBody.categoryBitMask == BIRD_CATEGORY){
            [firstBody.node removeFromParent];
        }else{
            [secondBody.node removeFromParent];
        }
    }
}
@end


int count_bits(long long s)
{
    s = (s&0x5555555555555555L) + ((s>>1)&0x5555555555555555L);
    s = (s&0x3333333333333333L) + ((s>>2)&0x3333333333333333L);
    s = (s&0x0F0F0F0F0F0F0F0FL) + ((s>>4)&0x0F0F0F0F0F0F0F0FL);
    s = (s&0x00FF00FF00FF00FFL) + ((s>>8)&0x00FF00FF00FF00FFL);
    s = (s&0x0000FFFF0000FFFFL) + ((s>>16)&0x0000FFFF0000FFFFL);
    s = (s&0x00000000FFFFFFFFL) + ((s>>32)&0x00000000FFFFFFFFL);
    
    return (int)s;
}