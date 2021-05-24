#import "LevelOrderTraversal.h"
#import "Recursive.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    Recursive *recursiveObject = [[Recursive alloc] initWithInputArray:tree];
    
    [recursiveObject move];
    resultsArray = recursiveObject->results;
    
    return resultsArray;
}
