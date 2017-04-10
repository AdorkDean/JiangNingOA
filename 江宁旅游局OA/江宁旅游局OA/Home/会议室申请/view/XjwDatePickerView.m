//
//  XjwDatePickerView.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/7.
//  Copyright © 2016年 xujw. All rights reserved.
//

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width

#import "XjwDatePickerView.h"

@interface XjwDatePickerView()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSInteger yearRange;
    NSInteger dayRange;
    NSInteger startYear;
    NSInteger selectedYear;
    NSInteger selectedMonth;
    NSInteger selectedDay;
    NSInteger selectedHour;
    NSInteger selectedMinute;
    NSInteger selectedSecond;
    NSCalendar *calendar;

}

//@property (nonatomic, copy) NSArray *provinces;
//@property (nonatomic, copy) NSArray *selectedArray;
@property (weak,nonatomic)UIView *bgView;    //屏幕下方看不到的view
@property (weak, nonatomic) UIPickerView *pickerView;
//@property (strong,nonatomic)NSArray *dataArray;   // 用来记录传递过来的数组数据
@property (strong,nonatomic)NSString *headTitle;  //传递过来的标题头字符串
@property (strong,nonatomic)NSString *backString; //回调的字符串

@property (weak,nonatomic)UILabel *titleLabel; //中间显示的标题lab
@property (weak,nonatomic)UIButton *cancelButton;
@property (weak,nonatomic)UIButton *doneButton;

@end

@implementation XjwDatePickerView

+ (instancetype)XjwDatePickerWithHeadTitle:(NSString *)headTitle AndCall:(XjwDatePickerViewBlock)callBack{
    XjwDatePickerView *pickerView = [[XjwDatePickerView alloc] initWithFrame:[UIScreen mainScreen].bounds andHeadTitle:headTitle];
    pickerView.callBack = callBack;
    return pickerView;
}

- (instancetype)initWithFrame:(CGRect)frame andHeadTitle:(NSString *)headTitle
{
    self = [super initWithFrame:frame];
    if (self) {
        _headTitle = headTitle;
        [self setUI];
        NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
        comps = [calendar0 components:unitFlags fromDate:[NSDate date]];
        NSInteger year = [comps year];
        
        startYear = year - 50;
        yearRange = 100;
        selectedYear = 2000;
        selectedMonth = 1;
        selectedDay = 1;
        selectedHour = 0;
        selectedMinute = 0;
        dayRange=[self isAllDay:startYear andMonth:1];
    }
    return self;
}

- (void)setUI{
    //首先创建一个位于屏幕下方看不到的view
    UIView* bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.45];
    bgView.alpha = 0.0f;
    UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [bgView addGestureRecognizer:g];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:bgView];
    self.bgView = bgView;
    
    //  标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width/2-50, 5, 100, 20)];
    titleLabel.font = [UIFont systemFontOfSize:18];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:_headTitle];
    [titleLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    //取消按钮
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(2, 5, KScreenWidth*0.2, 20);
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"取消" attributes:@{ NSForegroundColorAttributeName: [UIColor grayColor],NSFontAttributeName : [UIFont systemFontOfSize:14],NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone) }];
    [cancelButton setAttributedTitle:attrString forState:UIControlStateNormal];
    cancelButton.adjustsImageWhenHighlighted = NO;
    cancelButton.backgroundColor = [UIColor clearColor];
    [cancelButton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    self.cancelButton = cancelButton;
    
    //完成按钮
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(KScreenWidth-KScreenWidth*0.2-2, 5, KScreenWidth*0.2, 20);
    NSAttributedString *attrString2 = [[NSAttributedString alloc] initWithString:@"完成" attributes: @{ NSForegroundColorAttributeName: [UIColor grayColor],NSFontAttributeName : [UIFont systemFontOfSize:14],NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone) }];
    [doneButton setAttributedTitle:attrString2 forState:UIControlStateNormal];
    doneButton.adjustsImageWhenHighlighted = NO;
    doneButton.backgroundColor = [UIColor clearColor];
    [doneButton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:doneButton];
    self.doneButton = doneButton;
    
    //选择器
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(5,22, SCREEN_SIZE.width-10, 230)];
    
    [pickerView setShowsSelectionIndicator:YES];
    [pickerView setDelegate:self];
    [pickerView setDataSource:self];
    self.pickerView = pickerView;
    [self addSubview:pickerView];
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    //self
    self.backgroundColor = [UIColor whiteColor];
    [self setFrame:CGRectMake(0, SCREEN_SIZE.height-300, SCREEN_SIZE.width , 300)];
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    [self setFrame: CGRectMake(0, SCREEN_SIZE.height,SCREEN_SIZE.width , 255)];
    
    
    
//    [self dismissPicker];
}

- (void)clicked:(UIButton *)sender
{
    if ([sender isEqual:self.cancelButton]) {
        [self dismissPicker];
    }else{
        if (self.callBack) {
            self.callBack(self,_backString);
            [self dismissPicker];
        }
    }
}

- (void)tap
{
    [self dismissPicker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}


//确定每一列返回的东西
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
        {
            return yearRange;
        }
            break;
        case 1:
        {
            return 12;
        }
            break;
        case 2:
        {
            return dayRange;
        }
            break;
        case 3:
        {
            return 24;
        }
            break;
        case 4:
        {
            return 60;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

#pragma mark -- UIPickerViewDelegate
/*
//默认时间的处理
-(void)setCurDate:(NSDate *)curDate
{
    //获取当前时间
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    comps = [calendar0 components:unitFlags fromDate:curDate];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    
    selectedYear = year;
    selectedMonth = month;
    selectedDay = day;
    selectedHour = hour;
    selectedMinute = minute;
    
    dayRange=[self isAllDay:year andMonth:month];
    
    [self.pickerView selectRow:year - startYear inComponent: 0 animated:true];
    [self.pickerView selectRow:month - 1 inComponent: 1 animated:true];
    [self.pickerView selectRow:day - 1 inComponent: 2 animated:true];
    [self.pickerView selectRow:hour inComponent: 3 animated:true];
    [self.pickerView selectRow:minute inComponent: 4 animated:true];
    
    [self.pickerView reloadAllComponents];
}
*/
-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth*component / 6.0, 0,KScreenWidth / 6.0, 30)];
    label.font=[UIFont systemFontOfSize:15.0];
    label.tag=component * 100 + row;
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor = [UIColor redColor];
    switch (component) {
        case 0:
        {
            label.frame=CGRectMake(5, 0,KScreenWidth / 4.0, 30);
            label.text=[NSString stringWithFormat:@"%ld 年",(long)(startYear + row)];
        }
            break;
        case 1:
        {
            label.frame=CGRectMake(KScreenWidth/4.0, 0, KScreenWidth/8.0, 30);
            label.text=[NSString stringWithFormat:@"%ld 月",(long)row+1];
        }
            break;
        case 2:
        {
            label.frame=CGRectMake(KScreenWidth*3/8, 0, KScreenWidth/8.0, 30);
            label.text=[NSString stringWithFormat:@"%ld 日",(long)row+1];
        }
            break;
        case 3:
        {
            label.textAlignment=NSTextAlignmentRight;
            label.text=[NSString stringWithFormat:@"%ld 时",(long)row];
        }
            break;
        case 4:
        {
            label.textAlignment=NSTextAlignmentRight;
            label.text=[NSString stringWithFormat:@"%ld 分",(long)row];
        }
            break;
        case 5:
        {
            label.textAlignment=NSTextAlignmentRight;
            label.frame=CGRectMake(KScreenWidth * component/6.0, 0, KScreenWidth/6.0-5, 30);
            label.text=[NSString stringWithFormat:@"%ld 秒",(long)row];
        }
            break;
            
        default:
            break;
    }
    return label;
}

#pragma mark - 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
// 监听picker的滑动
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            selectedYear=startYear + row;
            dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 1:
        {
            selectedMonth=row+1;
            dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 2:
        {
            selectedDay=row+1;
        }
            break;
        case 3:
        {
            selectedHour=row;
        }
            break;
        case 4:
        {
            selectedMinute=row;
        }
            break;
            
        default:
            break;
    }
    //%ld-selectedYear
    _backString =[NSString stringWithFormat:@"%.2ld-%.2ld %.2ld:%.2ld",selectedMonth,selectedDay,selectedHour,selectedMinute];
    
}

- (void)show
{
    [UIView animateWithDuration:0.8f delay:0 usingSpringWithDamping:0.9f initialSpringVelocity:0.7f options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews animations:^{
        
        [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
        self.bgView.alpha = 1.0;
        
        self.frame = CGRectMake(0, SCREEN_SIZE.height-250, SCREEN_SIZE.width, 250);
    } completion:NULL];
}

- (void)dismissPicker
{
    [UIView animateWithDuration:0.8f delay:0 usingSpringWithDamping:0.9f initialSpringVelocity:0.7f options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews animations:^{
        self.bgView.alpha = 0.0;
        self.frame = CGRectMake(0, SCREEN_SIZE.height,SCREEN_SIZE.width , 250);
        
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
        [self removeFromSuperview];
        
    }];
}


#pragma mark -- setter getter
//- (NSArray *)provinces {
//    if (!_provinces) {
//        self.provinces = [@[] mutableCopy];
//    }
//    return _provinces;
//}

//- (NSArray *)selectedArray {
//    if (!_selectedArray) {
//        self.selectedArray = [@[] mutableCopy];
//    }
//    return _selectedArray;
//}




-(NSInteger)isAllDay:(NSInteger)year andMonth:(NSInteger)month
{
    int day=0;
    switch(month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day=31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            day=30;
            break;
        case 2:
        {
            if(((year%4==0)&&(year%100!=0))||(year%400==0))
            {
                day=29;
                break;
            }
            else
            {
                day=28;
                break;
            }
        }
        default:
            break;
    }
    return day;
}

@end
