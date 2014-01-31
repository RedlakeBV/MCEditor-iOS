//
//  Projectile.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Projectile.h"

@implementation Projectile

- (id)init
{
    self = [super init];
    if (self) {
        _xTile = (short)0;
        _yTile = (short)0;
        _zTile = (short)0;
        
        _shake = (Byte)0;
        _inTile = (Byte)0;
    }
    return self;
}

@end
