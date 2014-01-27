//
//  Sheep.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Sheep.h"

@implementation Sheep

- (id)init
{
    self = [super init];
    if (self) {
        _color = 0;
        _sheared = NO;
    }
    return self;
}

-(int)maxHealth {
    return 8;
}

@end
