//
//  ViewController.m
//  CashReegister
//
//  Created by Allan Davis on 8/22/12.
//  Copyright (c) 2012 Dealermatch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize changeToBeGiven;
@synthesize purchasePrice;
@synthesize customerAmountGave;
@synthesize theTextField;
@synthesize dollarOutput;




-(IBAction)tender:(id)sender{
    AudioServicesPlaySystemSound(SoundID);
    
    
    float customerPaid = ([customerAmountGave.text floatValue]);
    float changeTendered = customerPaid - ([purchasePrice.text floatValue]);
    
    
    
    
    if (changeTendered < 0)
    { NSLog(@"Error!");
        changeToBeGiven.text = [[NSString alloc] initWithFormat:@"ERROR"];}
    
    else if (changeTendered == 0)
    {
        NSLog(@"ZERO");
        changeToBeGiven.text = [[NSString alloc] initWithFormat:@"ZERO"];
    }
    
    else
        
        changeToBeGiven.text = [[NSString alloc] initWithFormat:@"%.2f", changeTendered];
    
    NSNumber *hundredDollar = [NSNumber numberWithUnsignedInteger:100];
    
    NSNumber *fiftyDollar = [NSNumber numberWithUnsignedInteger:50];
    
    NSNumber *twentyDollar = [NSNumber numberWithUnsignedInteger:20];
    
    NSNumber *tenDollar = [NSNumber numberWithUnsignedInteger:10];
    
    NSNumber *fiveDollar = [NSNumber numberWithUnsignedInteger:5];
    
    NSNumber *twoDollar = [NSNumber numberWithUnsignedInteger:2];
    
    NSNumber *oneDollar = [NSNumber numberWithUnsignedInteger:1];
    
    NSNumber *halfDollar = [NSNumber numberWithFloat:0.50];
    
    NSNumber *quarter = [NSNumber numberWithFloat:0.25];
    
    NSNumber *dime = [NSNumber numberWithFloat: 0.10];
    
    NSNumber *nickel = [NSNumber numberWithFloat:0.05];
    
    NSNumber *penny = [NSNumber numberWithFloat:0.01];
    
    NSArray *billsArray = [[NSArray alloc] initWithObjects:hundredDollar, fiftyDollar, twentyDollar, tenDollar, fiveDollar, twoDollar, oneDollar, halfDollar, quarter, dime, nickel, penny, nil];
    
    
   /*
    NSDictionary *cashMoney;
    cashMoney = [NSDictionary dictionaryWithObjectsAndKeys:
              @"hundredDollar", @"Hundred",
              @"50", @"Fifty", @"20", @"Twenty", @"10", @"Ten", @"5", @"Five", @"2", @"Two", @"1", @"One", @"0.5", @"Half Dollar", @"0.25", @"Quarter", @"0.1", @"Dime", @"0.05", @"Nickel", @"0.01", @"Penny", nil];
    */
    
    NSMutableArray *changeMutableArray = [[NSMutableArray alloc] init];
    
    
    // Fill changeMutableArray
    NSUInteger i = 0;
    int j = 0 ;

    for (i = 0;
         i < [billsArray count];
         i++){
        NSNumber *currentDrawerElement = [billsArray objectAtIndex:i];
        
        NSLog(@"Bills in store drawer = $ %@ bill", currentDrawerElement);
        
        if(currentDrawerElement.floatValue <= changeTendered){
            
            [changeMutableArray insertObject:currentDrawerElement atIndex:j];
            j++;
            
            changeTendered = changeTendered - currentDrawerElement.floatValue;
            
            if(changeTendered <= 0){
                break;
            }
            
            
            
            
        }
        
    
              
    }
    
    
    //Let's display the array of changes to be given i.e display changeMutableArray
    NSLog(@"The array holds: %@", changeMutableArray);
    
    NSString *alertString = [changeMutableArray componentsJoinedByString:@", "];
    
    NSLog(@"Now the array holds: %@", alertString);
    
    
    dollarOutput.text = [[NSString alloc] initWithFormat:@"%@", alertString];
    
/*
    
    
    NSArray *valueArray =  [cashMoney allValues];
    int count = [valueArray count];
    for (int i=0; i < count; i++) {
        
        NSMutableArray *tmp = [[NSMutableArray alloc] init];
        
        tmp = [cashMoney objectForKey:[ valueArray objectAtIndex:i]];
        
      
    
        NSLog(@"Testing values: %@, value: %@", tmp, [tmp objectAtIndex:i]);
 */
    }
    
    
    
        







- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *buttonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"12112301" ofType:@"mp3"]];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonURL, &SoundID);
    
    
    [customerAmountGave setDelegate:self];
    [purchasePrice setDelegate:self];
    
    [[self view] endEditing:YES];
    
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
        
    [customerAmountGave resignFirstResponder];
    [purchasePrice resignFirstResponder];
  
       
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}






- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
