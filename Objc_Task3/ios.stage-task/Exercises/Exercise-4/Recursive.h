#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Recursive : NSObject {
    NSArray* inputArray;
    @public NSMutableArray* results;
}

- (id)initWithInputArray:(NSArray *)inputs;
- (void)move;
@end

NS_ASSUME_NONNULL_END
