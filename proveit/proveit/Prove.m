#import "Prove.h"

@implementation Prove

- (instancetype)init {
    return [self initWithSender:@""
                    andReceiver:@""
                 andStartedDate:0
                        andType:0];
}

- (instancetype)initWithSender:(NSString *)sender
                   andReceiver:(NSString *)receiver
                andStartedDate:(NSNumber *)startedDate
                       andType:(NSNumber *)type {

    self = [super init];
    if (self) {
        self.sender = sender;
        self.receiver = receiver;
        self.startedDate = startedDate;
        self.type = type;
    }
    return self;
}
@end
