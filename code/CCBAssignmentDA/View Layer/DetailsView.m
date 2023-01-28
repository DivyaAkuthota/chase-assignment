
#import "DetailsView.h"
#import "SchoolsModel.h"

@implementation DetailsView

- (instancetype)initWithModel:(SchoolsModel *)model {
    if (self == [super init]) {
        if (model) {
            // can make this with autolayout for better UI
            UILabel *SATScoreTitle = [UILabel new];
            SATScoreTitle.text = @"SAT Score";
            SATScoreTitle.frame = CGRectMake(40, 100, 300, 30);
            SATScoreTitle.textColor = [UIColor blackColor];
            
            UILabel *mathScoreLabel = [UILabel new];
            mathScoreLabel.text = [NSString stringWithFormat:@"%@ - %@", @"SAT math Score",model.mathScore ?: @"N/A"];
            mathScoreLabel.frame = CGRectMake(50, 130, 300, 30);
            mathScoreLabel.textColor = [UIColor blackColor];
            
            UILabel *readingScoreLabel = [UILabel new];
            readingScoreLabel.text = [NSString stringWithFormat:@"%@ - %@", @"SAT reading Score", model.readingScore ?: @"N/A"];
            readingScoreLabel.frame = CGRectMake(50, 170, 300, 30);
            readingScoreLabel.textColor = [UIColor blackColor];
            
            UILabel *writingScoreLabel = [UILabel new];
            writingScoreLabel.text = [NSString stringWithFormat:@"%@ - %@",@"SAT writing Score", model.writingScore ?: @"N/A"];
            writingScoreLabel.frame = CGRectMake(50, 200, 300, 30);
            writingScoreLabel.textColor = [UIColor blackColor];
            
            [self addSubview:SATScoreTitle];
            [self addSubview:mathScoreLabel];
            [self addSubview:readingScoreLabel];
            [self addSubview:writingScoreLabel];
        } else {
            UILabel *overviewLabel = [UILabel new];
            overviewLabel.text = @"Students who are prepared for college must have an education that encourages them to take risks as they produce and perform.";
            overviewLabel.frame = CGRectMake(50, 100, 300, 100);
            overviewLabel.textColor = [UIColor blackColor];
            overviewLabel.numberOfLines = 5;
            [self addSubview:overviewLabel];
        }
    }
    return self;
}

@end
