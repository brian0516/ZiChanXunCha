//
//  SLSegmentController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/29.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLSegmentController.h"

@interface SLSegmentController ()

@property(nonatomic,strong)UIColor * normalColor;
@property(nonatomic,strong)UIColor * selectedColor;
@property(nonatomic,strong)UIView * indicatorLine;
@property (nonatomic,strong)NSArray * titleLabels;

@property (nonatomic,assign)CGFloat indicatorX;

@property (nonatomic,assign)NSInteger  selectedIndex;

@property (nonatomic,strong)UIView * line;


@end

@implementation SLSegmentController

-(instancetype)initWithTitles:(NSArray*)titles{
    self = [super init];
    if (self) {
        self.selectedIndex = 0;
        self.normalColor = [UIColor colorWithHexString:@"666666"];
        self.selectedColor = [UIColor colorWithHexString:@"0076dd"];
        
        self.indicatorX = 0;
        self.titleLabels = [self createLabels:titles];
        _itemCount = self.titleLabels.count;
    }
    return self;
}


-(NSArray*)createLabels:(NSArray*)titles{
    NSMutableArray * array = [NSMutableArray array];
    
    NSInteger tag = 100;
    
    for (NSString * title in titles) {
        UILabel * label = [[UILabel alloc]init];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTap:)];
        label.tag = tag;
        [label addGestureRecognizer:tap];
        label.userInteractionEnabled = YES;
        [self addSubview:label];
        [array addObject:label];
        
        if (tag == 100) {
            label.textColor = self.selectedColor;
        }
        else{
            label.textColor = self.normalColor;
        }
        
        tag++;
        
    }
    return (NSArray*)array;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    DefineWeakSelf;
    CGFloat width = self.width/self.titleLabels.count;
    NSInteger index = 0;
    
    for (UILabel * label in self.titleLabels) {
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.equalTo(weakSelf);
            make.centerY.equalTo(weakSelf);
            make.left.equalTo(@(0)).offset(width*index);
            make.width.equalTo(@(width));
            
        }];
     
        index++;
    }
    
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1));
        make.bottom.equalTo(weakSelf);
        make.width.equalTo(weakSelf);
        make.left.equalTo(@(0));
    }];
    
}



-(void)labelTap:(UITapGestureRecognizer*)tap{

    UILabel * label = (UILabel*)tap.view;
    NSInteger index = label.tag-100;
    
    if (index == self.selectedIndex) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(segment:didSelectedAtIndex:)]) {
        [self.delegate segment:self didSelectedAtIndex:index];
    }
    
    [self setSelectedIndex:index];
    
    CGFloat indicatorX = index*(self.width/self.itemCount);
    [self upDateIndicatorConstrait:indicatorX animate:YES];
    
}


-(void)setSelectedIndex:(NSInteger)selectedIndex{

    UILabel * originalLabel = self.titleLabels[_selectedIndex];
    originalLabel.textColor = self.normalColor;
    
    _selectedIndex = selectedIndex;
    UILabel * selectedLabel = self.titleLabels[selectedIndex];
    selectedLabel.textColor = self.selectedColor;
    
}



-(void)updateConstraints{

    DefineWeakSelf;
    CGFloat width = self.width/self.titleLabels.count;
    [self.indicatorLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.indicatorX));
            make.width.equalTo(@(width));
            make.height.equalTo(@(2));
            make.top.equalTo(weakSelf.mas_bottom).offset(-2);
    }];
    [super updateConstraints];
}

-(void)upDateIndicatorConstrait:(CGFloat)indicatorX animate:(BOOL)animate{

    self.indicatorX = indicatorX;
    
    [self setNeedsUpdateConstraints];

    [self updateConstraintsIfNeeded];

    if (animate) {
        [UIView animateWithDuration:0.2 animations:^{
            
            [self layoutIfNeeded];
             }];
    }
    else{
        [self layoutIfNeeded];
    }

   
}


-(UIView *)indicatorLine{
    if (!_indicatorLine) {
        _indicatorLine = [[UIView alloc]init];
        _indicatorLine.backgroundColor = self.selectedColor;
        [self addSubview:_indicatorLine];
    }
    return _indicatorLine;
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = UIColorHex(bdc8d9);
        [self addSubview:_line];
    }
    return _line;
}


@end
