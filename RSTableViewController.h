//
//  RSTableViewController.h
//  40KVCHW
//
//  Created by Roma Chopovenko on 10/23/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDateOfBirth;
@property (weak, nonatomic) IBOutlet UITextField *textFieldGrade;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlGender;


- (IBAction)actionReset:(UIButton *)sender;
- (IBAction)actionClear:(UIButton *)sender;



@end
