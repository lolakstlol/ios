#import "Diagonal.h"
#import "SummArray.h"

@implementation Diagonal

// Complete the diagonalDifference function below.

- (NSNumber *)summArray: (NSArray *)array {
    
    NSInteger sum = 0;
    for (NSNumber *n in array) {
        sum += [n intValue];
    }
    NSNumber *myIntNumber = [NSNumber numberWithInteger: sum];
    
    return myIntNumber;
}

- (NSNumber *)diagonalDifference: (NSArray *)array {
    
    NSMutableArray *primaryDiagonalArray = [[NSMutableArray alloc] init];
    NSMutableArray *secondaryDiagonalArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i <= [array count] - 1; i++) {
        NSArray *recordArray = [array[i] componentsSeparatedByString:@" "];
        [primaryDiagonalArray addObject: [NSNumber numberWithInt: [recordArray[i] intValue]]];
        NSInteger secondaryDiagonalIndex = [array count] - i - 1;
        [secondaryDiagonalArray addObject: [NSNumber numberWithInt: [recordArray[secondaryDiagonalIndex] intValue]]];
    }
    
    NSNumber *first = [self summArray: primaryDiagonalArray];
    NSNumber *second = [self summArray: secondaryDiagonalArray];
    NSInteger result = abs(([first intValue] - [second intValue]));
    NSNumber *answer = @(result);
    
    return answer;
}

@end
