//
//  RSStudent.h
//  40KVCHW
//
//  Created by Roma Chopovenko on 10/23/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSStudent : NSObject


@property(strong, nonatomic) NSString *firstName;
@property(strong, nonatomic) NSString *lastName;
@property(strong, nonatomic) NSDate   *dateOfBirth;
@property(assign, nonatomic) BOOL      gender;
@property(assign, nonatomic) CGFloat grade;

@property(weak, nonatomic) RSStudent *friend;


- (void) generateDataForStudent;
- (void) clearData;
@end
