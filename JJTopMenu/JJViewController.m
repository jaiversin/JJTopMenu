//
//  JJViewController.m
//  JJTopMenu
//
//  Created by Jhon Lopez on 2/4/14.
//
//

#import "JJViewController.h"
#import "JJTopMenuViewController.h"

@interface JJViewController ()

@property (nonatomic, strong) JJTopMenuViewController *menuVC;

@end

@implementation JJViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	
    
    self.menuVC = [[JJTopMenuViewController alloc] initWithMenuItems:@[[JJMenuItem initWithTitle:@"item 1" image:[UIImage imageNamed:@"forkandknife"] badgeValue:nil], [JJMenuItem initWithTitle:@"item 2" image:[UIImage imageNamed:@"pinetree"] badgeValue:nil],[JJMenuItem initWithTitle:@"item 3" image:[UIImage imageNamed:@"fuel"] badgeValue:nil]] selectedItemColor:[UIColor redColor] selectedItemTextColor:[UIColor grayColor] itemTextColor:[UIColor blueColor]];
    
    self.menuVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.menuVC.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 60);
    
    [self.menuVC setMenuPosition:JJMenuPositionBottom];
    
    [self.view addSubview:self.menuVC.view];
    self.menuVC.delegate = self;
    
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
            break;
        case 1:
            [self.menuVC setMenuPosition:JJMenuPositionTop];
            
            [self.menuVC setSelectedItemColor:[UIColor orangeColor]];
            
            [self.menuVC setSelectedItemTextColor:[UIColor cyanColor]];
            
            [self.menuVC setItemTextColor:[UIColor yellowColor]];
            break;
        default:
            [self.menuVC setMenuPosition:JJMenuPositionBottom];
            
            [self.menuVC setSelectedItemColor:[UIColor brownColor]];
            
            [self.menuVC setSelectedItemTextColor:[UIColor magentaColor]];
            
            [self.menuVC setItemTextColor:[UIColor redColor]];
            break;
    }
    
}

@end
