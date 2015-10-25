//
//  RSTableViewController.m
//  40KVCHW
//
//  Created by Roma Chopovenko on 10/23/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//
#pragma mark - Task
/*
 Вот эта тема очень интересная, так что задания нужно выполнить обязательно :)
 
 Ученик.
 
 1. Создайте класс студента с пропертисами firstName, lastName, dateOfBirth, gender, grade
 2. Также создайте статическую таблицу куда все эти данные выводятся и где их можно менять (с текст филдами, сенгментед контролами и тд)
 3. Пропертисы вашего студента меняйте тем же образом что и в предыдущих уроках (через делегаты и акшины)
 
 Студент.
 
 4. Повесте обсервера на все пропертисы студента и выводите в консоль каждый раз, когда проперти меняется
 5. Также сделайте метод "сброс", который сбрасывает все пропертисы, а в самом методе не используйте сеттеры, сделайте все через айвары, но сделайте так, чтобы обсервер узнал когда и что меняется. (типо как в уроке)
 
 Мастер.
 
 забудьте про UI
 
 6. Создайте несколько студентов и положите их в массив, но обсервер оставьте только на одном из них
 7. У студентов сделайте weak проперти "friend". Сделайте цепочку из нескольких студентов, чтобы один был друг второму, второй третьему, тот четвертому, а тот первому :)
 8. Используя метод setValue: forKeyPath: начните с одного студента (не того, что с обсервером) и переходите на его друга, меняя ему проперти, потом из того же студента на друга его друга и тд (то есть путь для последнего студента получится очень длинный)
 9. Убедитесь что на каком-то из друзей, когда меняется какой-то проперти, срабатывает ваш обсервер
 
 Супермен
 
 10. Добавьте побольше студентов
 11. Используя операторы KVC создайте массив имен всех студентов
 12. Определите саммый поздний и саммый ранний годы рождения
 13. Определите сумму всех баллов студентов и средний бал всех студентов
 */

#import "RSTableViewController.h"
#import "RSStudent.h"

@interface RSTableViewController ()

@property (strong, nonatomic) RSStudent *student;

@end

@implementation RSTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.student = [[RSStudent alloc] init];
    [self.student generateDataForStudent];
    [self fillLabelsWithStudentProperties];
    [self addObserversForStudentProperties];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark Private methods

- (void) fillLabelsWithStudentProperties {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    self.textFieldFirstName.text = [self.student valueForKey:@"firstName"];
    self.textFieldLastName.text  = self.student.lastName;
    self.textFieldDateOfBirth.text = [dateFormatter stringFromDate:self.student.dateOfBirth];
    self.segmentedControlGender.selectedSegmentIndex = self.student.gender;
    self.textFieldGrade.text = [NSString stringWithFormat:@"%1.2f",self.student.grade];
}


#pragma mark - Actions

- (IBAction)actionReset:(UIButton *)sender {
    
    [self.student generateDataForStudent];
    [self fillLabelsWithStudentProperties];
    
    [self removeObserversForStudentProperties];
    
    NSLog(@"########## UPDATE DATA ##########");
    
    [self addObserversForStudentProperties];
}

- (IBAction)actionClear:(UIButton *)sender {
    
    [self.student clearData];
    [self fillLabelsWithStudentProperties];
    
    NSLog(@"########## UPDATE DATA ##########");
}

#pragma mark - KVO methods

- (void) addObserversForStudentProperties {
    
    [self.student addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.student addObserver:self forKeyPath:@"lastName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.student addObserver:self forKeyPath:@"dateOfBirth" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.student addObserver:self forKeyPath:@"gender" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.student addObserver:self forKeyPath:@"grade" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void) removeObserversForStudentProperties {
    
    [self.student removeObserver:self forKeyPath:@"firstName"];
    [self.student removeObserver:self forKeyPath:@"lastName"];
    [self.student removeObserver:self forKeyPath:@"dateOfBirth"];
    [self.student removeObserver:self forKeyPath:@"gender"];
    [self.student removeObserver:self forKeyPath:@"grade"];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    NSLog(@"\nkeyPath: %@\nofObject: %@\nchange: %@",keyPath, object, change);
}

@end
