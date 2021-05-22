#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    switch (monthNumber) {
        case 1:
            return @"January";
        case 2:
            return @"February";
        case 3:
            return @"March";
        case 4:
            return @"April";
        case 5:
            return @"May";
        case 6:
            return @"June";
        case 7:
            return @"July";
        case 8:
            return @"August";
        case 9:
            return @"September";
        case 10:
            return @"October";
        case 11:
            return @"November";
        case 12:
            return @"December";
        default:
            break;
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSDate * correctDate = [dateFormatter dateFromString:date];
    
    dateFormatter.dateFormat = @"dd";
    
    return [[dateFormatter stringFromDate:correctDate] integerValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_BY"];
    dateFormatter.dateFormat = @"E";
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calender setFirstWeekday:2];
    
    NSDate * actualDate = [NSDate now];
    
    NSDateComponents *componentActualWeek = [calender components:NSCalendarUnitWeekOfYear fromDate:actualDate];
    NSDateComponents *componentsDateWeek = [calender components:NSCalendarUnitWeekOfYear fromDate:date];
    
    NSDateComponents *componentsActualYear = [calender components:NSCalendarUnitYear fromDate:actualDate];
    NSDateComponents *componentsDateYear = [calender components:NSCalendarUnitYear fromDate:date];
    
    if ([componentsDateYear year] == [componentsActualYear year]) {
        if ([componentActualWeek weekOfYear] == [componentsDateWeek weekOfYear]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

@end
