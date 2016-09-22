//
//  ViewController.m
//  UIWebview与JS交互
//
//  Created by apple on 16/9/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIWebViewDelegateViewController.h"
#import "JavaScriptCoreViewController.h"
#import "WebViewJavascriptBridgeViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController

-(NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.dataArr addObject:@"UIWebviewDelegate"];
    [self.dataArr addObject:@"JavaScriptCore"];
    [self.dataArr addObject:@"WebViewJavascriptBridge"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:(UITableViewStylePlain)];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.rowHeight = 50;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:str];
        cell.textLabel.text = _dataArr[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIWebViewDelegateViewController *vc = [[UIWebViewDelegateViewController alloc] init];
        vc.title = @"UIWebViewDelegateViewController";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        JavaScriptCoreViewController *vc = [[JavaScriptCoreViewController alloc] init];
        vc.title = @"JavaScriptCoreViewController";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        WebViewJavascriptBridgeViewController *vc = [[WebViewJavascriptBridgeViewController alloc] init];
        vc.title = @"WebViewJavascriptBridgeViewController";
        [self.navigationController pushViewController:vc animated:YES];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
