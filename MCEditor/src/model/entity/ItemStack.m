//
//  ItemStack.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "ItemStack.h"

@implementation ItemStack

- (id)initWithStackId:(short)typeId durability:(short)durability andAmount:(short)amount
{
    self = [super init];
    if (self) {
        _typeId = typeId;
        _durability = durability;
        _amount = amount;
    }
    return self;
}

-(id)copy {
    return [[ItemStack alloc] initWithStackId:_typeId durability:_durability andAmount:_amount];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"ItemStack: type=%i, durability=%i, amount=%li", _typeId, _durability, (long)_amount];
}

@end
