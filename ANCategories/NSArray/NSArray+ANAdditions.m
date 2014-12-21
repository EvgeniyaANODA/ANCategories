//
//  NSArray+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 26/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "NSArray+ANAdditions.h"

@implementation NSArray (ANAdditions)

-(void)an_enumerateObjectsDrainingEveryIterations:(NSUInteger)iterationsBetweenDrains usingBlock:(void (^)(id object, NSUInteger index, BOOL *stop))block
{
    NSUInteger total = 0;
    NSUInteger count = self.count;
    NSUInteger numberOfChunks = (count / MAX(1,iterationsBetweenDrains) + 1);
    BOOL stop = NO;
    for ( NSUInteger chunk = 0; chunk < numberOfChunks; chunk++ ) {
        @autoreleasepool {
            for ( NSUInteger i = chunk*iterationsBetweenDrains; i < MIN(count, (chunk+1)*iterationsBetweenDrains); i++ ) {
                id object = self[i];
                block(object, total, &stop);
                if ( stop ) break;
                total++;
            }
        }
        if ( stop ) break;
    }
}

- (NSArray *)an_arrayByTransformingObjectsWithBlock:(id(^)(id))block
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (id object in self) {
        [result addObject:(block(object) ? : [NSNull null])];
    }
    return result;
}

- (id)an_objectAtIndex:(NSUInteger)index
{
    if (self.count > index)
    {
        return [self objectAtIndex:index];
    }
    else
    {
        NSLog(@"Array out of bounds!!!"); // TODO:log wrapper
        return nil;
    }
}

@end
