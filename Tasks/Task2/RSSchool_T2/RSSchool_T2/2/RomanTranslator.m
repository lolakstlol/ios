#import "RomanTranslator.h"

@implementation RomanTranslator
- (NSString *)romanFromArabic:(NSString *)arabicString {
//    NSDictionary *dictionaryOfRoman = @{
//                                        @"1" : @"I",
//                                        @"2" : @"II",
//                                        @"3" : @"III",
//                                        @"4" : @"IV",
//                                        @"5" : @"V",
//                                        @"6" : @"VI",
//                                        @"7" : @"VII",
//                                        @"8" : @"VIII",
//                                        @"9" : @"IX",
//                                        @"10" : @"X",
//                                        @"40" : @"XL",
//                                        @"50" : @"L",
//                                        @"60" : @"LX",
//                                        @"90" : @"XC",
//                                        @"100" : @"C",
//                                        @"400" : @"CD",
//                                        @"500" : @"D",
//                                        @"600" : @"DC",
//                                        @"900" : @"CM",
//                                        @"1000" : @"M"
//                                        };
//    NSNumber * num = [NSNumber numberWithInteger:[arabicString integerValue]];
//    NSMutableArray* raz = [[NSMutableArray alloc] init];
//
//
//    [raz addObject: [NSNumber numberWithInteger:[num integerValue] / 1000]];
//    num = [NSNumber numberWithInteger:[num integerValue] - 1000 * [raz[0] integerValue]];
//
//    [raz addObject: [NSNumber numberWithInteger:[num integerValue] / 100]];
//    num = [NSNumber numberWithInteger:[num integerValue] - 100 * [raz[1] integerValue]];
//
//    [raz addObject: [NSNumber numberWithInteger:[num integerValue] / 10]];
//    num = [NSNumber numberWithInteger:[num integerValue] - 10 * [raz[2] integerValue]];
//
//    [raz addObject: [NSNumber numberWithInteger:[num integerValue] / 1]];
//    num = [NSNumber numberWithInteger:[num integerValue] - 1 * [raz[3] integerValue]];
//
    NSArray* arabic = @[@1000,@900,@500,@400,@100,@90,@50,@40,@10,@9,@5,@4,@1];
    //https://www.freecodecamp.org/forum/t/freecodecamp-algorithm-challenge-guide-roman-numeral-converter/16044
    NSArray* roman = @[@"M",@"CM",@"D",@"CD",@"C",@"XC",@"L",@"XL",@"X",@"IX",@"V",@"IV",@"I"];
    
    NSMutableArray *ResultRoman = [[NSMutableArray alloc] init];
    
    NSNumber * num = [NSNumber numberWithInteger:[arabicString integerValue]];
    
    for (NSInteger i = 0; i < [arabic count]; i++) {
        while ([arabic[i] integerValue] <= [num integerValue]) {
            [ResultRoman addObject:roman[i]];
            num = [NSNumber numberWithInteger:[num integerValue] - [arabic[i] integerValue] ];
        }
    }
    
    NSString *result = [ResultRoman componentsJoinedByString:@""];
    [ResultRoman release];
    return result;
}



- (NSString *)arabicFromRoman:(NSString *)romanString {
    NSDictionary *dictionaryOfRoman = @{
                                        @"I" : @"1",
                                        @"V" : @"5",
                                        @"X" : @"10",
                                        @"L" : @"50",
                                        @"C" : @"100",
                                        @"D" : @"500",
                                        @"M" : @"1000"
                                        };
    NSMutableArray *arabNums = [NSMutableArray new];
    for (NSInteger i = 0; i < [romanString length]; i++) {
        NSString *charr = [romanString substringWithRange:NSMakeRange(i, 1)]; //[arabicString substringToIndex:i];
        NSString *room = [dictionaryOfRoman valueForKey:charr];
        [arabNums addObject: room];
    }
    NSMutableArray *arrayOfNumbers = [arabNums valueForKey:@"intValue"];
    [arabNums release];
    NSInteger result = 0;
    for (NSInteger i = 1; i <= [arrayOfNumbers count] - 1; i++) {
        if (arrayOfNumbers[i] <= arrayOfNumbers[i - 1]) {
            if (i == [arrayOfNumbers count] - 1) {
            result += [arrayOfNumbers[i] integerValue];
            result += [arrayOfNumbers[i - 1] integerValue];
            } else{
            result += [arrayOfNumbers[i - 1] integerValue];
            }
                       } else
                       {
                           result = result + [arrayOfNumbers[i] integerValue] - [arrayOfNumbers[i - 1] integerValue];
                           i++;
                        }
        }
    NSString *retres = [NSString stringWithFormat:@"%ld",result];
    return retres;
}
@end
