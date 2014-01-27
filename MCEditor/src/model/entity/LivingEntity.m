//
//  LivingEntity.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "LivingEntity.h"

@implementation LivingEntity


- (id)init
{
    self = [super init];
    if (self) {
        [self setHealth: [self maxHealth]];
    }
    return self;
}

-(int)maxHealth {
    return 20;
}

@end
