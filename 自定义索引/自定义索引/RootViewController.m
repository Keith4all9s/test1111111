//
//  RootViewController.m
//  自定义索引
//
//  Created by mac on 15/11/4.
//  Copyright © 2015年 Keith. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *tableV;
    NSMutableArray *dataSource;
    NSMutableArray *dataArray;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = [[NSMutableArray alloc] init];
    dataArray = [[NSMutableArray alloc] init];

    
    for (char i= 'a'; i<='z'; i++) {
        NSString *str = [NSString stringWithFormat:@"%5c%5c",i,i];
        [dataArray addObject:str];
        [dataSource addObject:str];
        [dataSource addObject:str];
        
    }
    
    NSLog(@"THIS IS A TEST");
    NSLog(@"THIS IS A TEST");
    NSLog(@"THIS IS 3 TEST");
    
    
    NSLog(@"NEW");
    //2018-01-22 16:05:09
    
    NSLog(@"NEW");
    //2018-01-22 16:05:09
    
    
    
    [self CreatTable];
    
    
}
-(void)CreatTable{

    tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableV.delegate = self;
    tableV.dataSource = self;
    
    tableV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableV.allowsSelection = YES;
    tableV.sectionIndexColor = [UIColor redColor];
    [self.view addSubview:tableV];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return dataSource.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *str = @"LJ";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    cell.textLabel.text = dataSource[indexPath.row];
    return cell;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView

{

    if (tableView == self.searchDisplayController.searchResultsTableView)
        
    {
        
        return nil;
        
    }
    
    
    
    return dataArray;
    
}

//索引列点击事件

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index

{
    
    NSLog(@"===%@  ===%ld",title,index);
    
    //点击索引，列表跳转到对应索引的行
    
    [tableView
     scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index+1]
     atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    [tableView
//          scrollToRowAtIndexPath:
//          atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
    
    //弹出首字母提示
    
    //[self showLetter:title ];
    
    return index+1;
    
}


@end
