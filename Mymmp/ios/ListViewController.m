//
//  ListViewController.m
//  Login
//
//  Created by 龚赛强 on 2017/8/29.
//  Copyright © 2017年 龚赛强. All rights reserved.
//

#import "ListViewController.h"
#import "MyCell.h"
#import "MyModel.h"
#import "Masonry/Masonry.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setLeftItem];
    [self setupUI];
}

#pragma mark - UI

- (void)setLeftItem {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - tableView dataSource & delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    MyModel *model = self.datas[indexPath.row];
    cell.headerImageView.image = [UIImage imageNamed:model.headerImage];
    cell.titleLabel.text = model.title;
    cell.subTitleLabel.text = model.subTitle;
    cell.timeLabel.text = model.time;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    MyModel *model = self.datas[indexPath.row];    
    [self showAlertWithTitle:model.title Massage:model.subTitle];
}

#pragma mark - 按钮点击

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 私有方法

- (void)showAlertWithTitle:(NSString *)title Massage:(NSString *)msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 懒加载

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.rowHeight = 60;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MyCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSArray *)datas {
    if (!_datas) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"datas.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            MyModel *model = [[MyModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [temp addObject:model];
        }
        
        _datas = temp.copy;
    }
    return _datas;
}

@end
