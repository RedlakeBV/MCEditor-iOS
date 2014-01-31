//
//  Item.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id)init
{
    self = [super init];
    if (self) {
        _health = 5;
        _age = 0;
    }
    return self;
}

-(ItemStack*)getItemStack {
    if(!_itemStack) _itemStack = [[ItemStack alloc] initWithStackId:(short)0 durability:(short)0 andAmount:0];
    return _itemStack;
}

@end
