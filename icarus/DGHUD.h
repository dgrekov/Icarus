//
//  DGHUD.h
//  icarus
//
//  Created by Dmitry Grekov on 5/26/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "DGLabel.h"

@interface DGHUD : SKSpriteNode

+ (id) happyHudWithSize: (CGSize) size andLines: (NSArray *) lines;
+ (id) sadHudWithSize: (CGSize) size andLines: (NSArray *) lines;
+ (id) hudWithSize: (CGSize) size andLines: (NSArray *) lines;

@end
