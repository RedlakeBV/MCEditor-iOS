//
//  Level.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Level.h"
#import "NBTNumbers.h"

@implementation Level

-(NSDictionary*)dictionary {
    return @{
             @"GameType" : NBTInt(_gameType),
             @"LastPlayed" : NBTLong(_lastPlayed),
             @"LevelName" : _levelName,
             @"Platform" : NBTInt(_platform),
             @"Player" : [_player dictionary],
             @"RandomSeed" : NBTLong(_randomSeed),
             @"SizeOnDisk" : NBTLong(_sizeOnDisk),
             @"SpawnX" : NBTInt(_spawnPosition.blockX),
             @"SpawnY" : NBTInt(_spawnPosition.blockY),
             @"SpawnZ" : NBTInt(_spawnPosition.blockZ),
             @"StorageVersion" : NBTInt(_storageVersion),
             @"Time" : NBTLong(_time),
             @"dayCycleStopTime" : NBTLong(_dayCycleStopTime),
             @"spawnMobs" : NBTByte(_spawnMobs),
             };
}

-(id)initWithDictionary:(NSDictionary*) dictionary {
    self = [self init];
    if(self) {
        [self setGameType: (GameType)[[dictionary objectForKey:@"GameType"] integerValue]];
        [self setLastPlayed: [[dictionary objectForKey:@"LastPlayed"] longValue]];
        [self setLevelName: [dictionary objectForKey:@"LevelName"]];
        [self setPlatform: [[dictionary objectForKey:@"Platform"] integerValue]];
        [self setPlayer: [[Player alloc] initWithDictionary:[dictionary objectForKey:@"Player"]]];
        [self setRandomSeed: [[dictionary objectForKey: @"RandomSeed"] longValue]];
        [self setSizeOnDisk: [[dictionary objectForKey: @"SizeOnDisk"] longValue]];
        
        float spawnX = [[dictionary objectForKey:@"SpawnX"] floatValue];
        float spawnY = [[dictionary objectForKey:@"SpawnY"] floatValue];
        float spawnZ = [[dictionary objectForKey:@"SpawnZ"] floatValue];
        [self setSpawnPosition: [[Vector3f alloc] initWithX:spawnX Y:spawnY Z:spawnZ]];
        [self setStorageVersion: [[dictionary objectForKey:@"StorageVersion"] integerValue]];
        [self setTime: [[dictionary objectForKey:@"Time"] longValue]];
        [self setDayCycleStopTime: [[dictionary objectForKey:@"dayCycleStopTime"] longValue]];
        [self setSpawnMobs: [[dictionary objectForKey:@"spawnMobs"] boolValue]];
    }
    return self;
}

@end
