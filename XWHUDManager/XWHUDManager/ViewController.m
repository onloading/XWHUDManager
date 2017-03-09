//
//  ViewController.m
//  XWHUDManager
//
//  Created by crazyfire on 2017/3/8.
//  Copyright © 2017年 邱学伟. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+XW.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>{
    NSArray *data;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    data = @[@"无限展示小菊花",@"在当前View展示一个小菊花",@"loading... 小菊花",@"显示隐藏自定义文本菊花",@"window上显示文本提示框",@"限时隐藏在view展示一个有文本提示框",@"正确提示",@"有文本正确提示",@"错误提示",@"有文本错误提示",@"信息提示",@"警告提示"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid=@"cellID";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell==nil){
        
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:rid];
    }
    cell.textLabel.text = data[indexPath.row];
    return cell;

}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [MBProgressHUD showHUD];
            break;
        case 1:
            [MBProgressHUD showHUDInView];
            break;
        case 2:
            [MBProgressHUD showHUDLoadingEN];
            break;
        case 3:
            [MBProgressHUD showHUDMessage:@"加载中..." afterDelay:1.5];
            break;
        case 4:
            [MBProgressHUD showTipHUD:@"www.qiuxuewei.com"];
            break;
        case 5:
            [MBProgressHUD showTipHUDInView:@"加油!" afterDelay:3];
            break;
        case 6:
            [MBProgressHUD showSuccessHUD];
            break;
        case 7:
            [MBProgressHUD showSuccessTipHUD:@"加载成功"];
            break;
        case 8:
            [MBProgressHUD showErrorHUD];
            break;
        case 9:
            [MBProgressHUD showErrorTipHUD:@"加载失败"];
            break;
        case 10:
            [MBProgressHUD showInfoTipHUD:@"信息提示"];
            break;
        case 11:
            [MBProgressHUD showWarningTipHUD:@"警告提示"];
            break;
        default:
            break;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hide];
    });
}


@end
