//
//  JMPasswordView.m
//  JuumanUIKITDemo
//
//  Created by juuman on 14-9-22.
//  Copyright (c) 2014年 juuman. All rights reserved.
//

#import "JMPasswordView.h"
#import "JMPasswordPointLayer.h"

@implementation JMPasswordView
@synthesize delegate;
@synthesize pointArr;
@synthesize pathLayer;
@synthesize pointIDArr;
@synthesize nowTouchPoint;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        
        pointArr=[NSMutableArray arrayWithCapacity:9];
        pointIDArr=[NSMutableArray arrayWithCapacity:9];
        JMPasswordPointLayer *jmPoint;
        for (int i = 0; i < 3; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                jmPoint = [JMPasswordPointLayer layer];
                [pointArr addObject:jmPoint];
                [self.layer addSublayer:jmPoint];
                [jmPoint setNeedsDisplay];
            }
        }
        pathLayer = [JMPasswordLineLayer layer];
        [self.layer addSublayer:pathLayer];
        [self setLayerFrames];
    }
    return self;
}

- (void) setLayerFrames
{
    CGPoint point;
    JMPasswordPointLayer *jmPoint;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            CGFloat x = jmPointLeftMargin+jmPointRadius+j*(jmPointRadius*2+jmPointBetweenMargin);
            CGFloat y = jmPointTopMargin+jmPointRadius+i*(jmPointRadius*2+jmPointBetweenMargin);
            point = CGPointMake(x, y);
            jmPoint = [pointArr objectAtIndex:i*3+j];
            jmPoint.frame = CGRectMake(x-jmPointRadius, y-jmPointRadius, jmPointRadius*2, jmPointRadius*2);
            [jmPoint setNeedsDisplay];
        }
    }
    pathLayer.frame = self.bounds;
    [pathLayer setNeedsDisplay];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    nowTouchPoint = [touch locationInView:self];
    
    JMPasswordPointLayer *jmPoint;
    for (int i = 0; i < 9; i++)
    {
        jmPoint = [self.pointArr objectAtIndex:i];
        if ([self containPoint:nowTouchPoint inCircle:jmPoint.frame])
        {
            jmPoint.highlighted = YES;
            [jmPoint setNeedsDisplay];
            break;
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch* touch = [touches anyObject];
    self.nowTouchPoint = [touch locationInView:self];
    JMPasswordPointLayer *jmPoint;
    for (int i = 0; i < 9; i++)
    {
        jmPoint = [self.pointArr objectAtIndex:i];
        if ([self containPoint:nowTouchPoint inCircle:jmPoint.frame])
        {
            if (![self hasVistedPoint:i])
            {
                jmPoint.highlighted = YES;
                [jmPoint setNeedsDisplay];
                [self.pointIDArr addObject:[NSNumber numberWithInt:i]];
                break;
            }
        }
    }
    pathLayer.pointIds=pointIDArr;
    pathLayer.nowPoint=nowTouchPoint;
    [pathLayer setNeedsDisplay];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    NSString* password = [self getPassword:pointIDArr];
    //密码输入完毕回调
    if (password.length >= jmPasswordMinLength)
    {
        [delegate JMPasswordView:self withPassword:password];
    }
    
    JMPasswordPointLayer *jmPoint;
    for (int i = 0; i < 9; i++)
    {
        jmPoint = [self.pointArr objectAtIndex:i];
        if (jmPoint.highlighted == YES)
        {
            jmPoint.highlighted = NO;
            [jmPoint setNeedsDisplay];
        }
    }
    [self.pointIDArr removeAllObjects];
    [self.pathLayer setNeedsDisplay];
}


- (BOOL)containPoint:(CGPoint)point inCircle:(CGRect)rect
{
    CGPoint center = CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2);
    BOOL isContain = ((center.x-point.x)*(center.x-point.x)+(center.y-point.y)*(center.y-point.y)-jmPointRadius*jmPointRadius)<0;
    return isContain;
}

- (BOOL)hasVistedPoint:(int)pointId
{
    BOOL hasVisit = NO;
    for (NSNumber* number in pointIDArr)
    {
        if ([number intValue] == pointId)
        {
            hasVisit = YES;
            break;
        }
    }
    return hasVisit;
}

- (NSString*)getPassword:(NSArray*)array
{
    NSMutableString* password = [[NSMutableString alloc] initWithCapacity:9];
    for (int i = 0; i < [array count]; i++)
    {
        NSNumber* number = [array objectAtIndex:i];
        [password appendFormat:@"%d",[number intValue]];
    }
    return password;
}

@end
