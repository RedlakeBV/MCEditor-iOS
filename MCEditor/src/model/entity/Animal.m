//
//  Animal.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (id)init
{
    self = [super init];
    if (self) {
        _age = 0;
        _inLove = 0;
    }
    return self;
}

@end
