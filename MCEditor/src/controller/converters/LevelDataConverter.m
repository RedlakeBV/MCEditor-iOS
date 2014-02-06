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
    Level * level = [[Level alloc] initWithDictionary: [LevelDataConverter readLevelDictionaryAtPath:path error:error]];
    return level;
}

+(void)writeLevel:(Level*)level ToPath:(NSString*)path error:(NSError *__autoreleasing *)error {
    [LevelDataConverter writeLevelDictionary:[level dictionary]  ToPath:path error:error];
}


+(NSDictionary*)readLevelDictionaryAtPath:(NSString*)path error:(NSError *__autoreleasing *)error {
    NSData * data = [[NSFileManager defaultManager] contentsAtPath:path];
    NSRange dataRange = NSMakeRange(8, [data length] - 8);
    NSData *refinedData = [data subdataWithRange:dataRange];
    
    NSMutableDictionary * levelDict = [NBTKit NBTWithData:refinedData name:nil options:NBTLittleEndian error:error];
    NSLog(@"%@", levelDict);
    return levelDict;
}

+(void)writeLevelDictionary:(NSDictionary*)levelDict ToPath:(NSString*)path error:(NSError *__autoreleasing *)error {
    NSLog(@"%@", levelDict);
    NSData * newData = [NBTKit dataWithNBT:levelDict name:nil options:NBTLittleEndian error: error];
    
    NSString * leaver_headerPath = [[NSBundle mainBundle] pathForResource:@"level_header" ofType:@"dat"];
//    NSString *filePath = @"/Applications/MCSwitcher.app/level_header.dat";
    NSData *headerData = [NSData dataWithContentsOfFile:leaver_headerPath];
    
    
    NSMutableData *dataWithHeader = [[NSMutableData alloc] init];
    [dataWithHeader appendData: headerData];
    [dataWithHeader appendData: newData];
    
    [[NSFileManager defaultManager] createFileAtPath:path contents:dataWithHeader attributes:nil];
}


@end
