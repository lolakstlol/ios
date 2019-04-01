#import <XCTest/XCTest.h>
#import "RomanTranslator.h"

@interface RomanTranslatorTests : XCTestCase
@property (nonatomic, retain) RomanTranslator *translator;
@end

@implementation RomanTranslatorTests

- (void)setUp {
  self.translator = [RomanTranslator new];
}

- (void)test1 {
  XCTAssertEqualObjects(@"III", [self.translator romanFromArabic:@"3"]);
}

- (void)test2 {
  XCTAssertEqualObjects(@"IV", [self.translator romanFromArabic:@"4"]);
}

- (void)test3 {
  XCTAssertEqualObjects(@"IX", [self.translator romanFromArabic:@"9"]);
}

- (void)test4 {
  XCTAssertEqualObjects(@"LVIII", [self.translator romanFromArabic:@"58"]);
}

- (void)test5 {
  XCTAssertEqualObjects(@"MCMXCIV", [self.translator romanFromArabic:@"1994"]);
}

- (void)test6 {
  XCTAssertEqualObjects(@"3", [self.translator arabicFromRoman:@"III"]);
}

- (void)test7 {
  XCTAssertEqualObjects(@"4", [self.translator arabicFromRoman:@"IV"]);
}

- (void)test8 {
  XCTAssertEqualObjects(@"9", [self.translator arabicFromRoman:@"IX"]);
}

- (void)test9 {
  XCTAssertEqualObjects(@"58", [self.translator arabicFromRoman:@"LVIII"]);
}

- (void)test10 {
  XCTAssertEqualObjects(@"1994", [self.translator arabicFromRoman:@"MCMXCIV"]);
}


@end
