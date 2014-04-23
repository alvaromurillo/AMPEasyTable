//
//  TypeACell.m
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import "TypeACell.h"
#import "CellAData.h"

@interface TypeACell ()

@property (nonatomic, strong) CellAData *data;

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UIView *coloredView;

@end

@implementation TypeACell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

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
	
	self.nameLabel.text = nil;
	self.coloredView.backgroundColor = [UIColor whiteColor];
}

#pragma mark – Class Methods

- (void)configureCellWithData:(CellAData *)data {
	
	self.data = data;
	
	if (data) {
		self.nameLabel.text = data.name;
		self.coloredView.backgroundColor = data.color;
	}	
}


@end
