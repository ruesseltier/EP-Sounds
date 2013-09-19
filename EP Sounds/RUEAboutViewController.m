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
    RUEAboutViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    [self presentViewController:view animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
