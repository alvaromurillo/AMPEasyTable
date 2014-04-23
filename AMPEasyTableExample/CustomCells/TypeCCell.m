//
//  TypeCCell.m
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import "TypeCCell.h"
#import "CellCData.h"

@interface TypeCCell ()

@property (nonatomic, strong) CellCData *data;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *longTextLabel;

@end

@implementation TypeCCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark – Class Methods

- (BOOL)dynamicHeight {
	
	return YES;
}

- (void)configureCellWithData:(CellCData *)data {
	
	self.data = data;
	
	if (data) {
		self.titleLabel.text = data.title;
		self.longTextLabel.text = data.text;
	}
}

@end
