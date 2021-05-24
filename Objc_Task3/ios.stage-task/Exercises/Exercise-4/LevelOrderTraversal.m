#import "LevelOrderTraversal.h"
#import "Recursive.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *mutableTree = [NSMutableArray arrayWithArray:tree];
    Recursive *recursiveObject = [[Recursive alloc] initWithInputArray:mutableTree];
    
    [recursiveObject move];
    resultsArray = recursiveObject->results;
    
    return resultsArray;
}
