#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *string1Mutable = [[NSMutableString alloc] initWithString: string1];
    NSMutableString *string2Mutable = [[NSMutableString alloc] initWithString: string2];
    NSMutableString *resultString = [NSMutableString stringWithString:@""];
    
    while ((string1Mutable.length != 0) && (string2Mutable.length != 0)) {
        NSComparisonResult result = [[string1Mutable substringToIndex:1] compare:[string2Mutable substringToIndex:1]];
        
        if ((result == NSOrderedAscending)||(result == NSOrderedSame)) {
            [resultString appendString: [string1Mutable substringToIndex:1]];
            NSString *subString1 = [string1Mutable substringFromIndex:1];
            NSMutableString *mutableSubString = [[NSMutableString alloc] initWithString: subString1];
            string1Mutable = mutableSubString;
        }
    
        if (result == NSOrderedDescending) {
            [resultString appendString: [string2Mutable substringToIndex:1]];
            NSString *subString2 = [string2Mutable substringFromIndex:1];
            NSMutableString *mutableSubString = [[NSMutableString alloc] initWithString: subString2];
            string2Mutable = mutableSubString;
        }
    }
    string1Mutable.length == 0 ? [resultString appendString:string2Mutable] : [resultString appendString:string1Mutable];
    return resultString;
}

@end
