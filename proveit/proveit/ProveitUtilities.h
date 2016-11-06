#import <Foundation/Foundation.h>

@interface ProveitUtilities : NSObject
+ (NSDate *)localTimeZonForDate:(NSDate *)date;
+ (NSDate *)localTimeZonForTimeIntervalSince1970:(NSNumber *)timeInterval;
@end
