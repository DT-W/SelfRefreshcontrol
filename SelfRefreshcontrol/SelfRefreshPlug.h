//
//  SelfRefreshPlug.h
//  SelfRefreshcontrol
//
//  Created by 魏大同 on 15/11/16.
//  Copyright © 2015年 魏大同. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
typedef enum{
    SelfRefreshPulling = 0,
    SelfRefreshNormal,
    SelfRefreshLoading,
} SelfRefreshState;


@protocol SelfRefreshPlugDelegate;

@interface SelfRefreshPlug : UIView{
    id _delegate;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *refreshlabel;
    UIImageView *gifImageV;
    //UIScrollView *scrollView;
}
@property (nonatomic,strong) id <SelfRefreshPlugDelegate> delegate;
-(void)SelfRefreshScrollViewDidEndDraging:(UIScrollView *)scrollView;
-(void)SelfRefreshScrollViewDidFinishedLoading:(UIScrollView *)scrollView;
-(void)EndRefresh:(UIScrollView *)scrollView;
@end
