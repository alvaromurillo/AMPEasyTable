//
//  TypeACell.h
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMPEasyTable.h"

@interface TypeACell : UITableViewCell <AMPEasyTableViewCell>

@property (nonatomic, readonly) BOOL dynamicHeight;

- (void)configureCellWithData:(NSObject *)data;

@property (nonatomic, copy) void (^onEvent)(NSInteger event, NSObject *eventData);

@end
