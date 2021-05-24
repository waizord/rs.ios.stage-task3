#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSMutableArray * result = [NSMutableArray new];
    NSInteger countResult = 0;
    
    if (ratingArray.count < 3) {
        return 0;
    }
    
    for (int i = 0; i < ratingArray.count - 2; i++) { 
        NSLog(@"Value index i -> %i", i);
        [result addObject:ratingArray[i]];
        
        for (int j = i + 1; j < ratingArray.count - 1; j++) {
            NSLog(@"Value index j -> %i", j);
            if ([ratingArray[i] integerValue] < [ratingArray[j] integerValue]) {
                
                [result addObject:ratingArray[j]];
                
                for (int k = j + 1; k < ratingArray.count; k++) {
                    NSLog(@"Value index k -> %i", k);
                    if ([ratingArray[j] integerValue] < [ratingArray[k] integerValue]) {
                        [result addObject:ratingArray[k]];
                        if (result.count == 3) {
                            NSLog(@"Array -> %@", result);
                            countResult++;
                            [result removeLastObject];
                        }
                    }
                }
                [result removeLastObject];
                
            } else {
                if ([ratingArray[i] integerValue] > [ratingArray[j] integerValue]) {
                    
                    [result addObject:ratingArray[j]];
                    
                    for (int k = j + 1; k < ratingArray.count; k++) {
                        NSLog(@"Value index k -> %i", k);
                        if ([ratingArray[j] integerValue] > [ratingArray[k] integerValue]) {
                            [result addObject:ratingArray[k]];
                            if (result.count == 3) {
                                NSLog(@"Array -> %@", result);
                                countResult++;
                                [result removeLastObject];
                                
                            }
                        }
                    }
                    [result removeLastObject];
                }
            }
        }
        [result removeLastObject];
    }
    NSLog(@"Result count -> %lu", countResult);
    
    return countResult;
}

@end
