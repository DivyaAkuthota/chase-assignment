
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NetworkServiceProtocol <NSObject> //TODO: change this to delegate many be

- (void)getDataFromURL:(NSString *)urlString withCompletionHandler:(void (^)(NSArray *details))completion;
- (void)updateSchoolDataFromURL:(NSString *)urlString withCompletionHandler:(void (^)(NSArray *details))completion;

@end

NS_ASSUME_NONNULL_END
