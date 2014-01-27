//
//  Entity.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Entity.h"

@implementation Entity


- (id)init
{
    self = [super init];
    if (self) {
        _location = [[Vector3f alloc] initWithX:0.0f Y:0.0f Z:0.0f];
        _motion = [[Vector3f alloc] initWithX:0.0f Y:0.0f Z:0.0f];
        _air = 300;
        _onGround = NO;
        _entityType = 0;
    }
    return self;
}

-(EntityType)entityType {
    return EntityType_UNKNOWN;
}

@end
