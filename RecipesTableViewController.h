//
// Created by Tommy Sadiq Hinrichsen on 07/03/14.
// Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RecipesTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

- (IBAction)addRecipe:(id)sender;

- (void)toggleEditingMode;

@end
