//
//  MovieDetailViewController.m
//  testApp
//
//  Created by Aaron Burke on 8/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "MovieDetailViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "TrailerViewController.h"

@interface MovieDetailViewController ()

@property (nonatomic, strong) MPMoviePlayerController *player;

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self createMovieDetail:self.movie];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Creates data for movie detail view
- (void)createMovieDetail:(MovieInfo*)movieInfo
{
    self.nameLbl.text = movieInfo.movieName;
    self.movieImg.image = [UIImage imageNamed:movieInfo.movieImg];
    self.time1Lbl.text = movieInfo.movieTimes[0];
    self.time2Lbl.text = movieInfo.movieTimes[1];
    self.time3Lbl.text = movieInfo.movieTimes[2];
    self.time4Lbl.text = movieInfo.movieTimes[3];
    self.time5Lbl.text = movieInfo.movieTimes[4];
    
    // Takes an actual image of the first frame of the movie and sets it to a image view
    dispatch_queue_t backgroundQueue = dispatch_queue_create("com.mycompany.myqueue", 0);
    dispatch_async(backgroundQueue, ^{
        NSError *error = nil;
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"thorthedarkworld-tlr1_h480p" withExtension:@"mov"];
        self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
        UIImage  *thumbnail = [self.player thumbnailImageAtTime:1.0 timeOption:MPMovieTimeOptionNearestKeyFrame];
        if (thumbnail) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error) {
                    NSLog(@"Data could not be shown");
                } else {
                    self.trailerImg.image = thumbnail;
                    [self.player stop];
                }
            });
        }
    });
}

// Sends the movie object to the trailer view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"trailerView"]) {
        
        TrailerViewController *destViewController = segue.destinationViewController;
        if (destViewController) {
            destViewController.movie = self.movie;
        }
    }
}

@end
