//
//  RSStudent.m
//  40KVCHW
//
//  Created by Roma Chopovenko on 10/23/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import "RSStudent.h"

static const NSInteger numberOfCases = 50;

@implementation RSStudent

static NSString* firstNames[] = {
    
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Chopovenko", @"Bello",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

- (void) generateDataForStudent {
    
    self.firstName = firstNames[arc4random() % numberOfCases];
    self.lastName = lastNames [arc4random() % numberOfCases];
    [self setValue:[self generateRandomDateOfBirth] forKey:@"dateOfBirth"];
    [self setValue:@(arc4random() % 2) forKey:@"gender"];
    self.grade = ((CGFloat)(arc4random() % 2001))/200;
}

- (NSDate *) generateRandomDateOfBirth {
    
    NSInteger age = (arc4random() % 34) + 16;
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsForDateOfBirth = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    // setting new values for birthDate
    [componentsForDateOfBirth setYear:componentsForDateOfBirth.year - age];
    [componentsForDateOfBirth setMonth:(int)(arc4random() % 13)];
    
    // creating date with new components
    NSDate *birth = [calendar dateFromComponents:componentsForDateOfBirth];
    
    //getting number of days in installed month of a year
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:birth];
    NSUInteger numberOfDaysInMonth = range.length;
    
    NSInteger day =(int)(arc4random() % (numberOfDaysInMonth + 1));
    
    [componentsForDateOfBirth setDay:day];
    [componentsForDateOfBirth setHour:3];
    
    birth = [calendar dateFromComponents:componentsForDateOfBirth];
    
    return birth;
}

- (void) clearData {
    
    [self willChangeValueForKey:@"firstName"];
    _firstName = nil;
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = nil;
    [self didChangeValueForKey:@"lastName"];
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = nil;
    [self didChangeValueForKey:@"dateOfBirth"];
    
    [self willChangeValueForKey:@"gender"];
    _gender = 0;
    [self didChangeValueForKey:@"gender"];
    
    [self willChangeValueForKey:@"grade"];
    _grade = 0;
    [self didChangeValueForKey:@"grade"];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"NAME %@ %@\nDate of Birth: %@\nGrade: %1.2f\nGender:%d", self.firstName, self.lastName, self.dateOfBirth, self.grade, self.gender];
}


# pragma mark - KVC methods

- (void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"Undefined Key : %@", key);
}








@end
