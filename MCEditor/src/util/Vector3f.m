//
//  Vector3f.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Vector3f.h"

@implementation Vector3f

- (id)initWithX:(float)x Y:(float)y Z:(float)z
{
    self = [super init];
    if (self) {
        _blockX = x;
        _blockY = y;
        _blockZ = z;
    }
    return self;
}

-(double) distSquared:(Vector3f*)other {
    return pow(other.blockX - (double) _blockX, 2)
    + pow(other.blockY - (double) _blockY, 2)
    + pow(other.blockZ - (double) _blockZ, 2);
}

@end
