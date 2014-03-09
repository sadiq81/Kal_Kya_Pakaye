//
//  EditDishViewController.h
//  Kal Kya Pakaye
//
//  Created by Tommy Sadiq Hinrichsen on 07/03/14.
//  Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"

@interface EditDishViewController : UIViewController
@property(weak, nonatomic) IBOutlet UITextField *name;
@property(weak, nonatomic) IBOutlet UISwitch *rice;
@property(weak, nonatomic) IBOutlet UISwitch *roti;
@property(weak, nonatomic) IBOutlet UISwitch *weekend;
@property(weak, nonatomic) IBOutlet UILabel *lastUsed;

@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property(weak, nonatomic) Dish *dish;

- (void)saveRecipe;
@end
