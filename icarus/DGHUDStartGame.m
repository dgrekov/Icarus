//
//  DGHUDStartGame.m
//  icarus
//
//  Created by Dmitry Grekov on 5/25/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGHUDStartGame.h"

@implementation DGHUDStartGame

+ (DGHUDStartGame *) hudWithSize:(CGSize)size{
    
    DGHUDStartGame *background = [super happyHudWithSize:size andLines:@[
                                                                       @"Follow me closely, son.",
                                                                       @"Our wings are strong but",
                                                                       @"fragile and many dangers",
                                                                       @"lie ahead . . ."]];    
    return background;
}


@end
