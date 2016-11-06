#import <Foundation/Foundation.h>

@interface Prove : NSObject
@property(strong, nonatomic) NSString *sender;
@property(strong, nonatomic) NSString *receiver;
@property(strong, nonatomic) NSString *prove;
@property(strong, nonatomic) NSNumber *startedDate;
@property(strong, nonatomic) NSNumber *endedDate;
@property(strong, nonatomic) NSNumber *type;            // 0 = undefined 1 = Location, 2 = Visual
@property(strong, nonatomic) NSNumber *status;          // 1 = Sent, 2 = delivered, 3 = Responded, 4 = Closed
@property(strong, nonatomic) NSNumber *expireAfter;     // # hours

- (instancetype)initWithSender:(NSString *)sender
                   andReceiver:(NSString *)receiver
                andStartedDate:(NSNumber *)startedDate
                       andType:(NSNumber *)type;
@end
