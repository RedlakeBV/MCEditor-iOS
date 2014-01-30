//
//  Level.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Level.h"

@implementation Level

-(NSDictionary*)dictionary {
    return @{
             @"GameType" : [NSNumber numberWithBool:_gameType],
             @"LastPlayed" : [NSNumber numberWithLong: _lastPlayed],
             @"LevelName" : _levelName,
             @"Platform" : [NSNumber numberWithInteger:_platform],
             @"Player" : [_player dictionary],
             @"RandomSeed" : [NSNumber numberWithLong: _randomSeed],
             @"SizeOnDisk" : [NSNumber numberWithLong: _sizeOnDisk],
             @"SpawnX" : [NSNumber numberWithFloat: _spawnPosition.blockX],
             @"SpawnY" : [NSNumber numberWithFloat: _spawnPosition.blockY],
             @"SpawnZ" : [NSNumber numberWithFloat: _spawnPosition.blockZ],
             @"StorageVersion" : [NSNumber numberWithInteger: _storageVersion],
             @"Time" : [NSNumber numberWithLong: _time],
             @"dayCycleStopTime" : [NSNumber numberWithLong: _dayCycleStopTime],
             @"spawnMobs" : [NSNumber numberWithBool: _spawnMobs],
             };
}

-(id)initWithDictionary:(NSDictionary*) dictionary {
    self = [self init];
    if(self) {
        [self setGameType: (GameType)[[dictionary objectForKey:@"GameType"] integerValue]];
        [self setLastPlayed: [[dictionary objectForKey:@"LastPlayed"] longValue]];
        [self setLevelName: [dictionary objectForKey:@"LevelName"]];
        [self setPlatform: [[dictionary objectForKey:@"Platform"] integerValue]];
        
        // TODO: change to object.
        Player * player = [[Player alloc] init];
        [player setPlayerDictionary:  [dictionary objectForKey:@"Player"]];
        [self setPlayer: player];
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
