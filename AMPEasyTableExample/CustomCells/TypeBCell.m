//
//  TypeBCell.m
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import "TypeBCell.h"
#import "CellBData.h"

@interface TypeBCell ()

@property (nonatomic, strong) CellBData *data;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@end

@implementation TypeBCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
	
	[super prepareForReuse];
	
	self.titleLabel.text = nil;
}

#pragma mark – Class Methods

- (IBAction)showAlert:(id)sender {
	
	if (self.onEvent) {
		self.onEvent(0, nil);
	}
}

- (void)configureCellWithData:(CellBData *)data {
	
	self.data = data;
	
	if (data) {
		
		self.titleLabel.text = data.title;
	}
}

@end
