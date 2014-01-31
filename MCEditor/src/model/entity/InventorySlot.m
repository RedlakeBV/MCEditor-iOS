//
//  InventorySlot.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "InventorySlot.h"

@implementation InventorySlot

- (id)initWith:(Byte)slot andContents:(ItemStack*)contents
{
    self = [super init];
    if (self) {
        _slot = slot;
        _contents = contents;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Slot %i: Type: %i; Damage: %i; Amount: %li",
            _slot,
            [_contents typeId],
            [_contents durability],
            (long)[_contents amount]
            ];
}

@end
