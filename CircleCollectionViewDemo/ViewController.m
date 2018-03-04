//
//  ViewController.m
//  CircleCollectionViewDemo
//
//  Created by He Shun on 2018/2/11.
//  Copyright © 2018年 He Shun. All rights reserved.
//

#import "ViewController.h"
#import "CircularCollectionViewLayout.h"
#import "CircularCollectionViewCell.h"

static NSString * const reuseIdentifier = @"ImageCollectionCell";

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
}

-(void)setupUI{
    [self.view addSubview:self.collectionView];
    
    [self.collectionView reloadData];
}

#pragma mark collectionView delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark collectionView datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建cell
    CircularCollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //给cell设置内容
    cell.contentView.layer.cornerRadius = 5;
    cell.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    cell.contentView.layer.borderWidth = 1;
//    cell.contentView.layer.shouldRasterize = YES;
//    cell.contentView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    cell.contentView.clipsToBounds = YES;
    

    NSString * imageName = [NSString stringWithFormat:@"book_%ld", (long)indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageName];

    return cell;
}


#pragma mark getters

-(UICollectionView *)collectionView{
    if(_collectionView == nil){
        //创建uicollectionview
        CircularCollectionViewLayout * layout = [[CircularCollectionViewLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        UIImageView * bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-dark"]];
        bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _collectionView.backgroundView = bgImageView;
        _collectionView.delaysContentTouches = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CircularCollectionViewCell self] forCellWithReuseIdentifier:reuseIdentifier];
        
    }
    
    return _collectionView;
}


@end
