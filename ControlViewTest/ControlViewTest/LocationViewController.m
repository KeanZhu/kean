//
//  LocationViewController.m
//  ControlViewTest
//
//  Created by pinglu on 16/3/8.
//  Copyright © 2016年 pinglu. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger tapSectionNumber ;
    NSInteger lastSectionNumber;
    BOOL isSelected;
}

@property (strong ,nonatomic) UITableView* locationTableView;

@property (strong ,nonatomic) NSArray* dataArr;

@property (strong ,nonatomic) NSArray* sectionArr;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    tapSectionNumber = 0;
    lastSectionNumber = 0;
    isSelected = NO;
    
    _locationTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _locationTableView.delegate = self;
    _locationTableView.dataSource = self;
    _locationTableView.sectionIndexColor = [UIColor blackColor];
    [self.view addSubview:_locationTableView];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"cityGroups.plist" ofType:nil];
    NSArray *keyValuesArray = [NSArray arrayWithContentsOfFile:file];
    _dataArr = [NSArray array];
    _dataArr = keyValuesArray;
    [_locationTableView reloadData];
 
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tapSectionNumber == section) {
        if (tapSectionNumber == lastSectionNumber) {
            if (isSelected == YES) {
                isSelected = NO;
                return 0;
            }else
            {
                isSelected = YES;
                return [_dataArr[section][@"cities"] count];
            }
        }else
        {
            isSelected = YES;
            return [_dataArr[section][@"cities"] count];
        }
    }else
    {
      return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tapSectionNumber == indexPath.section) {
        return 44;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* ID = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == tapSectionNumber) {
        NSDictionary* dict = _dataArr[indexPath.section];
        cell.textLabel.text = dict[@"cities"][indexPath.row];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* HeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    HeaderLabel.backgroundColor = [UIColor lightGrayColor];
    HeaderLabel.text = [NSString stringWithFormat:@"\t%@",_dataArr[section][@"title"]];
    HeaderLabel.tag = section;
    UITapGestureRecognizer* tapgest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    HeaderLabel.userInteractionEnabled = YES;
    [HeaderLabel addGestureRecognizer:tapgest];
    return HeaderLabel;
}


-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //黑科技  kvc
    return [_dataArr valueForKeyPath:@"title"];
}

-(NSArray *)sectionArrAtIndexes:(NSIndexSet *)indexes
{
    return [_dataArr valueForKeyPath:@"title"];
}

-(void)tapAction:(UITapGestureRecognizer*)tapgest
{
    
    UIView* labelView =  tapgest.view;
    lastSectionNumber = tapSectionNumber;
    tapSectionNumber = labelView.tag;
//    NSInteger sectionNum = [_dataArr[labelView.tag][@"cities"] count];
//    NSIndexPath* pathIndex = [NSIndexPath indexPathForRow:labelView.tag inSection:sectionNum];
//    [self.locationTableView reloadRowsAtIndexPaths:@[pathIndex] withRowAnimation:UITableViewRowAnimationNone];
    [_locationTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
