#import "Encryption.h"

@implementation Encryption

-(NSString *)encryption: (NSString *)string {
    
    NSString *clearString = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSUInteger rows = floor(sqrt([clearString length])); // округляем к ближайшему меньшему целому
    NSUInteger colums = ceil(sqrt([clearString length])); // к ближайшему большему
    if(rows *colums < [clearString length]) {
        rows++;
    }
    
    NSUInteger lengthOfLastRow = colums - ((rows * colums) - [clearString length]); // Длина последнего отрезка
    NSMutableArray *arrayTable = [NSMutableArray array];
    for (NSInteger i = 0 ; i < rows; i++) {
        if (i == rows - 1) {
            NSString *row = [clearString substringWithRange: NSMakeRange(i * colums, lengthOfLastRow)];
            [arrayTable addObject:row];
        } else {
            NSString *row = [clearString substringWithRange: NSMakeRange(i * colums, colums)];
            [arrayTable addObject:row];
        }
    }
    
    NSUInteger lastLineEmptySpacesNumber = rows * colums - [clearString length]; // кол-во пустых элементов в последней строке
    NSString *resultString = @"";
    for (NSInteger i = 0; i < colums; i++) {
        for (NSInteger y = 0; y < rows; y++) {
            if ((y == rows - 1) && (i >= colums - lastLineEmptySpacesNumber)) { // если строка последняя и элементов под такими индексами просто не будет, мы пропускаем итерацию
                continue; //Вообще тут мог быть бы Break, но пусть
            }
            NSString *theCharacter = [NSString stringWithFormat:@"%c", [arrayTable[y] characterAtIndex:i]];
            resultString = [resultString stringByAppendingString: theCharacter];
        }
        if (i != colums - 1) {
            resultString = [resultString stringByAppendingString: @" "];
        }
    }
    
    return resultString;
}

@end
