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
{
    BOOL mainView;
}

@synthesize fileLabel;
@synthesize soundArray;
@synthesize player;
@synthesize soundList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    if (IS_IPHONE5) {
        UIImage *image = [UIImage imageNamed:@"background-568.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [self.view insertSubview:imageView atIndex:0];
    } else {
        UIImage *image = [UIImage imageNamed:@"background.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [self.view insertSubview:imageView atIndex:0];
    }
    
    self.fileLabel.text = nil;
    NSString *fileList = [[NSBundle mainBundle] pathForResource:@"sounds" ofType:@"plist"];
    self.soundList = [[NSDictionary alloc] initWithContentsOfFile:fileList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
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
        if (mainView == YES) {
            [self makeSound];
        }
        
    }
    
}


// Touches

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.fileLabel.text = nil;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (mainView == YES) {
        [self makeSound];
    }
    
    
}
    
-(void)viewWillAppear:(BOOL)animated {
    if (TRUE) {
        mainView = YES;
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    if (TRUE) {
        mainView = NO;
    }
}


@end
