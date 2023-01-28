
#import "SchoolsModel.h"

@implementation SchoolsModel

- (instancetype)initWithSchoolName:(NSString *)schoolname
                          location:(NSString *)location
                           website:(NSString *)website
                          schoolID:(NSString *)schoolID
                          overview:(NSString *)overview
{
    if (self == [super init]) {
        self.schoolName = schoolname;
        self.location = location;
        self.website = website;
        self.schoolID = schoolID;
        self.overview = overview;
    }
    return self;
}

@end
