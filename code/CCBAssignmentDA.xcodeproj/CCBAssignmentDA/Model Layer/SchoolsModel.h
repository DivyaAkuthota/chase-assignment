
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface SchoolsModel : NSObject
 // TODO: try to delete the unnecessary variables or data/info needed
@property (strong, nonatomic) NSString *schoolName;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *zip;
@property (strong, nonatomic) NSString *interest;
@property (strong, nonatomic) NSString *schoolEmail;
@property (strong, nonatomic) NSString *buildingCode;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) NSString *schoolID;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) NSString *mathScore;
@property (strong, nonatomic) NSString *readingScore;
@property (strong, nonatomic) NSString *writingScore;


- (instancetype)initWithSchoolName:(NSString *)schoolname
                          location:(NSString *)location
                           website:(NSString *)website
                          schoolID:(NSString *)schoolID
                          overview:(NSString *)overview; // we might not need this!! initialize in place on what variables are needed


@end

NS_ASSUME_NONNULL_END
