//
//  ViewController.h
//  CashReegister
//
//  Created by Allan Davis on 8/22/12.
//  Copyright (c) 2012 Dealermatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

int clicked;


@interface ViewController : UIViewController <UITextFieldDelegate>


{    
    AVAudioPlayer *audioPlayer;
    
    SystemSoundID SoundID;
    

}

@property (strong, nonatomic) IBOutlet UILabel *changeToBeGiven;

@property (strong, nonatomic) IBOutlet UITextField *purchasePrice;

@property (strong, nonatomic) IBOutlet UITextField *customerAmountGave;

@property (strong, nonatomic) UITextField *theTextField;

@property (strong, nonatomic) IBOutlet UILabel *dollarOutput;





-(IBAction)tender:(id)sender;

@end
