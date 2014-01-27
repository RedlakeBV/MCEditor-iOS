//
//  PigZombie.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "PigZombie.h"

@implementation PigZombie
- (id)init
{
    self = [super init];
    if (self) {
        _anger = 0;
    }
    return self;
}

-(int)maxHealth {
    return 20;
}

@end
