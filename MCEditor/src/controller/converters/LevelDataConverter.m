//
//  LevelDataConverter.m
//  MCPTest
//
//  Created by Casper Eekhof on 30-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "LevelDataConverter.h"

@implementation LevelDataConverter


+ (Level*)readLevelAtPath:(NSString*)path error:(NSError *__autoreleasing *)error
{
    NSData * data = [[NSFileManager defaultManager] contentsAtPath:path];
    NSRange dataRange = NSMakeRange(8, [data length] - 8);
    NSData *refinedData = [data subdataWithRange:dataRange];
    
    NSMutableDictionary * levelDict = [NBTKit NBTWithData:refinedData name:nil options:NBTLittleEndian error:error];
    return [[Level alloc] initWithDictionary: levelDict];
}

+(void)writeLevel:(Level*)level ToPath:(NSString*)path error:(NSError *__autoreleasing *)error {
    NSData * newData = [NBTKit dataWithNBT:[level dictionary] name:nil options:NBTLittleEndian error: error];
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"level_header" ofType:@"dat"];
    NSData *headerData = [NSData dataWithContentsOfFile:filePath];
    
    
    NSMutableData *dataWithHeader = [[NSMutableData alloc] init];
    [dataWithHeader appendData: headerData];
    [dataWithHeader appendData: newData];
    
    [[NSFileManager defaultManager] createFileAtPath:path contents:dataWithHeader attributes:nil];
}


@end
