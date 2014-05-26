//
//  DGHUDDeath.h
//  icarus
//
//  Created by Dmitry Grekov on 5/26/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGHUD.h"

typedef enum : uint8_t {
    DGDeathNatural = 1,
    DGDeathSunny = 2,
    DGDeathWatery = 4,
    DGDeathHopeful = 8,
    DGDeathRegular = 16,
} DGDeath;

@interface DGHUDDeath : DGHUD

+ (DGHUDDeath *) hudWithSize: (CGSize) size andType: (DGDeath) death andEndings: (int) endings;


@end
