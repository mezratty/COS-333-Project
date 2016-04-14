//
//  DBManager.h
//  SQLite3DBSample
//
//  Created by Divya Mehta on 3/31/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject


-(instancetype)initWithDatabaseFilename: (NSString *)dbFilename;

@property (nonatomic, strong) NSMutableArray *arrColumnNames;

@property (nonatomic) int affectedRows;

@property (nonatomic) long long lastInsertedRowID;

-(NSArray *)loadDataFromDB:(NSString *)query;

-(void)executeQuery:(NSString *)query;


@end
