//
//  ListTableViewController.h
//  SelfRefreshcontrol
//
//  Created by 魏大同 on 15/11/16.
//  Copyright © 2015年 魏大同. All rights reserved.
//
#import "SelfRefreshPlug.h"
#import <UIKit/UIKit.h>

@interface ListTableViewController : UITableViewController<UITableViewDelegate>
@property (nonatomic,strong)SelfRefreshPlug *selfRefreshPlugView;
@end
