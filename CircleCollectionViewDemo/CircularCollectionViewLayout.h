//
//  CircularCollectionViewLayout.h
//  CircleCollectionViewDemo
//
//  Created by He Shun on 2018/2/11.
//  Copyright © 2018年 He Shun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircularCollectionViewLayoutAttributes : UICollectionViewLayoutAttributes

@property (nonatomic, assign) CGPoint anchorPoint;//所有item围绕的中心点
@property (nonatomic, assign) CGFloat angle;

@end

@interface CircularCollectionViewLayout : UICollectionViewLayout

@end
