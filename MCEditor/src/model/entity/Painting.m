//
//  Painting.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Painting.h"

@implementation Painting

- (id)init
{
    self = [super init];
    if (self) {
        _blockCoordinates = [[Vector3f alloc] initWithX:.0f Y:.0f Z:.0f];
        _artType = @"Alban";
        _direction = 0;
    }
    return self;
}

@end
