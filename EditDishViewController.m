//
//  EditDishViewController.m
//  Kal Kya Pakaye
//
//  Created by Tommy Sadiq Hinrichsen on 07/03/14.
//  Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import "EditDishViewController.h"
#import "AppDelegate.h"

@interface EditDishViewController ()

@end

@implementation EditDishViewController

@synthesize dish = _dish;

BOOL creatingNew = NO;

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

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    creatingNew = NO;
    Dish *item = self.dish;

    if (item) {
        [self setupForEditing:item];
    } else {
        [self setupForNew];
    }


}

- (void)setupForEditing:(Dish *)item {

    self.name.text = item.name;
    [self.rice setOn:item.rice.boolValue animated:NO];
    [self.roti setOn:item.roti.boolValue animated:NO];
    [self.weekend setOn:item.weekend.boolValue animated:NO];

    static NSDateFormatter *dateFormatter = nil;

    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    // Use filtered NSDate object to set dateLabel contents
    self.lastUsed.text = [dateFormatter stringFromDate:item.lastUsed];
}

- (void)setupForNew {
    creatingNew = YES;
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonSystemItemSave target:self action:@selector(saveRecipe)];
    self.navigationItem.rightBarButtonItem = anotherButton;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // Clear first responder
    [self.view endEditing:YES];

    if (creatingNew) {
        // "Save" changes to item
        Dish *item = self.dish;
        item.name = self.name.text;
        item.rice = [NSNumber numberWithBool:self.rice.isOn];
        item.roti = [NSNumber numberWithBool:self.roti.isOn];
        item.weekend = [NSNumber numberWithBool:self.weekend.isOn];
    }
}

- (void)saveRecipe {

    NSManagedObject *item = [NSEntityDescription insertNewObjectForEntityForName:@"Dish" inManagedObjectContext:self.managedObjectContext];
    [item setValue:self.name.text forKey:@"name"];
    [item setValue:[NSNumber numberWithBool:self.rice.isOn] forKey:@"rice"];
    [item setValue:[NSNumber numberWithBool:self.roti.isOn] forKey:@"roti"];
    [item setValue:[NSNumber numberWithBool:self.weekend.isOn] forKey:@"weekend"];

    self.name.text = @"";
    [self.rice setOn:NO animated:NO];
    [self.roti setOn:NO animated:NO];
    [self.weekend setOn:NO animated:NO];
    NSError *error;

    [self.managedObjectContext save:&error];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setDish:(Dish *)dish {
    _dish = dish;
    self.navigationItem.title = _dish.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]])
            [view resignFirstResponder];
    }
}


@end
