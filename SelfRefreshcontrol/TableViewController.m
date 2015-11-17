//
//  TableViewController.m
//  SelfRefreshcontrol
//
//  Created by 魏大同 on 15/11/11.
//  Copyright © 2015年 魏大同. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (nonatomic,strong) UILabel *label1;
@property (nonatomic,strong) UILabel *label2;
@property (nonatomic,strong) UILabel *label3;
@property (nonatomic,strong) UIImageView *gifImageV;
@property (nonatomic,strong) UILabel *refreshlabel;
//@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"强行假装有标题";
    self.tableView.hidden    = NO;
     //图片
     self.gifImageV = [[UIImageView alloc] initWithFrame:CGRectMake(110, -80, 80, 80)];
     NSArray *gifArray = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"bao1"],
                          [UIImage imageNamed:@"bao2"],
                          [UIImage imageNamed:@"bao3"],
                          [UIImage imageNamed:@"bao4"],
                          [UIImage imageNamed:@"bao9"],
                          [UIImage imageNamed:@"bao8"],
                          [UIImage imageNamed:@"bao1"],
                          [UIImage imageNamed:@"bao2"],
                          [UIImage imageNamed:@"bao3"],
                          [UIImage imageNamed:@"bao4"],
                          [UIImage imageNamed:@"bao9"],
                          [UIImage imageNamed:@"bao8"],
                          [UIImage imageNamed:@"bao5"],
                          [UIImage imageNamed:@"bao6"],
                          [UIImage imageNamed:@"bao7"],
                          [UIImage imageNamed:@"bao5"],
                          [UIImage imageNamed:@"bao6"],
                          [UIImage imageNamed:@"bao7"],
                          [UIImage imageNamed:@"bao10"],
                          [UIImage imageNamed:@"bao11"],
                          [UIImage imageNamed:@"bao12"],
                          [UIImage imageNamed:@"bao13"],
                          [UIImage imageNamed:@"bao14"],
                          [UIImage imageNamed:@"bao10"],
                          [UIImage imageNamed:@"bao11"],
                          [UIImage imageNamed:@"bao12"],
                          [UIImage imageNamed:@"bao13"],
                          [UIImage imageNamed:@"bao14"],nil];
     self.gifImageV.animationImages = gifArray; //动画图片数组
     self.gifImageV.animationDuration = 3; //执行一次完整动画所需的时长
     self.gifImageV.animationRepeatCount = MAXFLOAT;  //动画重复次数
    
     //[self.view addSubview:gifImageView];
    
    self.refreshlabel = [[UILabel alloc] initWithFrame:CGRectMake(110, -50, 100, 60)];
    self.refreshlabel.text = @"下拉刷新";
    self.refreshlabel.textColor = [UIColor orangeColor];
    
//    self.bgImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
//    UIImage *bgimage = [UIImage imageNamed:@"backjpg"];
//    self.bgImageV.image = bgimage;
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, -100, 100, 30)];
    self.label1.text = @"刷新此页面需要";
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(220, -80, 90, 30)];
    self.label2.text = @"预计需要";
    
    self.label3 = [[UILabel alloc]initWithFrame:CGRectMake(200, -30, 90, 20)];
    self.label3.text = @"一年";
    self.label3.font = [UIFont systemFontOfSize:30];
    self.label3.textColor = [UIColor redColor];
    //self.label3.font = [];
    
    //scrollview
    //self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, -400, 300, 400)];
    //_scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.tableView addSubview:self.gifImageV];
    [self.tableView addSubview:self.label1];
    [self.tableView addSubview:self.label2];
    [self.tableView addSubview:self.label3];
    [self.tableView addSubview:self.refreshlabel];
    //[self.view addSubview:self.tableView];
    
//     Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
//    
//     Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.gifImageV.hidden = YES;
    self.label1.hidden = YES;
    self.label2.hidden = YES;
    self.label3.hidden = YES;
    self.refreshlabel.hidden = NO;
}

////告诉scrollview要缩放的是哪个子控件
// -(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//        return _bgImageV;
//}

#pragma mark - 下拉时触发函数
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollViewBeDragging) name: object:scrollView];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    if (scrollView.contentOffset.y <= -140) {
        self.gifImageV.hidden = NO;
        self.label1.hidden = NO;
        self.label2.hidden = NO;
        self.label3.hidden = NO;
        self.refreshlabel.hidden = YES;
        [self.gifImageV startAnimating];
        [self.tableView setContentInset:UIEdgeInsetsMake(164, 0, 0, 0)];
        [self performSelector:@selector(EndRefresh) withObject:self afterDelay:6];
    }else{
        self.gifImageV.hidden = YES;
        self.label1.hidden = YES;
        self.label2.hidden = YES;
        self.label3.hidden = YES;
        self.refreshlabel.hidden = NO;
    }

}
//-(void)scrollViewBeDragging{
//    
//}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSLog(@"offset: %f\ninset: %@", scrollView.contentOffset.y, NSStringFromUIEdgeInsets(scrollView.contentInset));
//    
//}
//
-(void)EndRefresh{
    
   
    [self.tableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    self.navigationController.navigationBar.translucent = NO;
    
   // [self.scrollView setContentInset:UIEdgeInsetsZero];
}
////循环图片
//- (void)Animationimage:(UIImageView*) image{
//    NSArray *hopAnimation;
//    hopAnimation = [[NSArray alloc] initWithObjects:
//    [UIImage imageNamed:@"bao1.gif"], [UIImage imageNamed:@"bao2.gif"], nil];
//    image.animationImages = hopAnimation;
//    image.animationDuration = 5;
//    [image startAnimating];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"强行假装有内容";
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
