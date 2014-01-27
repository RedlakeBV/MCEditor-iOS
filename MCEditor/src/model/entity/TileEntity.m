//
//  TileEntity.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "TileEntity.h"

@implementation TileEntity

- (id)init
{
    self = [super init];
    if (self) {
        _location = [[Vector3f alloc] initWithX:0 Y:0 Z:0];
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@: X: %li Y: %li Z: %li",
            _tileId,
            (long)[_location blockX],
            (long)[_location blockY],
            (long)[_location blockZ]
            ];
}

@end
