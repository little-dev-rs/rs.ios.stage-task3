#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Recursive : NSObject {
    NSMutableArray* inputArray;
    @public NSMutableArray* results;
}

- (id)initWithInputArray:(NSMutableArray *)inputs;
- (void)move;
@end

NS_ASSUME_NONNULL_END
