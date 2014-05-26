//
//  DGLetter.m
//  icarus
//
//  Created by Dmitry Grekov on 5/25/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGLetter.h"

@implementation DGLetter

+ (DGLetter *) letter:(NSString *)letter{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"letters" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString *rectString = [dict valueForKey:letter];
    return [[DGLetter alloc] initWithSpriteSheetNamed:@"font" sourceRect:CGRectFromString(rectString)];
}



- (id) initWithSpriteSheetNamed: (NSString *) spriteSheet sourceRect: (CGRect) source{
    
    // @param numberOfSprites - the number of sprite images to the left
    // @param scene - I add my sprite to a map node. Change it to a SKScene
    
    SKTexture  *ssTexture = [SKTexture textureWithImageNamed:spriteSheet];
    // Makes the sprite (ssTexture) stay pixelated:
    ssTexture.filteringMode = SKTextureFilteringNearest;
    
    float sx = source.origin.x;
    float sy = source.origin.y;
    float sWidth = source.size.width;
    float sHeight = source.size.height;
    
    // IMPORTANT: textureWithRect: uses 1 as 100% of the sprite.
    // This is why division from the original sprite is necessary.
    // Also why sx is incremented by a fraction.
    
    CGRect cutter = CGRectMake(sx/ssTexture.size.width, sy/ssTexture.size.height, sWidth/ssTexture.size.width, sHeight/ssTexture.size.height);
    SKTexture *temp = [SKTexture textureWithRect:cutter inTexture:ssTexture];
    
    self = [DGLetter spriteNodeWithTexture:temp];
    return self;
}

@end
