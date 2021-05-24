#import "Recursive.h"

@implementation Recursive

int levelCurrent = 0;
int indexCurrent = 0;


-(id)initWithInputArray:(NSMutableArray *)inputs{
    self = [super init];
    if (self) {
        inputArray = inputs;
        results = [[NSMutableArray alloc] init];
         levelCurrent = 0;
         indexCurrent = 0;
    }
    return self;
}

- (void)move{
    id value = [self getNextValue];
    if (![value isKindOfClass:NSNumber.class]) {
        levelCurrent --;
        return;
    }
    [self putValuesToFinalArray: value];
    [self moveToBranch];
    [self moveToBranch];
    levelCurrent --;
}

// Move Down and Up
-(void)moveToBranch{
    levelCurrent ++;
    [self move];
}

// Get next value
-(id)getNextValue{
    if (indexCurrent >= (inputArray.count)) {
        return nil;
    }
    id a = inputArray[indexCurrent];
    indexCurrent ++;
    return a;
}

// Put values to result array
-(void)putValuesToFinalArray:(id)value{
    if (levelCurrent==results.count) {
        NSMutableArray* innArr = [[NSMutableArray alloc] init];
        [innArr addObject: value];
        [results insertObject: innArr atIndex: levelCurrent];
    } else {
        NSMutableArray* innArr1 = [results objectAtIndex: levelCurrent];
        [innArr1 addObject: value];
    }
}

@end
