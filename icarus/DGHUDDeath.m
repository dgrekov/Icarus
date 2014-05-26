//
//  DGHUDDeath.m
//  icarus
//
//  Created by Dmitry Grekov on 5/26/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGHUDDeath.h"

@implementation DGHUDDeath

+ (DGHUDDeath *) hudWithSize:(CGSize)size andType:(DGDeath)death andEndings:(int)endings{
    
    NSArray *lines = nil;
    
    switch (death) {
        case DGDeathNatural:
            lines = @[
                      @"NATURAL DEATH",
                      @"That nature brings me home,",
                      @"To fall is in the order of things.",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGDeathSunny:
            lines = @[
                      @"SUNNY DEATH",
                      @"The sun is a wondrous body",
                      @"like a magnificent father!",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGDeathWatery:
            lines = @[
                      @"WATERY DEATH",
                      @"He who is drowned",
                      @"is not troubled by the rain.",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGDeathHopeful:
            lines = @[
                      @"HOPEFUL DEATH",
                      @"What makes a desert beautiful?",
                      @"Somewhere it hides a well.",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGDeathRegular:
            lines = @[
                      @"REGULAR DEATH",
                      @"Oh cruel fate,",
                      @"what a tragic hand you deal me!",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        default:
            break;
    }
    
    
    
    
    DGHUDDeath *background = [super sadHudWithSize:size andLines:lines];
    return background;

}

@end
