//
//  AppDelegate.m
//  Kal Kya Pakaye
//
//  Created by Tommy Sadiq Hinrichsen on 06/03/14.
//  Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import "AppDelegate.h"
#import "Dish.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//
//    NSString *startData = [documentsDirectory stringByAppendingPathComponent:@"dishes.json"];
//    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:startData];
//
//    if (!fileExists) {
//        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"dishes" ofType:@"json"];
//        NSArray *dishes = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath] options:kNilOptions error:nil];
//
//        [dishes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//            Dish *dish = [NSEntityDescription insertNewObjectForEntityForName:@"Dish" inManagedObjectContext:self.managedObjectContext];
//            dish.name = [obj objectForKey:@"name"];
//            dish.categori = [obj objectForKey:@"categori"];
//            dish.rice = [NSNumber numberWithBool:[obj objectForKey:@"rice"]];
//            dish.roti = [NSNumber numberWithBool:[obj objectForKey:@"roti"]];
//            dish.weekend = [NSNumber numberWithBool:[obj objectForKey:@"weekend"]];
//
//            NSError *error;
//            if (![self.managedObjectContext save:&error]) {
//                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//            }
//        }];
//
//        [[NSFileManager defaultManager] copyItemAtPath:dataPath toPath:documentsDirectory error:nil];
//
//        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:self.managedObjectContext];
//
//        [fetchRequest setEntity:entity];
//        NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
//        for (Dish *info in fetchedObjects) {
//            NSLog(@"Name: %@", info.name);
//        }
//    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"appClosing" object:nil userInfo:nil];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Kal_Kya_Pakaye" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }

    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Kal_Kya_Pakaye.sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];


//    if (![fileManager fileExistsAtPath:[storeURL absoluteString]]) {
//        NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:@"Kal_Kya_Pakaye" ofType:@"sqlite"];
//        if (defaultStorePath) {
//            [fileManager copyItemAtPath:defaultStorePath toPath:storeURL error:NULL];
//        }
//    }

    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSDictionary *options = @{NSSQLitePragmasOption : @{@"journal_mode" : @"DELETE"}};

    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
