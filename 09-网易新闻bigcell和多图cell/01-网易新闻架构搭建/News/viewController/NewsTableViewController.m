//
//  NewsTableViewController.m
//  01-网易新闻架构搭建
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

-(void)setUrlstr:(NSString *)urlstr
{
    NSLog(@"%@",urlstr);
    
    [NewsModel downloadWithUrlstr:urlstr successBlock:^(NSArray *arr) {
//        NSLog(@"arr  %@",arr);
        //给dataArr 赋值
        self.dataArr = arr;
        //刷新表格
        [self.tableView reloadData];
    } failureBlock:^(NSError *error) {
        NSLog(@"error %@",error);
    }];
    
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return  self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseCell" forIndexPath:indexPath];
    NewsModel *model = self.dataArr[indexPath.row];
    
//    cell.textLabel.text = model.title;
    cell.model = model;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
