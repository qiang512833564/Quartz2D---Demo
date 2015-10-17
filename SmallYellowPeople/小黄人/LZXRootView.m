//
//  LZXRootView.m
//  小黄人
//
//  Created by 刘泽祥 on 15/4/7.
//  Copyright (c) 2015年 刘泽祥. All rights reserved.
//

#import "LZXRootView.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation LZXRootView

- (void)drawRect:(CGRect)rect{
    
    // 获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    {
        // 背景
        [self drawBackGroundInContext:ctx];
        
        // 头发
        [self drawHairInContext:ctx];
        
        // 身体
        [self drawBodyInContext:ctx];
        
        // 眼镜 + 眼睛
        [self drawGlasses:ctx];
        
        // 嘴
        [self drawMouse:ctx];
    }
    
    
}

// 背景
- (void)drawBackGroundInContext:(CGContextRef)context{
    // 保存之前的上下文
    CGContextSaveGState(context);
    
    // 创建色彩空间对象
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    // 创建起点颜色
    CGColorRef beginColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.99f, 0.01f, 0.01f, 1.0f});
    
    // 创建终点颜色
    CGColorRef endColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.01f, 0.01f, 0.01f, 1.0f});
    
    // 创建颜色数组
    CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor, endColor}, 2, nil);
    
    // 创建渐变对象
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, colorArray, (CGFloat[]){
        0.0f,       // 对应起点颜色位置
        1.0f        // 对应终点颜色位置
    });
    
    // 释放颜色数组
    CFRelease(colorArray);
    
    // 释放起点和终点颜色
    CGColorRelease(beginColor);
    CGColorRelease(endColor);
    
    // 释放色彩空间
    CGColorSpaceRelease(colorSpaceRef);
    
    //     kCGGradientDrawsBeforeStartLocation    开始位置之外的也画
    //     kCGGradientDrawsAfterEndLocation       结束位置之外的也画
//    CGContextDrawLinearGradient(context, gradientRef, CGPointMake(0.0f, 0.0f), CGPointMake(320.0f, 460.0f), 0);
    CGContextDrawRadialGradient(context, gradientRef, self.center, 5, self.center, 300, kCGGradientDrawsAfterEndLocation | kCGGradientDrawsBeforeStartLocation);
    
    // 释放渐变对象
    CGGradientRelease(gradientRef);
    
    {
//    // 设定渐变颜色
//    CGFloat colors [] = {
//        1.0, 0.0, 0.0, 1.0,
//        0.6, 0.0, 0.0, 1.0,
//        0.0, 0.0, 0.0, 1.0
//    };
//    CGFloat locations[] = {
//        0.0f,0.5f,1.0f
//    };
//    
//    // 创建色彩空间对象
//    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, locations, sizeof(colors)/(sizeof(colors[0])*4));
//    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
//    
//    CGRect aRect = CGContextGetClipBoundingBox(context);
//    
////    CGRect aRect = CGRectInset(CGContextGetClipBoundingBox(context), 50.0f, 20.0f);
//    
//    CGContextClipToRect(context, aRect);
//    
////    CGPoint startPoint = CGPointMake(CGRectGetMidX(aRect), CGRectGetMinY(aRect));
//    
//    CGPoint startPoint = CGPointMake(aRect.size.width / 2, aRect.size.height / 2);
////    CGPoint endPoint = CGPointMake(CGRectGetMidX(aRect), CGRectGetMaxY(aRect));
//
////     kCGGradientDrawsBeforeStartLocation    开始位置之外的也画
//    // kCGGradientDrawsAfterEndLocation        结束位置之外的也画
//    // 0                                    正常状态
//    
//    CGContextDrawRadialGradient(context, gradient, startPoint, 10, startPoint, 400, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
////    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
//    CGGradientRelease(gradient), gradient = NULL;
//    
//    CGContextDrawPath(context, kCGPathStroke);
    }
    
    
    // 还原之前的上下文
    CGContextRestoreGState(context);
}

// 头发 头发底部为100 + 60
- (void)drawHairInContext:(CGContextRef)ctx{
    // 保存上下文
    CGContextSaveGState(ctx);
    
    CGFloat minYOfHair = 100;
    
    // 左边第一根头发
    CGContextMoveToPoint(ctx, self.center.x - 80, minYOfHair + 20);
    CGContextAddQuadCurveToPoint(ctx, self.center.x, minYOfHair + 10, self.center.x, minYOfHair + 60);
    
    // 右边第一根头发
    CGContextMoveToPoint(ctx, self.center.x + 80, minYOfHair + 20);
    CGContextAddQuadCurveToPoint(ctx, self.center.x, minYOfHair + 10, self.center.x, minYOfHair + 60);
    
    // 左边第二根头发
    CGContextMoveToPoint(ctx, self.center.x - 50, minYOfHair + 10);
    CGContextAddQuadCurveToPoint(ctx, self.center.x, minYOfHair + 5, self.center.x, minYOfHair + 60);
    
    // 右边第二根头发
    CGContextMoveToPoint(ctx, self.center.x + 50, minYOfHair + 10);
    CGContextAddQuadCurveToPoint(ctx, self.center.x, minYOfHair + 5, self.center.x, minYOfHair + 60);
    
    // 左边第三根头发
    CGContextMoveToPoint(ctx, self.center.x - 20, minYOfHair + 5);
    CGContextAddQuadCurveToPoint(ctx, self.center.x, minYOfHair + 10, self.center.x, minYOfHair + 60);
    
    // 右边第三根头发
    CGContextMoveToPoint(ctx, self.center.x + 20, minYOfHair + 5);
    CGContextAddQuadCurveToPoint(ctx, self.center.x, minYOfHair + 10, self.center.x, minYOfHair + 60);
    
    // 中间的头发
    CGContextMoveToPoint(ctx, self.center.x, minYOfHair);
    CGContextAddLineToPoint(ctx, self.center.x, minYOfHair + 60);
    
    CGContextStrokePath(ctx);
    
    
    // 恢复上下文
    CGContextRestoreGState(ctx);
}

// 身体
- (void)drawBodyInContext:(CGContextRef)ctx{
    // 保存上下文
    CGContextSaveGState(ctx);
    
    CGFloat maxHair = 160 - 20;
    
    CGFloat bodyRadius = 100;
    
    CGFloat bodyHeight = 200;
    
//    CGContextMoveToPoint(ctx, self.center.x - bodyRadius, maxHair + bodyRadius + bodyHeight);
    CGContextAddArc(ctx, self.center.x, maxHair + bodyRadius, bodyRadius, M_PI, 0, 0);
    CGContextAddArc(ctx, self.center.x, maxHair + bodyRadius + bodyHeight, bodyRadius, 0, M_PI, 0);
    CGContextClosePath(ctx);
    
    CGContextClip(ctx);
    
    
    
    
    {
        // 创建色彩空间对象
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        
        // 创建起点颜色
        CGColorRef endColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.99f, 200.0 / 255, 22.0 / 255, 1.0f});
        
        // 创建终点颜色
        CGColorRef beginColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.99f, 0.99f, 0.88f, 1.0f});
        
        // 创建颜色数组
        CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor, endColor}, 2, nil);
        
        // 创建渐变对象
        CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, colorArray, (CGFloat[]){
            0.0f,       // 对应起点颜色位置
            1.0f        // 对应终点颜色位置
        });
        
        // 释放颜色数组
        CFRelease(colorArray);
        
        // 释放起点和终点颜色
        CGColorRelease(beginColor);
        CGColorRelease(endColor);
        
        // 释放色彩空间
        CGColorSpaceRelease(colorSpaceRef);
        
        //     kCGGradientDrawsBeforeStartLocation    开始位置之外的也画
        //     kCGGradientDrawsAfterEndLocation       结束位置之外的也画
//            CGContextDrawLinearGradient(ctx, gradientRef, CGPointMake(0.0f, 0.0f), CGPointMake(320.0f, 460.0f), 0);
        CGContextDrawRadialGradient(ctx, gradientRef, CGPointMake(self.center.x - 90, maxHair + bodyRadius), 5, CGPointMake(self.center.x - 60, maxHair + bodyRadius), 200, kCGGradientDrawsAfterEndLocation | kCGGradientDrawsBeforeStartLocation);
        
        // 释放渐变对象
        CGGradientRelease(gradientRef);
    }
    
    
    
    
    
    // 渲染
    CGContextStrokePath(ctx);
    
    // 恢复上下文
    CGContextRestoreGState(ctx);
    
}

// 眼镜
- (void)drawGlasses:(CGContextRef)ctx{
    // 保存上下文
    CGContextSaveGState(ctx);
    
    
    
    CGFloat maxHair = 160 - 20;
    
    CGFloat bodyRadius = 100;
    
    CGFloat glassRadius = 35;
    
    CGFloat noseWith = 15;
    
    CGFloat horizionblePosition = maxHair + bodyRadius + 10;
    
    CGFloat eyeRadius = 20;
    
    CGFloat pupilRadius = 10;
    
    CGFloat flashRadius = 4;
    
    // 镜柄
    CGContextMoveToPoint(ctx, self.center.x - bodyRadius - 5, horizionblePosition);
    CGContextAddLineToPoint(ctx, self.center.x + bodyRadius + 5, horizionblePosition);
    
    CGContextSetLineWidth(ctx, 20);
    
    CGContextStrokePath(ctx);
    
    // 眼白
    CGContextAddArc(ctx, self.center.x - glassRadius - noseWith, horizionblePosition, glassRadius, 0, M_PI * 2, 1);
    [[UIColor whiteColor] setFill];
    CGContextFillPath(ctx);
    
    CGContextAddArc(ctx, self.center.x + glassRadius + noseWith, horizionblePosition, glassRadius, 0, M_PI * 2, 1);
    CGContextFillPath(ctx);
    
    // 镜框
    CGContextAddArc(ctx, self.center.x - glassRadius - noseWith, horizionblePosition, glassRadius, 0, M_PI * 2, 1);
    CGContextSetLineWidth(ctx, 15);
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, self.center.x + glassRadius + noseWith, horizionblePosition, glassRadius, 0, M_PI * 2, 1);
    CGContextStrokePath(ctx);
    
    // 眼珠
    CGContextAddArc(ctx, self.center.x - eyeRadius - noseWith - 10, horizionblePosition, eyeRadius, 0, M_PI * 2, 1);
    [[UIColor brownColor] setFill];
    CGContextFillPath(ctx);
    
    CGContextAddArc(ctx, self.center.x + eyeRadius + noseWith + 10, horizionblePosition, eyeRadius, 0, M_PI * 2, 1);
    CGContextFillPath(ctx);
    
    // 瞳孔
    CGContextAddArc(ctx, self.center.x - eyeRadius - noseWith - 10, horizionblePosition, pupilRadius, 0, M_PI * 2, 1);
    [[UIColor blackColor] setFill];
    CGContextFillPath(ctx);
    
    CGContextAddArc(ctx, self.center.x + eyeRadius + noseWith + 10, horizionblePosition, pupilRadius, 0, M_PI * 2, 1);
    CGContextFillPath(ctx);
    
    // 瞳孔反光
    CGContextAddArc(ctx, self.center.x - eyeRadius - noseWith - 15, horizionblePosition - 5, flashRadius, 0, M_PI * 2, 1);
    [[UIColor whiteColor] setFill];
    CGContextFillPath(ctx);
    
    CGContextAddArc(ctx, self.center.x + eyeRadius + noseWith + 5, horizionblePosition - 5, flashRadius, 0, M_PI * 2, 1);
    CGContextFillPath(ctx);
    
    // 恢复上下文
    CGContextRestoreGState(ctx);
}

// 嘴
- (void)drawMouse:(CGContextRef)ctx{
    // 保存上下方
    CGContextSaveGState(ctx);
    
    CGFloat maxHair = 160 - 20;
    
    CGFloat bodyRadius = 100;
    
    CGFloat horizionblePosition = maxHair + bodyRadius + 10 + 70;
    
    CGContextMoveToPoint(ctx, self.center.x - 30, horizionblePosition);
    CGContextAddQuadCurveToPoint(ctx, self.center.x, horizionblePosition + 10, self.center.x + 30, horizionblePosition);
    
    CGContextFillPath(ctx);
    
    
    // 恢复上下文
    CGContextRestoreGState(ctx);
}

@end
