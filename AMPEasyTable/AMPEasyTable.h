//
//  AMPEasyTable.h
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMPEasyTableViewCell.h"

@interface AMPEasyTable : NSObject

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *(^identifierForCellAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^configureCellAtIndexPath)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath);

+ (instancetype)easyTableWithTableView:(UITableView *)tableView;

- (id)initWithTableView:(UITableView *)tableView;

- (void)registerNibNamesAsIdentifiers:(NSArray *)nibNames;

// UITableViewDataSource blocks
@property (nonatomic, copy) NSInteger (^numberOfRowsInSection)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) NSInteger (^numberOfSections)(UITableView *tableView);
@property (nonatomic, copy) NSString *(^titleForHeaderInSection)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) NSString *(^titleForFooterInSection)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) BOOL (^canEditRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) BOOL (^canMoveRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) NSArray *(^sectionIndexTitles)(UITableView *tableView);
@property (nonatomic, copy) NSInteger (^sectionForSectionIndexTitle)(UITableView *tableView, NSString *title, NSInteger index);
@property (nonatomic, copy) void (^commitEditingStyle)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^moveRowAtIndexPath)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);

// UITableViewDelegate blocks
@property (nonatomic, copy) void (^willDisplayCellForRowAtIndexPath)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^willDisplayHeaderViewForSection)(UITableView *tableView, UIView *view, NSInteger section);
@property (nonatomic, copy) void (^willDisplayFooterViewForSection)(UITableView *tableView, UIView *view, NSInteger section);
@property (nonatomic, copy) void (^didEndDisplayingCellForRowAtIndexPath)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didEndDisplayingHeaderViewForSection)(UITableView *tableView, UIView *view, NSInteger section);
@property (nonatomic, copy) void (^didEndDisplayingFooterViewForSection)(UITableView *tableView, UIView *view, NSInteger section);
@property (nonatomic, copy) CGFloat (^heightForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) CGFloat (^heightForHeaderInSection)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) CGFloat (^heightForFooterInSection)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) UIView *(^viewForHeaderInSection)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) UIView *(^viewForFooterInSection)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) void (^accessoryButtonTappedForRowWithIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) BOOL (^shouldHighlightRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didHighlightRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didUnhighlightRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) NSIndexPath *(^willSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) NSIndexPath *(^willDeselectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didDeselectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) UITableViewCellEditingStyle (^editingStyleForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) NSString *(^titleForDeleteConfirmationButtonForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) BOOL (^shouldIndentWhileEditingRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^willBeginEditingRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didEndEditingRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) NSIndexPath *(^targetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath);
@property (nonatomic, copy) NSInteger (^indentationLevelForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) BOOL (^shouldShowMenuForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) BOOL (^canPerformActionForRowAtIndexPathWithSender)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender);
@property (nonatomic, copy) void (^performActionForRowAtIndexPathWithSender)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender);

@end
