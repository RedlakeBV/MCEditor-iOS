//
//  PlayerAbilities.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "PlayerAbilities.h"

@implementation PlayerAbilities

-(id)initWithGameType:(GameType)gameType {
    self = [super init];
    if (self) {
        [self setGameType: gameType];
    }
    return self;
}

-(void)setGameType:(GameType)gameType {
    _mayFly = gameType;
    _flying = gameType;
    _instabuild = gameType;
    _invulnerable = gameType;
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if(self) {
        _flying = [[dictionary objectForKey:@"flying"] boolValue];
        _instabuild = [[dictionary objectForKey:@"instabuild"] boolValue];
        _invulnerable = [[dictionary objectForKey:@"invulnerable"] boolValue];
        _mayFly = [[dictionary objectForKey:@"mayfly"] boolValue];
    }
    return self;
}

-(NSDictionary *)dictionary {
    return @{
             @"flying" : [NSNumber numberWithBool: _flying],
             @"instabuild" : [NSNumber numberWithBool: _instabuild],
             @"invulnerable" : [NSNumber numberWithBool: _invulnerable],
             @"mayfly" : [NSNumber numberWithBool: _mayFly],
             };
}

@end
