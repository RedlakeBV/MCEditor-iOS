//
//  Player.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Player.h"
#import "ItemStack.h"
#import "InventorySlot.h"
#import "NBTNumbers.h"

@implementation Player

-(EntityType)entityType {
    return EntityType_PLAYER;
}


-(NSDictionary*)dictionary {
    return @{
             @"Air" : NBTShort([self air]),
             @"Armor" : [self armorSlotsToDictionary:_armorSlots],
             @"AttackTime" : NBTShort([self attackTime]),
             @"BedPositionX" : NBTInt([[self bedPosition] blockX]),
             @"BedPositionY" : NBTInt([[self bedPosition] blockY]),
             @"BedPositionZ" : NBTInt([[self bedPosition] blockZ]),
             @"DeathTime" : NBTShort([self deathTime]),
             @"Dimension" : NBTInt([self dimension]),
             @"FallDistance" : NBTFloat([self fallDistance]),
             @"Fire" : NBTShort([self fire]),
             @"Health" : NBTShort([self health]),
             @"HurtTime" : NBTShort([self hurtTime]),
             @"Inventory" : [self inventorySlotsToDictionary:_inventory],
             @"Motion" : @[NBTFloat([[self motion] blockX]),
                           NBTFloat([[self motion] blockY]),
                           NBTFloat([[self motion] blockZ]),],
             @"onGround" : NBTByte([self onGround]),
             @"Pos" : @[NBTFloat([[self location] blockX]),
                        NBTFloat([[self location] blockY]),
                        NBTFloat([[self location] blockZ]),],
             @"Rotation" : @[
                     NBTFloat([self yaw]),
                     NBTFloat([self pitch])
                     ],
             @"Score" : NBTInt([self score]),
             @"SleepTimer" : NBTShort([self sleepTimer]),
             @"Sleeping" : NBTByte([self sleeping]),
             @"SpawnX" : NBTInt([[self spawnPosition] blockX]),
             @"SpawnY" : NBTInt([[self spawnPosition] blockY]),
             @"SpawnZ" : NBTInt([[self spawnPosition] blockZ]),
             @"abilities" : [[self abilities] dictionary]
             };
}

-(id)initWithDictionary:(NSDictionary*) dictionary {
    
    self  = [super init];
    if(self) {
        
        NSArray * position = [dictionary valueForKey:@"Pos"];
        [self setLocation: [[Vector3f alloc]
                            initWithX:[[position objectAtIndex:0] floatValue]
                            Y:[[position objectAtIndex:1] floatValue]
                            Z:[[position objectAtIndex:2] floatValue] ]];
        NSArray * motion = [dictionary valueForKey:@"Motion"];
        [self setMotion:[[Vector3f alloc]
                         initWithX:[[motion objectAtIndex:0] floatValue]
                         Y:[[motion objectAtIndex:1] floatValue]
                         Z:[[motion objectAtIndex:2] floatValue] ]];
        [self setAir: [[dictionary objectForKey:@"Air"] shortValue]];
        [self setFire: [[dictionary objectForKey:@"Fire"] shortValue]];
        [self setFallDistance: [[dictionary valueForKey:@"FallDistance"] floatValue]];
        
        NSArray * rotation = [dictionary objectForKey:@"Rotation"];
        [self setYaw: [[rotation objectAtIndex:0] floatValue]];
        [self setPitch: [[rotation objectAtIndex:1] floatValue]];
        [self setOnGround: [[dictionary objectForKey:@"OnGround"] boolValue]];
        [self setAttackTime: [[dictionary objectForKey:@"AttackTime"] shortValue]];
        [self setDeathTime: [[dictionary objectForKey:@"DeathTime"] shortValue]];
        [self setHealth: [[dictionary objectForKey:@"Health"] shortValue]];
        [self setHurtTime: [[dictionary objectForKey:@"HurtTime"] shortValue]];
        [self setBedPosition: [[Vector3f alloc]
                               initWithX:[[dictionary objectForKey:@"BedPositionX"] floatValue]
                               Y:[[dictionary objectForKey:@"BedPositionY"] floatValue]
                               Z:[[dictionary objectForKey:@"BedPositionZ"] floatValue]
                               ]];
        [self setDimension: [[dictionary objectForKey:@"Dimension"] integerValue]];
        [self setScore: [[dictionary objectForKey:@"Score"] intValue]];
        [self setSleeping: [[dictionary objectForKey:@"Sleeping"] boolValue]];
        [self setAbilities: [[PlayerAbilities alloc] initWithDictionary:[dictionary objectForKey:@"abilities"]]];
        [self setSleepTimer: [[dictionary objectForKey:@"SleepTimer"] shortValue]];
        float spawnX = [[dictionary objectForKey:@"SpawnX"] floatValue];
        float spawnY = [[dictionary objectForKey:@"SpawnY"] floatValue];
        float spawnZ = [[dictionary objectForKey:@"SpawnZ"] floatValue];
        [self setSpawnPosition: [[Vector3f alloc] initWithX:spawnX Y:spawnY Z:spawnZ]];
        [self setArmorSlots: [self readArmor:[dictionary objectForKey:@"Armor"]]];
        [self setInventory: [self readInventory:[dictionary objectForKey:@"Inventory"]]];
        
        // future support
        //        [self setRiding: ]
    }
    return self;
}


-(NSArray*)readArmor:(NSArray*)dictSlots {
    NSMutableArray * armorSlots = [[NSMutableArray alloc] init];
    
    for(NSDictionary * dictSlot in dictSlots){
        [armorSlots addObject: [[ItemStack alloc]
                                initWithStackId:[[dictSlot objectForKey:@"id"] shortValue]
                                durability: [[dictSlot objectForKey:@"Damage"] shortValue]
                                andAmount: [[dictSlot objectForKey:@"Count"] shortValue]]];
    }
    
    return armorSlots;
}

-(NSArray*)readInventory:(NSArray*)dictSlots {
    NSMutableArray * slots = [[NSMutableArray alloc] init];
    
    for(NSDictionary * dictSlot in dictSlots){
        InventorySlot * inventory = [[InventorySlot alloc] init];
        [inventory setContents:[[ItemStack alloc]
                                initWithStackId:[[dictSlot objectForKey:@"id"] shortValue]
                                durability: [[dictSlot objectForKey:@"Damage"] shortValue]
                                andAmount: [[dictSlot objectForKey:@"Count"] shortValue]]];
        [inventory setSlot: [[dictSlot objectForKey:@"Slot"] charValue]];
        [slots addObject: inventory];
    }
    
    return slots;
}


-(NSArray*)armorSlotsToDictionary:(NSArray*)slots {
    NSMutableArray * dictionarySlots = [[NSMutableArray alloc] init];
    
    for(ItemStack * itemStack in slots) {
        [dictionarySlots addObject: [self itemStackToDictionary: itemStack]];
    }
    
    return dictionarySlots;
}

-(NSDictionary*)itemStackToDictionary:(ItemStack*)itemStack {
    return @{
             @"id" : NBTShort([itemStack typeId]),
             @"Damage" : NBTShort([itemStack durability]),
             @"Count" : NBTByte([itemStack amount]),
             };
}

-(NSArray*)inventorySlotsToDictionary:(NSArray*)slots {
    NSMutableArray * dictionarySlots = [[NSMutableArray alloc] init];
    
    for(InventorySlot * inventorySlot in slots) {
        ItemStack * itemStack = [inventorySlot contents];
        
        NSMutableDictionary * dictionary = [[NSMutableDictionary alloc] init];
        [dictionary addEntriesFromDictionary:[self itemStackToDictionary: itemStack]];
        [dictionary setObject: NBTByte([inventorySlot slot]) forKey:@"Slot"];
        [dictionarySlots addObject: dictionary];
    }
    
    return dictionarySlots;
}

@end
