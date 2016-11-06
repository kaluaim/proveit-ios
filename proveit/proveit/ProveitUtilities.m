#import "ProveitUtilities.h"

@implementation ProveitUtilities

+ (NSDate *)localTimeZonForDate:(NSDate *)date {
    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    return [date dateByAddingTimeInterval:timeZoneSeconds];
}

+ (NSDate *)localTimeZonForTimeIntervalSince1970:(NSNumber *)timeInterval {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    return [self localTimeZonForDate:date];
}
@end

