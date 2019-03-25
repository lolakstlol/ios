#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

- (BOOL)isArrTrue: (NSMutableArray *)array {
    
    for (NSInteger i = 1; i < [array count]; i++) {
        if (array[i] < array[i - 1]) {
            return NO;
        }
    }
    
    return YES;
}

// Complete the sorted function below.
- (ResultObject *)sorted: (NSString *)string {
    
    ResultObject *value = [ResultObject new];
    value.status = NO;
    NSArray *arrayOfStr = [string componentsSeparatedByString:@" "];
    NSMutableArray *arrayOfNumbers = [arrayOfStr valueForKey:@"intValue"];
    
    NSInteger firstInd = 0;
    NSInteger secondInd = 0;
    //SWAP!
    for (NSInteger i = 1; i < [arrayOfNumbers count]; i++) {
        if (arrayOfNumbers[i] < arrayOfNumbers[firstInd]) {
            break;
        } else {
            firstInd++;
        }
    }
    
    if (firstInd == 0) {
        secondInd = 1; //Наверное это самый наглый кастыль ин зе ворлл
    } else {
        for (NSInteger i = 1; i < [arrayOfNumbers count]; i++){
            if (i == firstInd + 1) {
                continue;
            } else {
                if (arrayOfNumbers[i] < arrayOfNumbers[i - 1]) {
                    secondInd = i;
                    break;
                }
            }
        }
    }
    
    NSNumber *bigNum = arrayOfNumbers[firstInd];
    NSNumber *smallNum = arrayOfNumbers[secondInd];
    NSMutableArray *copyArray = [NSMutableArray arrayWithArray:arrayOfNumbers];
    copyArray[firstInd] = smallNum;
    copyArray[secondInd] = bigNum;
    
    if ([self isArrTrue: copyArray]) {
        NSString *fInd = [NSString stringWithFormat: @"%ld", firstInd + 1];
        NSString *sInd = [NSString stringWithFormat: @"%ld", secondInd + 1];
        value.status = YES;
        value.detail = [NSString stringWithFormat: @"%@ %@ %@", @"swap", fInd, sInd];
        return value;
    } else {
        // REVERSE HERE
        firstInd = 0;
        secondInd = 0;
        for (NSInteger i = [arrayOfNumbers count] - 2; i >= 0; i--) {
            if (arrayOfNumbers[i+1] < arrayOfNumbers[i]) {
                secondInd = i + 1;
                break;
            }
        }
        
        for (NSInteger i = 1; i < [arrayOfNumbers count]; i++) {
            if (arrayOfNumbers[i] < arrayOfNumbers[firstInd]) {
                break;
            } else {
                firstInd++;
            }
        }
        NSMutableArray *secondCopyArray = [NSMutableArray arrayWithArray: arrayOfNumbers];
        NSArray *replaceItems = [secondCopyArray subarrayWithRange: NSMakeRange(firstInd, secondInd-firstInd + 1)];
        NSArray *reverseReplaceItems = [[replaceItems reverseObjectEnumerator] allObjects];
        [secondCopyArray replaceObjectsInRange: NSMakeRange(firstInd, [reverseReplaceItems count])
                          withObjectsFromArray: (reverseReplaceItems)];
        if ([self isArrTrue: secondCopyArray]) {
            NSString *fInd = [NSString stringWithFormat:@"%ld", firstInd + 1];
            NSString *sInd = [NSString stringWithFormat:@"%ld", secondInd + 1];
            value.status = YES;
            value.detail = [NSString stringWithFormat: @"%@ %@ %@", @"reverse", fInd, sInd];
            return value;
        }
    }
    
    return value;
}

@end
