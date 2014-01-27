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

@end
