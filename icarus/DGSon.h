//
//  DGSon.h
//  icarus
//
//  Created by Dmitry Grekov on 5/24/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DGSon : SKSpriteNode

@property (nonatomic) SKNode *myParent;
@property (nonatomic) BOOL isFollowing;

+ (DGSon *) son;
-(void)update:(CFTimeInterval)currentTime;

@end
