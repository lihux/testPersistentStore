//
//  MasterViewController.m
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "LHFMDBManager.h"
#import "LHAlbum.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property (nonatomic, strong) LHFMDBManager *fmdbManager;
@property (nonatomic, strong) NSArray *albums;
@property (nonatomic, copy) NSString *dbPath;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.dbPath = [[NSBundle mainBundle] pathForResource:@"chinook" ofType:@"db"];
    [self loadData];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)loadData {
    self.albums = [self.fmdbManager getAllAlbums];
    [self.tableView reloadData];
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    LHAlbum *album = self.albums[indexPath.row];
    cell.textLabel.text = [album description];
    return cell;
}

- (LHFMDBManager *)fmdbManager {
    if (_fmdbManager) {
        return _fmdbManager;
    }
    _fmdbManager = [[LHFMDBManager alloc] initWithDBPath:self.dbPath];
    return _fmdbManager;
}

@end
