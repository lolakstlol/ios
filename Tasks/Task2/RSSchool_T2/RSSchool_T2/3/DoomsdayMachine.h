#import <Foundation/Foundation.h>

@protocol AssimilationInfo <NSObject>
@property (nonatomic, readonly) NSString *dateString;
@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;
@end
@interface DoomsdayMachine : NSObject



- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString;
/**
 Returns a human-readable string of the assimilation date

 @return a human-readable string
 */
- (NSString *)doomsdayString;
@end
