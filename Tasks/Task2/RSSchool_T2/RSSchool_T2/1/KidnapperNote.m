#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    
    NSMutableString* mutableMagaine = [[NSMutableString alloc] initWithString:magaine];
    NSMutableString* mutableNote = [[NSMutableString alloc] initWithString:note];
    
    mutableNote =  [mutableNote lowercaseString];
    mutableMagaine =  [mutableMagaine lowercaseString] ;
    
    NSMutableArray* wordsInMagaine = [[NSMutableArray alloc] init]; //
    NSMutableArray* wordsInNote = [[NSMutableArray alloc] init]; //
    wordsInMagaine = [magaine componentsSeparatedByString: @" "];
    wordsInNote = [mutableNote componentsSeparatedByString: @" "];
//    [mutableMagaine release];
//    [mutableNote release];
//На любые методы освобождения памяти у меня ловит Крээш, я их и перед return ставил, не знаю что делать
    
    for (NSInteger i = 0; i < [wordsInNote count] - 1; i++) {
        if ([wordsInMagaine containsObject: wordsInNote[i]]) {
            NSInteger ind = [wordsInMagaine indexOfObject:wordsInNote[i]];
            [wordsInMagaine removeObjectAtIndex:ind];
            continue;
        } else {
            return NO;
        }
    }
    return YES;
}
@end


