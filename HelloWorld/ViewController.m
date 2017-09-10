//
//  ViewController.m
//  HelloWorld
//
//  Created by Abhishek Gupta on 1/18/17.
//  Copyright © 2017 Abhishek Gupta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

static int startit = 5;
static NSTimer *timer1;

@implementation ViewController
//@synthesize label,hellolbl;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

int count=0;
- (IBAction)btn:(id)sender {
    
    
    if(count==0)
    {
    _label.hidden=NO;
    _hellolbl.hidden=NO;
    [UIView transitionWithView:self.label duration:2.0f
                       options:UIViewAnimationOptionTransitionFlipFromRight |
     UIViewAnimationOptionAllowUserInteraction    |
     UIViewAnimationOptionBeginFromCurrentState
                    animations:^{
                        
                        _label.text = @"Abhishek Gupta";
                        
                    } completion:nil];
    
    
    [self beginNumbers];
        count++;
    }
    else if(count==1)
    {
        _label.text=@"U already did it once :P";
        count++;
    }
    else{
        
        _label.hidden=NO;
        _hellolbl.hidden=NO;
        [UIView transitionWithView:self.label duration:1.0f
                           options:UIViewAnimationOptionTransitionFlipFromRight |
         UIViewAnimationOptionAllowUserInteraction    |
         UIViewAnimationOptionBeginFromCurrentState
                        animations:^{
                            
                            _label.text = @"Hello World";
                            
                        } completion:nil];
        
        
    }
    
}
- (void) beginNumbers
{
    timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
}

- (void) countDown:(NSTimer *)timer
{
    CATransition *transitor = [CATransition animation];
    transitor.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
    transitor.type = kCATransitionFromRight;
    transitor.subtype = kCATransitionMoveIn;
    transitor.duration = 0.3;
    [self.hellolbl.layer addAnimation:transitor forKey:@"kCATransitionPush"];
    
    startit = startit-1;
    
    if(startit == 1)
    {
        _hellolbl.text=@"And I come";
    }
    else if(startit < 1 && startit !=1)
    {
        _hellolbl.text = @"Hello World!";
    }
    else
    {
        _hellolbl.text = [NSString stringWithFormat:@"%d", startit];
    }
}
@end
