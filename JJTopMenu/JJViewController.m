//
//  JJViewController.m
//  JJTopMenu
//
//  Created by Jhon Lopez on 2/4/14.
//
//

#import "JJViewController.h"

@interface JJViewController ()

@property (nonatomic, strong) JJTopMenuViewController *menuVC;

@property (nonatomic, copy) NSString *menuOne;
@property (weak, nonatomic) IBOutlet UITextField *badgeText;


@end

@implementation JJViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	
    
    JJMenuItem *menuItem = [JJMenuItem initWithTitle:@"item 1" image:nil badgeValue:@"" keyPath:@"menuOne"];
    
    self.menuVC = [[JJTopMenuViewController alloc] initWithMenuItems:@[menuItem, [JJMenuItem initWithTitle:@"item 2" image:[UIImage imageNamed:@"pinetree"] badgeValue:nil],[JJMenuItem initWithTitle:@"item 3" image:[UIImage imageNamed:@"fuel"] badgeValue:nil]] selectedItemColor:[UIColor redColor] selectedItemTextColor:[UIColor grayColor] itemTextColor:[UIColor blueColor]];
    
    
    [self addObserver:menuItem forKeyPath:menuItem.keyPathForObserving options:NSKeyValueObservingOptionNew context:MessagesContext];
    
    
    self.menuVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.menuVC.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 60);
    
    [self.menuVC setMenuPosition:JJMenuPositionBottom];
    
    
    
    
    //Badge
    
    [self.view addSubview:self.menuVC.view];
    self.menuVC.delegate = self;
    [self.menuVC selectMenuItemAtIndex:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JJTopMenuDelegate
-(void)topMenu:(JJTopMenuViewController *)menu didSelectMenuItemAtIndex:(NSUInteger)index
{
    NSLog(@"Selected menu at index: %d", index);
    
    switch (index) {
        case 0:
            [self.menuVC setMenuPosition:JJMenuPositionBottom];
            
            [self.menuVC setSelectedItemColor:[UIColor greenColor]];
            
            [self.menuVC setSelectedItemTextColor:[UIColor darkGrayColor]];
            
            [self.menuVC setItemTextColor:[UIColor blueColor]];
            
            [self.view setBackgroundColor:[UIColor whiteColor]];
            
            NSLog(@"Menu Index: %lu", (unsigned long)[self.menuVC getIndexForSelectedMenu]);
            
            break;
        case 1:
            [self.menuVC setMenuPosition:JJMenuPositionTop];
            
            [self.menuVC setSelectedItemColor:[UIColor orangeColor]];
            
            [self.menuVC setSelectedItemTextColor:[UIColor cyanColor]];
            
            [self.menuVC setItemTextColor:[UIColor yellowColor]];
            
            [self.view setBackgroundColor:[UIColor blackColor]];
            
            NSLog(@"Menu Index: %lu", (unsigned long)[self.menuVC getIndexForSelectedMenu]);
            break;
        default:
            [self.menuVC setMenuPosition:JJMenuPositionBottom];
            
            [self.menuVC setSelectedItemColor:[UIColor brownColor]];
            
            [self.menuVC setSelectedItemTextColor:[UIColor magentaColor]];
            
            [self.menuVC setItemTextColor:[UIColor redColor]];
            
            [self.view setBackgroundColor:[UIColor lightGrayColor]];
            
            NSLog(@"Menu Index: %lu", (unsigned long)[self.menuVC getIndexForSelectedMenu]);
            break;
    }
    
}

- (IBAction)changeItemOneValue:(id)sender {
    self.menuOne = self.badgeText.text;
}

@end
