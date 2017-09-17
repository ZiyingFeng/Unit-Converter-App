//
//  ViewController.m
//  UnitConverter
//
//  Created by Ziying Feng on 1/30/17.
//  Copyright © 2017 Ziying Feng. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *laserInput;
@property (weak, nonatomic) IBOutlet UITextField *wavelengthInput;
@property (weak, nonatomic) IBOutlet UITextField *wavenumberInput;
@property (weak, nonatomic) IBOutlet UILabel *cmLabel;


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outputField;

@end

@implementation ViewController

double convertToEV (double input){
    double evValue;
    evValue = 1240/input;
    return evValue;
}


- (IBAction)updateButton:(id)sender {
    
    NSMutableString *buf = [NSMutableString new];
    
    double laserValue = [self.laserInput.text doubleValue];
    double wavelengthValue = [self.wavelengthInput.text doubleValue];
    double wavenumberValue = [self.wavenumberInput.text doubleValue];
    
    if(self.segmentController.selectedSegmentIndex == 0){
        double evValue = convertToEV (wavelengthValue);
        NSString *evOutput = [NSString stringWithFormat:@"%.2f", evValue];
        [buf appendString: evOutput];
    }
    
    else if(self.segmentController.selectedSegmentIndex == 1){
        
        double cmValue;
        cmValue = 1/(laserValue/10000000.0)-1/(wavelengthValue/10000000.0);
        NSString *cmOutput = [NSString stringWithFormat:@"%.2f", cmValue];
        [buf appendString: cmOutput];
    }
    
    else if(self.segmentController.selectedSegmentIndex == 2){
        double nmValue;
        nmValue = (1/(1/(laserValue/10000000.0) - wavenumberValue))*10000000.0;
        NSString *nmOutput = [NSString stringWithFormat:@"%.2f", nmValue];
        [buf appendString: nmOutput];
    }
    
    
    
    self.outputField.text = buf;
    
    [self.laserInput resignFirstResponder];
    [self.wavelengthInput resignFirstResponder];
    [self.wavenumberInput resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [[UISegmentedControl appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
    [self.cmLabel setText:@"cm\u207b\u00b9"];
    //use the unicode to represent superscrit minus and superscript one
    
    [self.segmentController setTitle:@"cm\u207b\u00b9" forSegmentAtIndex:1];
    
    self.laserInput.keyboardType = UIKeyboardTypeNumberPad;
    self.wavelengthInput.keyboardType = UIKeyboardTypeNumberPad;
    self.wavenumberInput.keyboardType = UIKeyboardTypeNumberPad;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
