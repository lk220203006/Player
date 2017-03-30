//
//  ListViewController.m
//  Player
//
//  Created by lgq on 2017/3/29.
//  Copyright © 2017年 liukun. All rights reserved.
//

#import "ListViewController.h"
//#import <MJRefresh/MJRefresh.h>
#import "ListTableViewCell.h"
#import "CusWatchViewController.h"

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation ListViewController

static NSString *cellIdentifier = @"ListTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"本地目录";
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableFooterView = [UIView new];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    self.datasource = [NSMutableArray array];
    [self loadLocalData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadLocalData{
    NSString *string = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:string];
    NSString *fileName;
    while (fileName = [dirEnum nextObject]) {
        NSLog(@"----------FielName : %@" , fileName);
        NSLog(@"-----------------FileFullPath : %@" , [string stringByAppendingPathComponent:fileName]) ;
        NSDictionary *dic = @{@"filename":fileName,
                              @"filepath":[string stringByAppendingPathComponent:fileName]};
        [self.datasource addObject:dic];
    }
    [self.myTableView reloadData];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSDictionary *dic = self.datasource[indexPath.row];
    [cell updateUI:dic];
    return cell;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.datasource[indexPath.row];
    CusWatchViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CusWatchViewController"];
    vc.param = dic;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
