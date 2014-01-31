//
//  NetherReactorTileEntity.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "NetherReactorTileEntity.h"

@implementation NetherReactorTileEntity

- (id)init
{
    self = [super init];
    if (self) {
        _isInitialized = NO;
        _hasFinished = NO;
        _progress = 0;
    }
    return self;
}

@end
