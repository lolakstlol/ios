#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams: (NSString *)string {
    
    NSString *lowercasedString = [string lowercaseString];
    NSString *resultString = [lowercasedString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableArray* alphabet = [NSMutableArray new];
    for (char c = 'a'; c <= 'z'; c++) {
        NSString *alphabetLetterString = [NSString stringWithFormat:@"%c", c];
        [alphabet addObject: alphabetLetterString];
    }
    
    for (NSInteger i = 0; i <= [alphabet count] - 1; i++) {
        if ([resultString containsString: alphabet[i]]) {
            continue;
        } else {
            return NO;
        }
    }
    return YES;
}

@end
