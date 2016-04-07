//
//  TableVIew1.m
//  ControlViewTest
//
//  Created by pinglu on 16/3/7.
//  Copyright © 2016年 pinglu. All rights reserved.
//

#import "TableVIew1.h"
#import "TableView2.h"

@interface TableVIew1()<UITableViewDataSource,UITableViewDelegate>
{
    NSIndexPath* selectIndexPath;
    NSString* selectString;
}

@property (strong ,nonatomic) UITableView* tableView;

@end

@implementation TableVIew1


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        [_tableView reloadData];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* indifiter = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indifiter];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indifiter];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"选择%ld",indexPath.row];
    
    if (selectIndexPath && selectIndexPath.row == indexPath.row) {
        cell.detailTextLabel.text = selectString;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    selectIndexPath = indexPath;
    
    TableView2* view = [[TableView2 alloc] initWithFrame:CGRectMake(self.frame.size.width, 20, self.frame.size.width, self.frame.size.height)];
    [self addSubview:view];
    view.tableviewBlock = ^(NSString* str)
    {
        [self reloadViewWith:str];
    };
    [UIView animateWithDuration:0.1 animations:^{
        view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }];
    
}

-(void)reloadViewWith:(NSString*)str
{
    selectString = str;
    [_tableView reloadRowsAtIndexPaths:@[selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}



@end
