
#import <Foundation/Foundation.h>
#import "SchoolModelProtocol.h"
#import "SchoolsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolDataSourceModel : NSObject <SchoolModelProtocol>

@property (strong, nonatomic) NSArray<SchoolsModel *> *schools; // not sure if we need this

@end

NS_ASSUME_NONNULL_END
