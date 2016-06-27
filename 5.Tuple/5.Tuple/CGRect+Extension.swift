//
//  CGRect+Extension.swift
//  5.Tuple
//
//  Created by luzhiyong on 16/6/27.
//  Copyright © 2016年 2345. All rights reserved.
//

import CoreGraphics

func CGRectDivide(rect: CGRect, amount: CGFloat, edge: CGRectEdge) -> (slice: CGRect, remainder: CGRect) {
    var slice = CGRectZero
    var remainder = CGRectZero
    CGRectDivide(rect, &slice, &remainder, amount, edge)
    return (slice, remainder)
}
