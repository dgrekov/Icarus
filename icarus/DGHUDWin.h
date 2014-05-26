//
//  DGHUDWin.h
//  icarus
//
//  Created by Dmitry Grekov on 5/26/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGHUD.h"

typedef enum : long long {
    DGWinCheap = 32,
    DGWinPerfect = 64,
    DGWinPointless = 128,
    DGWinSad = 256,
    DGWinNormal = 512,
    DGWinFinal = 1024,
} DGWin;

@interface DGHUDWin : DGHUD

+ (DGHUDWin *) hudWithSize: (CGSize) size andType: (DGWin) win andEndings: (int) endings;


@end
