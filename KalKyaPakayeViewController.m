//
//  KalKyaPakayeViewController.m
//  Kal Kya Pakaye
//
//  Created by Tommy Sadiq Hinrichsen on 06/03/14.
//  Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import "KalKyaPakayeViewController.h"
#import "Dish.h"

@interface KalKyaPakayeViewController ()

@end

@implementation KalKyaPakayeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.managedObjectContext = [(AppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reset) name:@"appClosing" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pickRandomRecipe:(id)sender {

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];

    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"lastUsed" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *recipes = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    Dish *dish = [recipes objectAtIndex:arc4random() % [recipes count]];
    self.recipe.text = dish.name;


}

- (void)reset {
    self.recipe.text = nil;
}
@end
