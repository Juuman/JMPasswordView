//
//  JMPasswordLineLayer.m
//  JuumanUIKITDemo
//
//  Created by juuman on 14-9-22.
//  Copyright (c) 2014年 juuman. All rights reserved.
//

#import "JMPasswordLineLayer.h"
#import "JMPasswordView.h"

@implementation JMPasswordLineLayer
@synthesize pointIds;
@synthesize nowPoint;


- (void)drawInContext:(CGContextRef)ctx
{
    
    if(pointIds.count<=0){
        return;
    }
    int pointId = [[pointIds objectAtIndex:0] intValue];
    CGPoint pointCenter = [self getPointWithId:pointId];
    CGContextSetLineWidth(ctx, jmPathWidth);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
        
    CGFloat *ColorComponents =(CGFloat *)CGColorGetComponents([jmPasswordLineColor CGColor]);
    CGContextSetRGBStrokeColor (ctx, ColorComponents[0], ColorComponents[1], ColorComponents[2], ColorComponents[3]);
    
    CGContextMoveToPoint(ctx, pointCenter.x, pointCenter.y);
    
    for (int i = 1; i < [pointIds count]; i++)
    {
        pointId = [[pointIds objectAtIndex:i] intValue];
        pointCenter = [self getPointWithId:pointId];
        CGContextAddLineToPoint(ctx, pointCenter.x, pointCenter.y);
    }
    
    pointCenter = nowPoint;
    CGContextAddLineToPoint(ctx, pointCenter.x, pointCenter.y);
    CGContextDrawPath(ctx, kCGPathStroke);
}

- (CGPoint)getPointWithId:(int)circleId
{
    CGFloat x = jmPointLeftMargin+jmPointRadius+circleId%3*(jmPointRadius*2+jmPointBetweenMargin);
    CGFloat y = jmPointTopMargin+jmPointRadius+circleId/3*(jmPointRadius*2+jmPointBetweenMargin);
    CGPoint point = CGPointMake(x, y);
    return point;
}

@end
