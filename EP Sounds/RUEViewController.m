//
//  RUEViewController.m
//  EP Sounds
//
//  Created by Rene Kurfürst on 10.09.13.
//  Copyright (c) 2013 René Kurfürst. All rights reserved.
//

#import "RUEViewController.h"
#import "RUEAboutViewController.h"

@interface RUEViewController ()

@end

@implementation RUEViewController

@synthesize fileLabel;
@synthesize soundArray;
@synthesize player;
@synthesize soundList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"background.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view insertSubview:imageView atIndex:0];
    
    //self.soundArray = [[NSArray alloc] initWithObjects:@"bettchen", @"wurst", nil];
    self.fileLabel.text = nil;
    //self.soundList = [[NSDictionary alloc] initWithObjectsAndKeys: @"Alles klärchen Bärchen, ich muss jetzt ins Bettchen. Tschüsschen", @"bettchen", @"Ich will Sie nicht weiter bei ihrer Wurst stören", @"wurst", nil];
    NSString *fileList = [[NSBundle mainBundle] pathForResource:@"sounds" ofType:@"plist"];
    self.soundList = [[NSDictionary alloc] initWithContentsOfFile:fileList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (IBAction)showAbout:(id)sender {
    RUEAboutViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"About"];
    [self presentViewController:view animated:YES completion:NULL];
}

- (void) makeSound {
    NSUInteger index = arc4random_uniform(self.soundList.count);
    NSArray *keys = [soundList allKeys];
    NSString *key = [keys objectAtIndex:index];
    self.fileLabel.text = [self.soundList objectForKey:key];
    //NSString *fileName = [self.soundArray objectAtIndex:index];
    NSString *randomSound = [[NSBundle mainBundle] pathForResource:key ofType:@".mp3"];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:randomSound] error:NULL];
    [player play];
    
}

// Motions

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.fileLabel.text = nil;
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self makeSound];
    }
    
}


// Touches

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.fileLabel.text = nil;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makeSound];
}



@end
