
#import "SchoolTableViewCell.h"

@implementation SchoolTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *schoolNameLabel = [UILabel new];
        schoolNameLabel.frame = CGRectMake(10, 10, 380, 20);
        schoolNameLabel.text = @"schoolName";
        schoolNameLabel.font = [UIFont boldSystemFontOfSize:18];
        schoolNameLabel.textColor = [UIColor blackColor];
        self.schoolNameLabel = schoolNameLabel;
        
        UILabel *locationLabel = [UILabel new];
        locationLabel.frame = CGRectMake(20, 30, 350, 50);
        locationLabel.text = @"locationLabel";
        locationLabel.numberOfLines = 3;
        locationLabel.font = [UIFont systemFontOfSize:16];
        locationLabel.textColor = [UIColor blackColor];
        self.locationLabel = locationLabel;
        
        UILabel *websiteLabel = [UILabel new];
        websiteLabel.frame = CGRectMake(20, 60, 300, 50);
        websiteLabel.text = @"websitelabel";
        websiteLabel.numberOfLines = 1;
        locationLabel.font = [UIFont systemFontOfSize:14];
        websiteLabel.textColor = [UIColor darkGrayColor];
        self.websiteLabel = websiteLabel;
        
        [self addSubview:self.schoolNameLabel];
        [self addSubview:self.locationLabel];
        [self addSubview:self.websiteLabel];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
