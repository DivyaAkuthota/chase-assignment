
#import "SchoolDataSourceModel.h"
#import "SchoolsModel.h"

@interface SchoolDataSourceModel()
    @property (strong, nonatomic) NSMutableDictionary *schoolDetailsMap;
@end

@implementation SchoolDataSourceModel

- (instancetype)init {
    if (self == [super init]) {
        _schoolDetailsMap = [NSMutableDictionary new];
    }
    return self;
}

- (void)updateInitialModelWithData:(NSArray *)data {
    // update the schools array from the given array
    NSMutableArray <SchoolsModel *> *schools = NSMutableArray.new;
    for (id obj in data) {
        if (obj) {
            SchoolsModel *modelObj = [SchoolsModel new];
            modelObj.schoolName = [obj objectForKey:@"school_name"];
            modelObj.location = [obj objectForKey:@"location"];
            modelObj.website = [obj objectForKey:@"website"];
            modelObj.schoolID = [obj objectForKey:@"dbn"];
            modelObj.overview = [obj objectForKey:@"overview_paragraph"];
            [_schoolDetailsMap setObject:modelObj forKey:[obj objectForKey:@"dbn"]];
            [schools addObject:modelObj];
        }
    }
    _schools = [NSArray arrayWithArray:schools];
}

- (void)updateModelWithData:(NSArray *)data {
    NSMutableArray <SchoolsModel *> *schoolDetails = NSMutableArray.new;
    for (id obj in data) {
        SchoolsModel *modelObj = [_schoolDetailsMap objectForKey:[obj objectForKey:@"dbn"]];
        if (modelObj) {
                    modelObj.schoolID = [obj objectForKey:@"dbn"];
                    modelObj.mathScore = [obj objectForKey:@"sat_math_avg_score"];
                    modelObj.readingScore = [obj objectForKey:@"sat_critical_reading_avg_score"];
                    modelObj.writingScore = [obj objectForKey:@"sat_writing_avg_score"];
                    [_schoolDetailsMap setObject:modelObj forKey:[obj objectForKey:@"dbn"]];
                    [schoolDetails addObject:modelObj];
        }
    }
    _schools = [NSArray arrayWithArray:schoolDetails];
}

@end
