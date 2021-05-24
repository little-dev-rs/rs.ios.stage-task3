#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if ((0 < monthNumber) && (monthNumber < 13)) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        NSString *monthName = [[df monthSymbols] objectAtIndex:(monthNumber-1)];
        NSLog(@"month: %@", monthName);
        return monthName;
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *dateNSDate = [dateFormatter dateFromString: date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay) fromDate:dateNSDate];
    NSInteger day = [components day];
    
    return (long)day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"EEE MMM d HH:mm:ss ZZZ yyyy"];
    
    dateFormatter.dateFormat=@"EEE";
    NSString *dayString = [[dateFormatter stringFromDate:date] capitalizedString];
    return dayString;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    NSDate *dateInLocalTimezone = [date dateByAddingTimeInterval:timeZoneSeconds];
    NSLog(@"dateInLocalTimezone  %@", dateInLocalTimezone);
    
    //current week number
    NSDate *currentDate = [NSDate date];
    NSCalendar *myCalendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierISO8601];
    NSDateComponents *currentComps = [myCalendar components:(NSCalendarUnitWeekOfYear) fromDate: currentDate];
    int currentWeekNumber = currentComps.weekOfYear;
    NSLog(@"currentWeekNumber  %d", currentWeekNumber);
    
    //comparison week number
    NSDateComponents *compareComps = [myCalendar components:(NSCalendarUnitWeekOfYear) fromDate: dateInLocalTimezone];
    int compareWeekNumber = compareComps.weekOfYear;
    NSLog(@"compareWeekNumber  %d", compareWeekNumber);
    
    if (currentWeekNumber == compareWeekNumber) {
        return YES;
    }
    return NO;
}

@end
