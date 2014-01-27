//
//  ChestTileEntity.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "ChestTileEntity.h"

@implementation ChestTileEntity

- (id)init
{
    self = [super init];
    if (self) {
        _pairX = -0xffff;
        _pairZ = -0xffff;
    }
    return self;
}

@end
