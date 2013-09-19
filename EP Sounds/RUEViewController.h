//
//  RUEViewController.h
//  EP Sounds
//
//  Created by Rene Kurfürst on 10.09.13.
//  Copyright (c) 2013 René Kurfürst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RUEViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *fileLabel;
@property (strong, nonatomic) NSArray *soundArray;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) NSDictionary *soundList;

- (IBAction)showAbout:(id)sender;
- (void) makeSound;

@end
