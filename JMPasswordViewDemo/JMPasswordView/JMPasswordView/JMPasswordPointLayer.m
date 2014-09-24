//
//  JMPasswordPointLayer.m
//  JuumanUIKITDemo
//
//  Created by juuman on 14-9-22.
//  Copyright (c) 2014年 juuman. All rights reserved.
//

#import "JMPasswordPointLayer.h"
#import "JMPasswordView.h"

@implementation JMPasswordPointLayer
@synthesize highlighted;

- (void)drawInContext:(CGContextRef)ctx
{
    CGRect pointFrame = self.bounds;
    
    UIBezierPath *pointPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(jmPointBorderWidth, jmPointBorderWidth, pointFrame.size.width-2*jmPointBorderWidth, pointFrame.size.height-2*jmPointBorderWidth)
                                                         cornerRadius:pointFrame.size.height / 2.0];
    
    UIBezierPath *smallPointPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(pointFrame.size.width/2.0-jmSmallPointRadius, pointFrame.size.width/2.0-jmSmallPointRadius, 2*jmSmallPointRadius, 2*jmSmallPointRadius)
                                                              cornerRadius:jmSmallPointRadius];
    
    if (self.highlighted)
    {
        CGContextSetFillColorWithColor(ctx, jmPasswordPointHighlightColor.CGColor);
        CGContextSetStrokeColorWithColor(ctx, jmPasswordPointBorderHighlightColor.CGColor);
        CGContextSetLineWidth(ctx, jmPointBorderWidth);
        CGContextAddPath(ctx, pointPath.CGPath);
        CGContextDrawPath(ctx, kCGPathFillStroke);
        
        CGContextSetFillColorWithColor(ctx, jmPasswordSmallPointHighlightColor.CGColor);
        CGContextAddPath(ctx, smallPointPath.CGPath);
        CGContextDrawPath(ctx, kCGPathFill);
    }
    else{
        CGContextSetFillColorWithColor(ctx, jmPasswordPointColor.CGColor);
        CGContextSetStrokeColorWithColor(ctx, jmPasswordPointBorderColor.CGColor);
        CGContextSetLineWidth(ctx, jmPointBorderWidth);
        CGContextAddPath(ctx, pointPath.CGPath);
        CGContextDrawPath(ctx, kCGPathFillStroke);
        
        CGContextSetFillColorWithColor(ctx, jmPasswordSmallPointColor.CGColor);
        CGContextAddPath(ctx, smallPointPath.CGPath);
        CGContextDrawPath(ctx, kCGPathFill);
    }
    
}

@end
