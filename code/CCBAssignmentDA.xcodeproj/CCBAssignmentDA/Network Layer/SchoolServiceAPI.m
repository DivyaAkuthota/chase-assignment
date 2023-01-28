
#import "SchoolServiceAPI.h"

@implementation SchoolServiceAPI

- (void)getDataFromURL:(NSString *)urlString withCompletionHandler:(void (^)(NSArray *details))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    dispatch_queue_t networkQueue = dispatch_queue_create("com.assignment.concurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(networkQueue, ^{
        [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSError *err;
            NSArray *schoolDetails = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            completion(schoolDetails);
        }] resume];
    });
}

- (void)updateSchoolDataFromURL:(NSString *)urlString withCompletionHandler:(void (^)(NSArray *details))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    dispatch_queue_t networkQueue = dispatch_queue_create("com.assignment.concurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(networkQueue, ^{
        [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSError *err;
            NSArray *schoolDetails = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            completion(schoolDetails);
        }] resume];
    });
}

@end
