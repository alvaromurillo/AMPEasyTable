//
//  ViewController.m
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import "ViewController.h"
#import "AMPEasyTable.h"
#import "CellAData.h"
#import "CellBData.h"
#import "CellCData.h"

@interface ViewController ()

@property (nonatomic, strong) AMPEasyTable *easyTable;
@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self loadTableItems];
	[self configureTableView];
	
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
	
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – Class Methods

- (void)configureTableView {
	
	self.easyTable = [AMPEasyTable easyTableWithTableView:self.tableView];
	
	[self.easyTable registerNibNamesAsIdentifiers:@[@"TypeBCell", @"TypeCCell"]];
	
	__weak typeof(self)weakSelf = self;
	
	[self.easyTable setNumberOfRowsInSection:^NSInteger(UITableView *tableView, NSInteger section) {
		return weakSelf.items.count;
	}];
	
	[self.easyTable setIdentifierForCellAtIndexPath:^NSString *(UITableView *tableView, NSIndexPath *indexPath) {
		
		NSObject *item = weakSelf.items[indexPath.row];
		if ([item isKindOfClass:[CellAData class]]) {
			return @"TypeACell";
		} else if ([item isKindOfClass:[CellBData class]]) {
			return @"TypeBCell";
		} else {
			return @"TypeCCell";
		}
	}];
	
	[self.easyTable setConfigureCellAtIndexPath:^(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath) {
		
		NSObject *item = weakSelf.items[indexPath.row];
		
		[((AMPEasyTableViewCell *)cell) configureCellWithData:item];
		
		if ([item isKindOfClass:[CellBData class]]) {
			
			[((AMPEasyTableViewCell *)cell) setOnEvent:^(NSInteger event, NSObject *eventData) {
				
				[weakSelf showAlert];
				
			}];
		}
	}];
	
}

- (void)showAlert {
	
	[[[UIAlertView alloc] initWithTitle:@"Hi guy!"
								message:@"Have a nice day!"
							   delegate:nil
					  cancelButtonTitle:@"Thanks!"
					  otherButtonTitles:nil] show];
}

- (void)loadTableItems {
	
	CellAData *color1 = [CellAData new];
	color1.name = @"Red";
	color1.color = [UIColor redColor];
	
	CellAData *color2 = [CellAData new];
	color2.name = @"Green";
	color2.color = [UIColor greenColor];
	
	CellBData *how = [CellBData new];
	how.title = @"How";
	
	CellBData *are = [CellBData new];
	are.title = @"are";
	
	CellBData *you = [CellBData new];
	you.title = @"you?";
	
	CellCData *dynamicCell1 = [CellCData new];
	dynamicCell1.title = @"Long Title: Lorem ipsum dolor sit amet, consectetuer adipiscing elit.";
	dynamicCell1.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.";
	
	CellCData *dynamicCell2 = [CellCData new];
	dynamicCell2.title = @"Short Title";
	dynamicCell2.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,";
	
	self.items = @[dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2, dynamicCell1, how, color1, are, color2, you, dynamicCell2];
}

@end
