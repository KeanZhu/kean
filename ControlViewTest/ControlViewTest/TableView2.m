//
//  TableView2.m
//  ControlViewTest
//
//  Created by pinglu on 16/3/7.
//  Copyright © 2016年 pinglu. All rights reserved.
//

#import "TableView2.h"

@interface TableView2()<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView* tableView;

@end

@implementation TableView2

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        [_tableView reloadData];
    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* intifiter = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:intifiter];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:intifiter];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"分类%ld",indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tableviewBlock([NSString stringWithFormat:@"分类%ld",indexPath.row]);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


@end
