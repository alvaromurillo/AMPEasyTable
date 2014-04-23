//
//  AMPEasyTableViewCell.h
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPEasyTableViewCell : UITableViewCell

@property (nonatomic, readonly) BOOL dynamicHeight;
@property (nonatomic, copy) void (^onEvent)(NSInteger event, NSObject *eventData);

- (void)configureCellWithData:(NSObject *)data;

@end
