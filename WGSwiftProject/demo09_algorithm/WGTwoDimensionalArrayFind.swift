//
//  WGTwoDimensionalArrayFind.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/9/10.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

//二维数组中的查找
/*
 在一个二维数组中，每一行都按照从左到右递增的顺序排序,每一列都按照从上到下递增的顺序排序
 请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
 利用二维数组由上到下，由左到右递增的规律，
 那么选取右上角或者左下角的元素a[row][col]与target进行比较，
 当target小于元素a[row][col]时，那么target必定在元素a所在行的左边,
 即col--；
 当target大于元素a[row][col]时，那么target必定在元素a所在列的下边,
 即row++；
 */

class WGTwoDimensionalArrayFind: NSObject {
    
    func find(findArr: [[Int]], member:Int) -> Bool{
    
        guard findArr.count > 0 && findArr[0].count > 0 else {
            
            return false
        }
        
        var colum = findArr[0].count-1
        var row = 0
        while row <= findArr.count-1 && colum >= 0 {
            
            let val = findArr[row][colum]
            if member == val {
                return true
            }else if member > val {
                row += 1
            }else {
                colum -= 1
            }
        }
        return false
    }
}


