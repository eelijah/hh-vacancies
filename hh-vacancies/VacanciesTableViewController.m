//
//  VacanciesTableViewController.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "VacanciesTableViewController.h"
#import "TableViewDataSource.h"
#import "Constants.h"
#import "VacancyTableViewCell.h"
#import "ServiceLayer.h"
#import "NetworkUpdateProtocol.h"

@interface VacanciesTableViewController () <NetworkUpdateProtocol>
@property (nonatomic, strong) TableViewDataSource *dataSource;
@end

@implementation VacanciesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[TableViewDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100.f;
    
    NSString *vacancyCellIdentifier = NSStringFromClass([VacancyTableViewCell class]);
    
    [self.tableView registerNib:[UINib nibWithNibName:vacancyCellIdentifier bundle:nil] forCellReuseIdentifier:vacancyCellIdentifier];
    
    [[ServiceLayer sharedServiceLayer] addNetworkUpdateListner:self];
}

- (void)dealloc {
    [[ServiceLayer sharedServiceLayer] removeNetworkUpdateListner:self];
}

- (void)networkUpdate {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
