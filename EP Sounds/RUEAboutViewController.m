//
//  RUEAboutViewController.m
//  EP Sounds
//
//  Created by Rene Kurfürst on 19.09.13.
//  Copyright (c) 2013 René Kurfürst. All rights reserved.
//

#import "RUEAboutViewController.h"

@interface RUEAboutViewController ()

@end

@implementation RUEAboutViewController

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
}

- (IBAction)showMain:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)website:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.eintracht-podcast.de"]];
}
@end
