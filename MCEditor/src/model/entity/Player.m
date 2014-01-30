//
//  Player.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Player.h"

@implementation Player

-(EntityType)entityType {
    return EntityType_PLAYER;
}


-(NSDictionary*)dictionary {
    return _playerDictionary;
}

-(id)initWithDictionary:(NSDictionary*) dictionary {
    
    self  = [super init];
    if(self) {
        
    }
    return self;
}


@end
