
#import "ViewController.h"
#import "SchoolsModel.h"
#import "SchoolTableViewCell.h"
#import "SchoolDetailsViewController.h"
#import "SchoolServiceAPI.h"
#import "SchoolDataSourceModel.h"

@interface ViewController ()
@property (strong,nonatomic) NSArray <SchoolsModel *> *schoolsList;
@property (strong, nonatomic) SchoolDataSourceModel *schoolsDetails;
@property (assign) BOOL isSecondNetworkCallMade;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isSecondNetworkCallMade = false; // can be refactored to something else
    self.view.backgroundColor = [UIColor yellowColor];
    _schoolsDetails = [SchoolDataSourceModel new];
    [self initialViewSetup];
    [self getDataAndUpdateUI];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *customCellIdentifier = @"schoolCellId";
    SchoolTableViewCell *customCell = [_tableView dequeueReusableCellWithIdentifier:customCellIdentifier];
    if (customCell == nil) {
        customCell = [[SchoolTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customCellIdentifier];
    }
    customCell.backgroundColor = [UIColor whiteColor];
    customCell.schoolNameLabel.text = [_schoolsList objectAtIndex:indexPath.row].schoolName;
    customCell.websiteLabel.text = [_schoolsList objectAtIndex:indexPath.row].website;
    customCell.locationLabel.text = [_schoolsList objectAtIndex:indexPath.row].location;
    [customCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row%2 == 0) {
        customCell.backgroundColor = [UIColor lightTextColor];
    }
    return customCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_schoolsList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120; // can remove the hardcoded values.
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(self.view.window.frame.size.width , 60);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SchoolDetailsViewController *detailsVC = [SchoolDetailsViewController new];
    if (!_isSecondNetworkCallMade) {
        _isSecondNetworkCallMade = true;
        SchoolServiceAPI *schoolService = [SchoolServiceAPI new];
        ViewController * __weak weakSelf = self;
        [schoolService updateSchoolDataFromURL:@"https://data.cityofnewyork.us/resource/f9bf-2cp4.json" withCompletionHandler:^(NSArray * _Nonnull details) {
            [weakSelf.schoolsDetails updateModelWithData:details];
            ViewController * __weak weakSelf2 = weakSelf;
            dispatch_async(dispatch_get_main_queue(), ^{
                detailsVC.schoolDetails = [weakSelf2.schoolsList objectAtIndex:indexPath.row];
                [weakSelf2.navigationController pushViewController:detailsVC animated:NO];
            });
        }];
    } else {
        detailsVC.schoolDetails = [self.schoolsList objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detailsVC animated:NO];
    }
}

- (void)initialViewSetup {
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    _activityIndicator.alpha = 1.0;
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height/2);
    [_activityIndicator startAnimating];
    UITableView *tableViewOne = [UITableView new];
    _tableView = tableViewOne;
    tableViewOne.backgroundView = _activityIndicator;
    tableViewOne.delegate = self;
    tableViewOne.dataSource = self;
    tableViewOne.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.frame.size.height);
    [self.tableView registerClass:SchoolTableViewCell.class forCellReuseIdentifier:@"schoolCellId"];
    [self.view addSubview:self.tableView];
    [self.navigationController setTitle:@"List of all Schools"];
}


- (void)getDataAndUpdateUI {
    SchoolServiceAPI *schoolService = [SchoolServiceAPI new];
    ViewController *__weak weakself = self;
    [schoolService getDataFromURL:@"https://data.cityofnewyork.us/resource/s3k6-pzi2.json" withCompletionHandler:^(NSArray * _Nonnull details) {
        [weakself.schoolsDetails updateInitialModelWithData:details];
        weakself.schoolsList = weakself.schoolsDetails.schools;
        ViewController *__weak weakSelf2 = weakself;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf2.activityIndicator stopAnimating];
            [weakSelf2.tableView reloadData];
        });
    }];
}

@end
