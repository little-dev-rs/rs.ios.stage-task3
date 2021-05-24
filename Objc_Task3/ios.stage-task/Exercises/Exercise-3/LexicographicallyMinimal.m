#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *string1Mutable = [[NSMutableString alloc] initWithString: string1];
    NSMutableString *string2Mutable = [[NSMutableString alloc] initWithString: string2];
    NSMutableString *resultString = [NSMutableString stringWithString:@""];
    
    NSInteger lenthCount = [string1 length] + [string2 length];
    
    for (int i = 0; i < lenthCount; ++i) {
        NSString *firstLetterFirstString = [string1Mutable substringToIndex:1];
        NSString *firstLetterSecondString = [string2Mutable substringToIndex:1];
        
        if (([string1Mutable length] != 0) && ([string2Mutable length] != 0)) {
            NSComparisonResult result = [firstLetterFirstString compare:firstLetterSecondString];
            
            if ((result == NSOrderedAscending)||(result == NSOrderedSame)) {
                [resultString appendString: firstLetterFirstString];
                NSString *subString1 = [string1Mutable substringFromIndex:1];
                NSMutableString *mutableSubString = [[NSMutableString alloc] initWithString: subString1];
                string1Mutable = mutableSubString;
            }

            if (result == NSOrderedDescending) {
                [resultString appendString: firstLetterSecondString];
                NSString *subString2 = [string2Mutable substringFromIndex:1];
                NSMutableString *mutableSubString = [[NSMutableString alloc] initWithString: subString2];
                string2Mutable = mutableSubString;
            }
        }

        if (([string1Mutable length] == 0) && ([string2Mutable length] != 0)) {
            [resultString appendString: string2Mutable];
            return resultString;
        }
        
        if (([string1Mutable length] != 0) && ([string2Mutable length] == 0)) {
            [resultString appendString: string1Mutable];
            return resultString;
        }
    }
    return resultString;
}

@end
