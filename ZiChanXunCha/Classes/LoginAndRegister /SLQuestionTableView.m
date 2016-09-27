//
//  SLQuestionTableView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/27.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLQuestionTableView.h"

@interface SLQuestionTableView ()



@end

@implementation SLQuestionTableView


-(instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * const identify = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.textLabel.text = @"123";
    
    return cell;
}







@end
