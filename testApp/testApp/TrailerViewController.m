//
//  TrailerViewController.m
//  testApp
//
//  Created by Aaron Burke on 8/29/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "TrailerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface TrailerViewController ()

@property (nonatomic, strong) MPMoviePlayerController *player;

@end

@implementation TrailerViewController

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
    self.nameLbl.text = self.movie.movieName;
    [self.navigationController setNavigationBarHidden:NO animated:NO];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPlay:(id)sender
{
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"thorthedarkworld-tlr1_h480p" withExtension:@"mov"];
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    if (self.player) {
        [self.trailerView addSubview:self.player.view];
        self.player.view.frame = CGRectMake(0.0f, 0.0f, self.trailerView.frame.size.width, self.trailerView.frame.size.height);
        self.player.fullscreen = FALSE;
        self.player.controlStyle = MPMovieControlStyleNone;
        //[player prepareToPlay];
        [self.player play];
    }
}

- (IBAction)onStop:(id)sender
{
    [self.player stop];
}



@end
