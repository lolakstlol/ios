#import "ArrayPrint.h"


@implementation NSArray (fooo_Name)

- (NSString *)print {
    NSDictionary *types = @{
                                  @"__NSSingleObjectArrayI": @1,
                                  @"__NSCFNumber": @2,
                                  @"__NSArray0": @1,
                                  @"__NSArrayI": @1,
                                  @"NSNull": @3,
                                  @"__NSCFConstantString": @4
                                  };
    
    NSString* result = @"[";
    
    
    if ([self count] == 0) {
        return @"[]";
    }
    
    
    for (NSInteger i = 0 ; i < [self count] ; i++) {
    NSString *className = NSStringFromClass([self[i] class]);
        switch ([[types valueForKey:className] integerValue]) {
            case 1:
                if (i + 1 == [self count]) {
                 result = [result stringByAppendingString:[self[i]print]];
                } else
                {
                    result = [result stringByAppendingString:[self[i]print]];
                    result = [result stringByAppendingString:@","];
                }
                
                break;
            case 2:
                if ([self[i] isKindOfClass:[NSNumber class]]) {
                    if (i + 1 == [self count]) {
                        NSInteger questionId = [self[i] integerValue];
                        NSString *string = [NSString stringWithFormat:@"%ld", (long)questionId];
                        result = [result stringByAppendingString:string];
                    } else {
                    NSInteger questionId = [self[i] integerValue];
                    NSString *string = [NSString stringWithFormat:@"%ld", (long)questionId];
                    result = [result stringByAppendingString:string];
                    result = [result stringByAppendingString:@","];
                }
                }
                break;
            case 3:
                if (i + 1 == [self count]) {
                   result = [result stringByAppendingString:@"null"];
                } else {
                   result = [result stringByAppendingString:@"null"];
                   result = [result stringByAppendingString:@","];
                }
                
                break;
            case 4:
                if (i + 1 == [self count]) {
                    NSString *str = [NSString stringWithFormat:@"\"%@\"",self[i]];
                    result = [result stringByAppendingString:str];
                } else
                {
                   // result = [result stringByAppendingString:@"\""];
                   // result = [result stringByAppendingString:self[i]];
                  //  result = [result stringByAppendingString:@"\""];
                    
                    NSString *str = [NSString stringWithFormat:@"\"%@\"",self[i]];
                    result = [result stringByAppendingString:str];
                    result = [result stringByAppendingString:@","];
                   
                    
                }
                break;
                
            default:
                if (i + 1 == [self count]) {
                      result = [result stringByAppendingString:@"unsupported"];
                } else
                {
                      result = [result stringByAppendingString:@"unsupported"];
                      result = [result stringByAppendingString:@","];
                }
                break;
        }
        
        
    }
    result = [result stringByAppendingString:@"]"];
    return result;
}

@end


@implementation ArrayPrint : NSObject


@end
