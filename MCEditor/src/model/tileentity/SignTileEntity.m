//
//  SignTileEntity.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "SignTileEntity.h"

@implementation SignTileEntity
NSInteger NUM_LINES = 4;

- (id)init
{
    self = [super init];
    if (self) {
        _lines = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"", nil];
    }
    return self;
}

-(void)setLine:(NSString*) line atIndex:(NSInteger)lineIndex {
    [_lines replaceObjectAtIndex:lineIndex withObject:line];
}

-(NSString *)description {
    NSMutableString * linesString = [[NSMutableString alloc] init];
    
    [linesString appendString:@"["];
    NSInteger counter = 0;
    for(NSString * line in _lines) {
        [linesString appendString: linesString];
        if(counter != [_lines count] - 1)
            [linesString appendString: @", "];
    }
    [linesString appendString:@"]"];
    
    return [NSString stringWithFormat:@"%@%@",
            [super description],
            linesString
            ];
}

@end
