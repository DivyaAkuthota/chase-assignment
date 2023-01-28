
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SchoolModelProtocol <NSObject>

@property (strong, nonatomic) NSArray *schools;
- (void)updateInitialModelWithData:(NSArray *)data;
- (void)updateModelWithData:(NSArray *)data;

@end

NS_ASSUME_NONNULL_END
