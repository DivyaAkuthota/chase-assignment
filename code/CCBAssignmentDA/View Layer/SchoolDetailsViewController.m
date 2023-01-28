
#import "SchoolDetailsViewController.h"
#import "DetailsView.h"

@implementation SchoolDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    self.navigationItem.title = self.schoolDetails.schoolName;
    DetailsView *customView = [[DetailsView alloc] initWithModel:self.schoolDetails];
    [self.view addSubview:customView];
}

- (void)back:(UIBarButtonItem *)sender {
       [self.navigationController popViewControllerAnimated:YES];
}

@end
