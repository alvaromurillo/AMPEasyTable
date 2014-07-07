//
//  AMPEasyTable.m
//  AMPEasyTableExample
//
//  Created by Álvaro Murillo del Puerto on 23/04/14.
//  Copyright (c) 2014 Álvaro Murillo del Puerto. All rights reserved.
//

#import "AMPEasyTable.h"

@interface AMPEasyTable () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *cellPrototypes;

@end

@implementation AMPEasyTable

+ (instancetype)easyTableWithTableView:(UITableView *)tableView {
	
	AMPEasyTable *instance = [self new];
	[instance setTableView:tableView];
	
	return instance;
}

- (id)initWithTableView:(UITableView *)tableView {
	
	self = [super init];
	
	if (!self) {
		return nil;
	}
	
	self.tableView = tableView;
	
	return self;
}

- (void)registerNibNamesAsIdentifiers:(NSArray *)nibNames {
	
	for (NSString *nibName in nibNames) {
		
		UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
		
		[self.tableView registerNib:nib forCellReuseIdentifier:nibName];
	}
}

- (NSMutableDictionary *)cellPrototypes {
	
	if (!_cellPrototypes) {
		_cellPrototypes = [NSMutableDictionary dictionary];
	}
	
	return _cellPrototypes;
}

- (void)setTableView:(UITableView *)tableView {
	
	_tableView = tableView;
	
	if (tableView) {
		tableView.dataSource = self;
		tableView.delegate = self;
	}
}

#pragma mark – UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if (self.numberOfRowsInSection) {
		return self.numberOfRowsInSection(tableView, section);
	} else {
		return 0;
	}
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSAssert(self.identifierForCellAtIndexPath, @"AMPEasyTable: The identifierForCellAtIndexPath property must contain a non-nil value");
	
	NSString *identifier = self.identifierForCellAtIndexPath(tableView, indexPath);
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (self.configureCellAtIndexPath) {
		self.configureCellAtIndexPath(tableView, cell, indexPath);
	}
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	if (self.numberOfSections) {
		return self.numberOfSections(tableView);
	} else {
		return 1;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if (self.titleForHeaderInSection) {
		return self.titleForHeaderInSection(tableView, section);
	} else {
		return nil;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	
	if (self.titleForFooterInSection) {
		return self.titleForFooterInSection(tableView, section);
	} else {
		return nil;
	}
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.canEditRowAtIndexPath) {
		return self.canEditRowAtIndexPath(tableView, indexPath);
	} else {
		return NO;
	}
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.canMoveRowAtIndexPath) {
		return self.canMoveRowAtIndexPath(tableView, indexPath);
	} else {
		return NO;
	}
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	
	if (self.sectionIndexTitles) {
		return self.sectionIndexTitles(tableView);
	} else {
		return nil;
	}
	
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
	
	if (self.sectionForSectionIndexTitle) {
		return self.sectionForSectionIndexTitle(tableView, title, index);
	} else {
		return 0;
	}
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.commitEditingStyle) {
		self.commitEditingStyle(tableView, editingStyle, indexPath);
	}
	
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
	
	if (self.moveRowAtIndexPath) {
		self.moveRowAtIndexPath(tableView, sourceIndexPath, destinationIndexPath);
	}
}

#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.willDisplayCellForRowAtIndexPath) {
		self.willDisplayCellForRowAtIndexPath(tableView, cell, indexPath);
	}
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
	
	if (self.willDisplayHeaderViewForSection) {
		self.willDisplayHeaderViewForSection(tableView, view, section);
	}
	
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
	
	if (self.willDisplayFooterViewForSection) {
		self.willDisplayFooterViewForSection(tableView, view, section);
	}
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
	
	if (self.didEndDisplayingCellForRowAtIndexPath) {
		self.didEndDisplayingCellForRowAtIndexPath(tableView, cell, indexPath);
	}
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
	
	if (self.didEndDisplayingHeaderViewForSection) {
		self.didEndDisplayingHeaderViewForSection(tableView, view, section);
	}
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
	
	if (self.didEndDisplayingFooterViewForSection) {
		self.didEndDisplayingFooterViewForSection(tableView, view, section);
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	CGFloat height = 44.0;
	
	if (self.heightForRowAtIndexPath) {
		
		height = self.heightForRowAtIndexPath(tableView, indexPath);
		
	} else {
		
		NSAssert(self.identifierForCellAtIndexPath, @"AMPEasyTable: The identifierForCellAtIndexPath property must contain a non-nil value");
		
		NSString *identifier = self.identifierForCellAtIndexPath(tableView, indexPath);
		UITableViewCell *cell = [self.cellPrototypes objectForKey:identifier];
		
		if (!cell) {
			
			cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
			
			[self.cellPrototypes setObject:cell forKey:identifier];
		}
		
		if ([cell conformsToProtocol:@protocol(AMPEasyTableViewCell)] && ((UITableViewCell<AMPEasyTableViewCell> *)cell).dynamicHeight && self.configureCellAtIndexPath) {
			
			self.configureCellAtIndexPath(tableView, cell, indexPath);
			
			[cell layoutIfNeeded];
			
			height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
			
			// Add cell separator point
			height = height + 1;
			
		} else {
			height = cell.frame.size.height;
		}
	}
	
	return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
	if (self.heightForHeaderInSection) {
		return self.heightForHeaderInSection(tableView, section);
	} else {
		return 0.0;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	
	if (self.heightForFooterInSection) {
		return self.heightForFooterInSection(tableView, section);
	} else {
		return 0.0;
	}
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	
	if (self.viewForHeaderInSection) {
		return self.viewForHeaderInSection(tableView, section);
	} else {
		return nil;
	}
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	
	if (self.viewForFooterInSection) {
		return self.viewForFooterInSection(tableView, section);
	} else {
		return nil;
	}
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	if (self.accessoryButtonTappedForRowWithIndexPath) {
		self.accessoryButtonTappedForRowWithIndexPath(tableView, indexPath);
	}
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.shouldHighlightRowAtIndexPath) {
		return self.shouldHighlightRowAtIndexPath(tableView, indexPath);
	} else {
		return YES;
	}
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.didHighlightRowAtIndexPath) {
		self.didHighlightRowAtIndexPath(tableView, indexPath);
	}
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.didUnhighlightRowAtIndexPath) {
		self.didUnhighlightRowAtIndexPath(tableView, indexPath);
	}
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.willSelectRowAtIndexPath) {
		return self.willSelectRowAtIndexPath(tableView, indexPath);
	} else {
		return indexPath;
	}
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.willDeselectRowAtIndexPath) {
		return self.willDeselectRowAtIndexPath(tableView, indexPath);
	} else {
		return indexPath;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.didSelectRowAtIndexPath) {
		self.didSelectRowAtIndexPath(tableView, indexPath);
	}
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.didDeselectRowAtIndexPath) {
		self.didDeselectRowAtIndexPath(tableView, indexPath);
	}
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.editingStyleForRowAtIndexPath) {
		return self.editingStyleForRowAtIndexPath(tableView, indexPath);
	} else {
		return UITableViewCellEditingStyleDelete;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.titleForDeleteConfirmationButtonForRowAtIndexPath) {
		return self.titleForDeleteConfirmationButtonForRowAtIndexPath(tableView, indexPath);
	} else {
		return nil;
	}
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.shouldIndentWhileEditingRowAtIndexPath) {
		return self.shouldIndentWhileEditingRowAtIndexPath(tableView, indexPath);
	} else {
		return YES;
	}
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.willBeginEditingRowAtIndexPath) {
		self.willBeginEditingRowAtIndexPath(tableView, indexPath);
	}
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.didEndEditingRowAtIndexPath) {
		self.didEndEditingRowAtIndexPath(tableView, indexPath);
	}
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
	
	if (self.targetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath) {
		return self.targetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath(tableView, sourceIndexPath, proposedDestinationIndexPath);
	} else {
		return proposedDestinationIndexPath;
	}
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.indentationLevelForRowAtIndexPath) {
		return self.indentationLevelForRowAtIndexPath(tableView, indexPath);
	} else {
		return 0;
	}
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.shouldShowMenuForRowAtIndexPath) {
		return self.shouldShowMenuForRowAtIndexPath(tableView, indexPath);
	} else {
		return NO;
	}
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
	if (self.canPerformActionForRowAtIndexPathWithSender) {
		return self.canPerformActionForRowAtIndexPathWithSender(tableView, action, indexPath, sender);
	} else {
		return NO;
	}
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
	if (self.performActionForRowAtIndexPathWithSender) {
		self.performActionForRowAtIndexPathWithSender(tableView, action, indexPath, sender);
	}
}

#pragma mark – UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.scrollViewDidScroll) {
        self.scrollViewDidScroll(scrollView);
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    if (self.scrollViewDidZoom) {
        self.scrollViewDidZoom(scrollView);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (self.scrollViewWillBeginDragging) {
        self.scrollViewWillBeginDragging(scrollView);
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    if (self.scrollViewWillEndDraggingWithVelocityTargetContentOffset) {
        self.scrollViewWillEndDraggingWithVelocityTargetContentOffset(scrollView, velocity, targetContentOffset);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (self.scrollViewDidEndDraggingWillDecelerate) {
        self.scrollViewDidEndDraggingWillDecelerate(scrollView, decelerate);
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
    if (self.scrollViewWillBeginDecelerating) {
        self.scrollViewWillBeginDecelerating(scrollView);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (self.scrollViewDidEndDecelerating) {
        self.scrollViewDidEndDecelerating(scrollView);
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    if (self.scrollViewDidEndScrollingAnimation) {
        self.scrollViewDidEndScrollingAnimation(scrollView);
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    if (self.viewForZoomingInScrollView) {
        return self.viewForZoomingInScrollView(scrollView);
    } else {
        return nil;
    }
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    
    if (self.scrollViewWillBeginZoomingWithView) {
        self.scrollViewWillBeginZoomingWithView(scrollView, view);
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    
    if (self.scrollViewDidEndZoomingWithViewAtScale) {
        self.scrollViewDidEndZoomingWithViewAtScale(scrollView, view, scale);
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    
    if (self.scrollViewShouldScrollToTop) {
        return self.scrollViewShouldScrollToTop(scrollView);
    } else {
        return YES;
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    
    if (self.scrollViewDidScrollToTop) {
        self.scrollViewDidScrollToTop(scrollView);
    }
}

@end
