//
//  KalKyaPakayeViewController.h
//  Kal Kya Pakaye
//
//  Created by Tommy Sadiq Hinrichsen on 06/03/14.
//  Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface KalKyaPakayeViewController : UIViewController

@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)pickRandomRecipe:(id)sender;

- (void)reset;

@property(weak, nonatomic) IBOutlet UILabel *recipe;

@end
