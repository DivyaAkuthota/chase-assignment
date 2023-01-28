
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SchoolTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *schoolNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationLabel;
@property (nonatomic, weak) IBOutlet UILabel *websiteLabel;

@end

NS_ASSUME_NONNULL_END
