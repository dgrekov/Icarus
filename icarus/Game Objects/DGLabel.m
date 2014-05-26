//
//  DGLabel.m
//  icarus
//
//  Created by Dmitry Grekov on 5/25/14.
//  Copyright (c) 2014 Dmitry Grekov. All rights reserved.
//

#import "DGLabel.h"

@implementation DGLabel


+ (DGLabel *) label: (NSString *) label{
    DGLabel *object = [[DGLabel alloc] init];
    float dx = 0;
    NSUInteger len = [label length];
    unichar buffer[len+1];
    
    [label getCharacters:buffer range:NSMakeRange(0, len)];
    
    for(int i = 0; i < len; i++) {
        DGLetter *letter = [DGLetter letter:[NSString stringWithFormat:@"%C",buffer[i]]];
        letter.anchorPoint = CGPointZero;
        letter.position = CGPointMake(dx, 0);
      //  NSLog(@"Letter: %hu Width: %f DX is: %f",buffer[i],letter.size.width, dx);
        [object addChild:letter];
        dx += letter.size.width+1;
        
    }
    
    object.xScale = 2;
    object.yScale = 2;
    
    return object;
}
@end
