// The MIT License (MIT)
//
// Copyright (c) 2015-2016 sdkdimon ( https://github.com/sdkdimon )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "NSDictionary+LinqExtensions.h"

@implementation NSDictionary (QueryExtension)

- (NSDictionary *)linq_where:(LINQKeyValueCondition)predicate
{
    NSMutableDictionary* result = [[NSMutableDictionary alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (predicate(key, obj)) {
            [result setObject:obj forKey:key];
        }
    }];
    return result;
}

- (NSDictionary *)linq_select:(LINQKeyValueSelector)selector
{
    NSMutableDictionary* result = [[NSMutableDictionary alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id object = selector(key, obj);
        if (!object)
            object = [NSNull null];
        
        [result setObject:object forKey:key];
    }];
    return result;
}

- (NSArray *)linq_toArray:(LINQKeyValueSelector)selector
{
    NSMutableArray* result = [[NSMutableArray alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id object = selector(key, obj);
        if (!object)
            object = [NSNull null];
        [result addObject:object];
    }];
    return result;
}

- (BOOL)linq_all:(LINQKeyValueCondition)condition
{
    __block BOOL all = TRUE;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (!condition(key, obj)){
            all = FALSE;
            *stop = TRUE;
        }
    }];
    return all;
}

- (BOOL)linq_any:(LINQKeyValueCondition)condition
{
    __block BOOL any = FALSE;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (condition(key, obj)){
            any = TRUE;
            *stop = TRUE;
        }
    }];
    return any;
}

- (NSUInteger)linq_count:(LINQKeyValueCondition)condition
{
    return [self linq_where:condition].count;
}

- (NSDictionary *)linq_Merge:(NSDictionary *)dictionary
{
    NSMutableDictionary* result = [[NSMutableDictionary alloc] initWithDictionary:self];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![result objectForKey:key]) {
            [result setObject:obj forKey:key];
        }
    }];
    return result;
}

@end
