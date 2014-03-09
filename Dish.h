//
//  Dish.h
//  Kal Kya Pakaye
//
//  Created by Tommy Sadiq Hinrichsen on 06/03/14.
//  Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Dish : NSManagedObject

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *categori;
@property(nonatomic, retain) NSNumber *rice;
@property(nonatomic, retain) NSNumber *roti;
@property(nonatomic, retain) NSNumber *weekend;
@property(nonatomic, retain) NSDate *lastUsed;

@end
