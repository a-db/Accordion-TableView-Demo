//
//  TableViewController.m
//  testApp
//
//  Created by Aaron Burke on 8/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "TableViewController.h"
#import "TheaterInfo.h"
#import "MovieInfo.h"
#import "CustomHeader.h"
#import "TableCell.h"
#import "MovieDetailViewController.h"

@interface TableViewController ()

@property(nonatomic,strong) NSMutableArray *theaterArray;
@property(nonatomic,strong) NSMutableArray *movieArray1;
@property(nonatomic,strong) NSMutableArray *movieArray2;
@property(nonatomic,strong) NSMutableArray *movieArray3;
@property(nonatomic,assign) int currentlyExpandedIndex;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.theaterArray = [[NSMutableArray alloc] init];
    self.movieArray1 = [[NSMutableArray alloc] init];
    self.movieArray2 = [[NSMutableArray alloc] init];
    self.movieArray3 = [[NSMutableArray alloc] init];

    // Simulate some movie data
    NSArray *movieData = @[@{@"name":@"The Lone Ranger",@"image":@"lone.jpg",
                                @"movieTimes":@[@"10:30 AM", @"1:30 PM", @"4:30 PM", @"7:30 PM", @"10:30 PM"]},
                           @{@"name":@"World War Z",@"image":@"wwz523.jpg",
                                @"movieTimes":@[@"10:00 AM", @"1:00 PM", @"4:00 PM", @"7:00 PM", @"10:00 PM"]},
                           @{@"name":@"R.I.P.D",@"image":@"ripd_final1sheet.jpg",
                                @"movieTimes":@[@"10:45 AM", @"12:45 PM", @"3:45 PM", @"6:45 PM", @"9:45 PM"]},
                           @{@"name":@"The Smurfs 2",@"image":@"smurf2-523d.jpg",
                                @"movieTimes":@[@"11:00 AM", @"1:30 PM", @"4:00 PM", @"6:30 PM", @"9:00 PM"]},
                           @{@"name":@"Iron Man 3",@"image":@"ironman3-36f.jpg",
                                @"movieTimes":@[@"11:00 AM", @"1:30 PM", @"4:00 PM", @"6:30 PM", @"9:00 PM"]},
                           @{@"name":@"White House Down",@"image":@"whd523.jpg",
                                @"movieTimes":@[@"10:30 AM", @"1:30 PM", @"4:30 PM", @"7:30 PM", @"10:30 PM"]},
                           @{@"name":@"RED 2",@"image":@"red2finalteaserposter1.jpg",
                                @"movieTimes":@[@"9:30 AM", @"12:30 PM", @"3:30 PM", @"6:30 PM", @"9:30 PM"]},
                           @{@"name":@"Man of Steel",@"image":@"manofsteel52f.jpg",
                                @"movieTimes":@[@"11:00 AM", @"12:30 PM", @"3:30 PM", @"7:30 PM", @"10:30 PM"]},
                           @{@"name":@"Wolverine",@"image":@"wolverine-poster1029fin.jpg",
                                @"movieTimes":@[@"11:05 AM", @"12:35 PM", @"3:35 PM", @"7:30 PM", @"10:35 PM"]},
                           @{@"name":@"2Guns",@"image":@"two_guns41f.jpg",
                                @"movieTimes":@[@"10:05 AM", @"12:35 PM", @"3:30 PM", @"6:30 PM", @"9:35 PM"]},
                           @{@"name":@"Percy Jackson",@"image":@"percy410.jpg",
                                @"movieTimes":@[@"10:50 AM", @"12:50 PM", @"3:30 PM", @"6:30 PM", @"9:35 PM"]},
                           @{@"name":@"Elysium",@"image":@"elysium_6147.jpg",
                                @"movieTimes":@[@"10:20 AM", @"12:20 PM", @"3:20 PM", @"6:20 PM", @"9:25 PM"]},
                           @{@"name":@"Mortal Instruments",@"image":@"mortalinstruments78.jpg",
                                @"movieTimes":@[@"10:15 AM", @"12:15 PM", @"3:15 PM", @"6:15 PM", @"9:15 PM"]},
                           @{@"name":@"Kick-Ass 2",@"image":@"ka2poster.jpg",
                                @"movieTimes":@[@"10:45 AM", @"1:45 PM", @"4:45 PM", @"6:45 PM", @"9:45 PM"]},
                           @{@"name":@"We're The Millers",@"image":@"were_the_millers523.jpg",
                                @"movieTimes":@[@"9:40 AM", @"12:40 PM", @"2:40 PM", @"5:40 PM", @"9:40 PM"]}];
    
    // Simulate some theater data
    NSArray *theaterData = @[@{@"name":@"Rave Motion Pictures", @"image":@"rave@2x.jpg", @"address":@"511 Main St., Huntsville, AL 35763"},
                             @{@"name":@"Carmike Cinema", @"image":@"carmike@2x.jpg", @"address":@"757 South St., Huntsville, AL 35763"},
                             @{@"name":@"AMC Theater", @"image":@"amc@2x.jpg", @"address":@"5789 North St., Huntsville, AL 35763"}];
    
    // Create TheaterInfo objects from the theater data
    for (id theater in theaterData) {
        TheaterInfo *theaterObj = [[TheaterInfo alloc] initWithInfo:theater[@"name"] imgStr:theater[@"image"] address:theater[@"address"]];
        //NSLog(@"%@", theaterObj);
        if (theaterObj) {
            [self.theaterArray addObject:theaterObj];
        }
    }
    
    // Create MovieInfo objects from the movie data
    // Also creates three arrays of 5 movies
    for (int i = 0, j = movieData.count; i < j; i++) {
        MovieInfo *movieObj = [[MovieInfo alloc] initWithInfo:movieData[i][@"name"] imgStr:movieData[i][@"image"] movTimes:movieData[i][@"movieTimes"]];
        if (movieObj){
            if (i < 5) {
                [self.movieArray1 addObject:movieObj];
            } else if (i < 10){
                [self.movieArray2 addObject:movieObj];
            } else {
                [self.movieArray3 addObject:movieObj];
            }
        }
    }
    
    // Add an array of 5 MovieInfo objects to each TheaterInfo object we have created
    [self.theaterArray[0] createMovieList:self.movieArray1];
    [self.theaterArray[1] createMovieList:self.movieArray2];
    [self.theaterArray[2] createMovieList:self.movieArray3];
    
//    NSLog(@"%@", [self.theaterArray[0] theaterMovies]);
//    NSLog(@"%@", [self.theaterArray[1] theaterMovies]);
//    NSLog(@"%@", [self.theaterArray[2] theaterMovies]);
//    NSLog(@"%@", self.theaterArray);
//    NSLog(@"%@", self.movieArray1);
//    NSLog(@"%@", self.movieArray2);
//    NSLog(@"%@", self.movieArray3);

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return self.theaterArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Checks index for accordion effect
    if(self.currentlyExpandedIndex == section) {

        return [[self.theaterArray[section] theaterMovies] count];

    } else {
        
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.theaterArray) {
        
        CustomHeader *header = [[NSBundle mainBundle] loadNibNamed:@"CustomHeader" owner:self options:nil][0];
        if (header) {
            // Pass in the theater object to the header creation method
            [header createHeader:self.theaterArray[section]];
            // Setup the block click handler on the header
            header.buttonTappedHandler = ^{
                // Call the accordion method
                [self openAccordionAtIndex:section];
            };
            return header;
        }
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tableCell";
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Pass the movie object to the cell creation method
    [cell createCell:[ [self.theaterArray[indexPath.section] theaterMovies] objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

// Sends the movie object to the movie detail view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"movieDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSLog(@"%d", indexPath.row);
//        NSLog(@"%d", indexPath.section);
        MovieDetailViewController *destViewController = segue.destinationViewController;
        if (destViewController) {
            destViewController.movie = [[self.theaterArray[indexPath.section] theaterMovies] objectAtIndex:indexPath.row];
        }
    }
}

// Simulates accordion effect on tableview by removing and inserting cells
-(void) openAccordionAtIndex:(int) index {
    
    if (self.currentlyExpandedIndex != index) {

        NSMutableArray *indexPaths = [NSMutableArray array];
        //NSLog(@"%d", self.currentlyExpandedIndex);
        int sectionCount = [ [self.theaterArray[self.currentlyExpandedIndex] theaterMovies] count];
        
        for(int i = 0; i < sectionCount; i ++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:self.currentlyExpandedIndex];
            [indexPaths addObject:indexPath];
        }
        
        self.currentlyExpandedIndex = -1;
        
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        
        self.currentlyExpandedIndex = index;
        //NSLog(@"%d", self.currentlyExpandedIndex);
        sectionCount = [ [self.theaterArray[self.currentlyExpandedIndex] theaterMovies] count];
        
        [indexPaths removeAllObjects];
        for(int i = 0; i < sectionCount; i ++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:self.currentlyExpandedIndex];
            [indexPaths addObject:indexPath];
        }
        
        // Needed to overcome NSInternalIoncistencyExecption errors for not having the correct cell count
        double delayInSeconds = 0.35;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        });
        
        [self.tableView endUpdates];
    }
}

@end
