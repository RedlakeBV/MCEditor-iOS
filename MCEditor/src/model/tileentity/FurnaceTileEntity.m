//
//  FurnaceTileEntity.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "FurnaceTileEntity.h"

@implementation FurnaceTileEntity

- (id)init
{
    self = [super init];
    if (self) {
        _burnTime = 0;
        _cookTime = 0;
    }
    return self;
}

-(int)containerSize {
    return 3; // input, fuel, output
}

@end
