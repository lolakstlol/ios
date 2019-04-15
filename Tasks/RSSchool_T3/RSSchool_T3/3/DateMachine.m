#import "DateMachine.h"

@implementation DateMachine
- (void)viewDidLoad {
  [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.view.userInteractionEnabled = YES;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 450, 200, 80)];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    //NSDate *date = [formatter dateFromString:@"20/04/2004 04:20"];
    
    
    label.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:[NSDate date]]];
    [label setTag:1111];
    [self.view addSubview:label];
    [label release];
    
    
    UIButton* add = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 44)];
    UIButton* sub = [[UIButton alloc] initWithFrame:CGRectMake(10, 250, 100, 44)];
    [add setTitle:@"Add" forState:UIControlStateNormal];
    [sub setTitle:@"Sub" forState:UIControlStateNormal];
    [add setTag:2222];
    [sub setTag:3333];
    [add addTarget:self action:@selector(buttonAddClick:) forControlEvents:UIControlEventTouchUpInside];
    [sub addTarget:self action:@selector(buttonSubClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:add];
    [self.view addSubview:sub];
    [add release];
    [sub release];
    
    UITextField* dateOfBeginin = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 44)];
    UITextField* step = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 44) ];
    UITextField* unit = [[UITextField alloc] initWithFrame:CGRectMake(100, 300, 200, 44) ];
    
    step.layer.backgroundColor = [UIColor whiteColor].CGColor;
    unit.layer.backgroundColor = [UIColor whiteColor].CGColor;
    dateOfBeginin.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    step.placeholder = @"Step";
    unit.placeholder = @"Date unit";
    dateOfBeginin.placeholder = @"Start date";
    
    
    
    [self.view addSubview:step];
    [self.view addSubview:dateOfBeginin];
    [self.view addSubview:unit];
    
    [dateOfBeginin release];
    [step release];
    [unit release];
    
}


-(void) buttonAddClick :(id) sender {
    NSLog(@"buttonAddClick");
}

-(void) buttonSubClick :(id) sender {
      NSLog(@"buttonSubClick");
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}



@end
