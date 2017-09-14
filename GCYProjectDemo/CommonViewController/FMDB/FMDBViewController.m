//
//  FMDBViewController.m
//  GCYDemo
//
//  Created by gewara on 17/7/31.
//  Copyright © 2017年 gewara. All rights reserved.
//

// 导入 FMDB 第三方库 添加 libsqlite.dylib 文件
#import "FMDBViewController.h"
#import <FMDatabase.h>
#import <FMDatabaseQueue.h>

@interface FMDBViewController ()
@property (nonatomic, copy) NSString *dbPath;

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButtons];
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"user.sqlite"];
    self.dbPath = path;
    
    
}
// 创建数据库
- (void)createTable {
    NSLog(@"%s", __func__);
    NSLog(@"%@", self.dbPath);
    // 判断沙盒中是否有 self.dbPath
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:self.dbPath]) {
        FMDatabase *db = [FMDatabase databaseWithPath:self.dbPath];
        if ([db open]) {
            NSString * sql = @"CREATE TABLE 'user' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR(30), 'password' VARCHAR(30))";
            BOOL res = [db executeUpdate:sql];
            if (!res) {
                NSLog(@"创建数据库表-----失败");
            } else {
                NSLog(@"创建数据库表-----成功");
            }
            
        } else {
            NSLog(@"打开数据库-----失败");
        }
    }
}
// 插入数据
- (void)insertData {
    NSLog(@"%s", __func__);
    
    static int idx = 1;
    FMDatabase *db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString *sql = @"insert into user (name, password) values(?, ?)";
        NSString *name = [NSString stringWithFormat:@"tonyYang%d", idx++];
        BOOL res = [db executeUpdate:sql, name, @"boy"];
        if (!res) {
            NSLog(@"插入数据-----失败");
        } else {
            NSLog(@"插入数据-----成功");
        }
        [db close];
    }
}
// 查询数据
- (void)queryData {
    NSLog(@"%s", __func__);
    FMDatabase *db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString *sql = @"select * from user";
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            int userId = [rs intForColumn:@"id"];
            NSString *name = [rs stringForColumn:@"name"];
            NSString *pass = [rs stringForColumn:@"password"];
            NSLog(@"userID = %d, name = %@, password = %@", userId, name, pass);
        }
        [db close];
    }
}
// 清除数据
- (void)clearAllData {
    FMDatabase *db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString *sql = @"delete from user";
        BOOL res = [db executeUpdate:sql];
        if (!res) {
            NSLog(@"清除数据库-----失败");
        } else {
            NSLog(@"清除数据库-----成功");
        }
        [db close];
    }
}
// 多线程使用
- (void)multithread {
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
    dispatch_queue_t q1 = dispatch_queue_create("queue1", NULL);
    dispatch_queue_t q2 = dispatch_queue_create("queue2", NULL);
    
    dispatch_async(q1, ^{
        for (int i = 0; i < 100; i++) {
            [queue inDatabase:^(FMDatabase *db) {
                NSString *sql = @"insert into user (name, password) values(?,?)";
                NSString *name = [NSString stringWithFormat:@"queue1111===%d", i];
                BOOL res = [db executeUpdate:sql, name, @"boy"];
                if (!res) {
                    NSLog(@"添加数据----%@----失败", name);
                } else {
                    NSLog(@"添加数据----%@----成功", name);
                }
            }];
        }
    });
    
    
    dispatch_async(q2, ^{
        for (int i = 0; i < 100; i++) {
            [queue inDatabase:^(FMDatabase *db) {
                NSString *sql = @"insert into user (name, password) values(?,?)";
                NSString *name = [NSString stringWithFormat:@"queue2222===%d", i];
                BOOL res = [db executeUpdate:sql, name, @"boy"];
                if (!res) {
                    NSLog(@"添加数据----%@----失败", name);
                } else {
                    NSLog(@"添加数据----%@----成功", name);
                }
            }];
        }
    });
    
}
- (void)btnClick:(UIButton *)btn {
    NSInteger index = btn.tag - 1000;
    if (index == 0) {
        [self createTable];
    } else if (index == 1) {
        [self insertData];
    } else if (index == 2) {
        [self queryData];
    } else if (index == 3) {
        [self clearAllData];
    } else if (index == 4) {
        [self multithread];
    }
    
}

- (void)createButtons {
    NSArray *titleArr = @[@"创建数据库", @"插入数据", @"查询数据", @"清除数据库", @"多线程操作"];
    for (NSInteger i=0; i<titleArr.count; i++ ) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 50+i*40, CGRectGetWidth(self.view.bounds), 40);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.tag = 1000+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}


@end
