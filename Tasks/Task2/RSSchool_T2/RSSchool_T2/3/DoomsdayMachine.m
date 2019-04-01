#import "DoomsdayMachine.h"


@interface AssimilationInfoWrapper: NSObject <AssimilationInfo>


@property (nonatomic, readonly) NSString *dateString;
@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;


@end

@implementation AssimilationInfoWrapper

- (id)init{
    [super init];
    return self;
}

- (id) initWithYears: (NSUInteger) years Months: (NSUInteger) months Days: (NSInteger) days Hours: (NSUInteger) hours Minutes: (NSUInteger) minutes Seconds: (NSUInteger) seconds aDate : (NSString*) date {
    
    if (self = [super init]) {
        _years = years;
        _months = months;
        _days = days;
        _hours = hours;
        _minutes = minutes;
        _seconds = seconds;
        _dateString = date;
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}


@end

@implementation DoomsdayMachine



- (NSString *)doomsdayString;
{
    NSString *doom = @"2208:08:14@37\\13/3";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy:MM:dd@mm\\ss/HH"];
    NSDate *date = [formatter dateFromString:doom];
    [formatter setDateFormat:@"EEEE, MMMM dd, yyyy"];
    NSString* HumansDate = [formatter stringFromDate:date];
   
    return HumansDate;
}



- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    
    NSString *doom = @"2208:08:14@37\\13/3";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy:MM:dd@mm\\ss/HH"];
    NSDate *dateEnd = [formatter dateFromString:doom];
    NSDate *dateBegin = [formatter dateFromString:dateString];
    NSTimeInterval interval = [dateEnd timeIntervalSinceDate:dateBegin];
    NSLog(@"time interval:%f", interval);
    
   
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
   
    NSCalendarUnit unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *breakdownInfo = [sysCalendar components:unitFlags fromDate:dateBegin  toDate:dateEnd  options:0];
    
    
    id <AssimilationInfo> info = [[[AssimilationInfoWrapper alloc] initWithYears:[breakdownInfo year] Months:[breakdownInfo month] Days:[breakdownInfo day] Hours:[breakdownInfo hour] Minutes:[breakdownInfo minute] Seconds:[breakdownInfo second] aDate : dateString] autorelease];
    
    return info;
}

@end
