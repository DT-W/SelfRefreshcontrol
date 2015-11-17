//
//  SelfRefreshPlug.m
//  SelfRefreshcontrol
//
//  Created by 魏大同 on 15/11/16.
//  Copyright © 2015年 魏大同. All rights reserved.
//

#import "SelfRefreshPlug.h"

@interface SelfRefreshPlug (Private)
-(void)setState:(SelfRefreshState)aState;
@end

@implementation SelfRefreshPlug
@synthesize delegate=_delegate;

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        gifImageV = [[UIImageView alloc] initWithFrame:CGRectMake(110, -10, 80, 80)];
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
        gifImageV.animationImages = gifArray; //动画图片数组
        gifImageV.animationDuration = 3; //执行一次完整动画所需的时长
        gifImageV.animationRepeatCount = MAXFLOAT;  //动画重复次数
        
        //[self.view addSubview:gifImageView];
        
        refreshlabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 100, 60)];
        refreshlabel.text = @"下拉刷新";
        refreshlabel.textColor = [UIColor orangeColor];

        label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, -30, 100, 30)];
        label1.text = @"刷新此页面需要";
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(220, -10, 90, 30)];
        label2.text = @"预计需要";
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(200, 30, 90, 20)];
        label3.text = @"一年";
        label3.font = [UIFont systemFontOfSize:30];
        label3.textColor = [UIColor redColor];
        
        [self addSubview:gifImageV];
        [self addSubview:label1];
        [self addSubview:label2];
        [self addSubview:label3];
        [self addSubview:refreshlabel];
        
        gifImageV.hidden = NO;
        label1.hidden = YES;
        label2.hidden = YES;
        label3.hidden = YES;
        refreshlabel.hidden = YES;


    }
    return self;
}
//
//- (void)setState:(SelfRefreshState)aState{
//    
//    switch (aState) {
//        case SelfRefreshPulling:
//            
//            break;
//        case SelfRefreshNormal:
//            
//            if (aState == SelfRefreshPulling) {
//                
//            }
//            
//            
//            break;
//        case SelfRefreshLoading:
//            [gifImageV startAnimating];
//            gifImageV.hidden = NO;
//            
//            break;
//        default:
//            break;
//    }
//    
//   }


-(void)SelfRefreshScrollViewDidEndDraging:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y <= -140)
    {
        gifImageV.hidden = NO;
        label1.hidden = NO;
        label2.hidden = NO;
        label3.hidden = NO;
        refreshlabel.hidden = YES;
        [gifImageV startAnimating];
        [scrollView setContentInset:UIEdgeInsetsMake(164, 0, 0, 0)];
        

    }else{
        gifImageV.hidden = YES;
        label1.hidden = YES;
        label2.hidden = YES;
        label3.hidden = YES;
        refreshlabel.hidden = NO;
    }
}

-(void) EndRefresh:(UIScrollView*)scrollView{
    
        gifImageV.hidden = YES;
        label1.hidden = YES;
        label2.hidden = YES;
        label3.hidden = YES;
        refreshlabel.hidden = NO;
        [scrollView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];

    
    

}
@end
