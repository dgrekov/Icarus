//
//  DGHUDWin.m
//  icarus
//
//  Created by Dmitry Grekov on 5/26/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGHUDWin.h"

@implementation DGHUDWin

+ (DGHUDWin *) hudWithSize:(CGSize)size andType:(DGWin) win andEndings:(int)endings{
    
    NSArray *lines = nil;
    
    switch (win) {
        case DGWinCheap:
            lines = @[
                      @"CHEAP WIN",
                      @"Darling it's better,",
                      @"down where it's wetter.",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGWinNormal:
            lines = @[
                      @"NORMAL WIN",
                      @"Pain is inevitable",
                      @"Suffering is optional.",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGWinPerfect:
            lines = @[
                      @"PERFECT WIN",
                      @"To live is the rarest thing.",
                      @"Most people exist, that is all.",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGWinPointless:
            lines = @[
                      @"POINTLESS WIN",
                      @"How my achievements",
                      @"mock me!",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGWinSad:
            lines = @[
                      @"SAD WIN",
                      @"What is essential is often",
                      @"invisible to the eyes.",
                      [NSString stringWithFormat:@"%d/10 ENDINGS FOUND",endings]];
            break;
        case DGWinFinal:
            lines = @[
                      @"CONGRATULATIONS",
                      @"You found all my endings.",
                      @"Good luck finding yours!",
                      @"Thank you for playing."];
            break;
        default:
            break;
    }
    
    
    
    
    DGHUDWin *background = [super happyHudWithSize:size andLines:lines];
    return background;
    
}

@end
