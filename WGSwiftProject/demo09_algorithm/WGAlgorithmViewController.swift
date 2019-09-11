//
//  WGAlgorithmViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/8/28.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit


class WGAlgorithmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        testMethod()
    }
    
    func testMethod() {
        
        //无重复字符的最长子串长度
        /*
         let str01 = "abcbcbb"
         let length = lengthOfLongestSubstring(content: str01)
         print("---->\(length)")
         */
        
        //给定一个无序数组，找出某一元素后面第一个比它大的数字
        /*
         let arr = [9, 6, 5, 7, 3, 2, 1, 5, 9, 10]
         let resArr = getMaxArr(arr: arr)
         print("---->\n\(arr)\n\(resArr)")
         */
        
        //柯里化
        /*
         let res = add(num: 1)(2)
         print("---->\(res)")
         */
        
        //RLE算法，编写一个函数，实现统计字符次数的功能：
        /*
         例如输入为aaabbccc，输出为a3b2c3
         let res = sumOfCharacters(str: "aaabbccc")
         print(res ?? "")
         */
        
        //编程实现两个正整数的除法，当然不能用除法操作
        /*
         let res = division(dividend: 10, divisor: 11)
         print(res)
         */
        
        //二维数组中的查找
        /*
         let arr = [[1,2,3],[4,5,6],[7,8,9]]
         let find = WGTwoDimensionalArrayFind()
         let res = find.find(findArr: arr, member: 4)
         print(res)
         */
    
        //用二分法找到数组山峰值
        /*
         let arr = [1,2,1,3,5,6,4]
         let res = findPeakElement(array: arr)
         print(res)
         */
   
        //最长公共前缀
        /*
         let arr = ["flower","flow","flight"]
         let res = longestCommonPrefix(arr)
         print(res)
         */
    }
    
    //最长公共前缀
    /*
     直接抽出一个单词来，取其不同长度的从头开始的子串然后看看其他字符串是不是
     以这个字符串开头的，如果是就继续取更长的子串，如果不是就直接返回上一次子串
     的长度就OK了。
     */
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        let count = strs.count
        
        if count == 0 {
            return ""
        }
        
        if count == 1 {
            return strs[0]
        }
        
        var res = strs[0]
        for i in 1..<count {
            
            while !strs[i].hasPrefix(res) {
                
                res = String(res.prefix(res.count-1))
                if res.count == 0 {
                    return ""
                }
            }
        }
        return res
    }
    
    //用二分法找到数组山峰值
    func findPeakElement(array:Array<Int>) -> Int {
        
        let num = array.count
        if num == 1 {
            return 0
        }
        
        if array[0] > array[1] {
            return 0
        }
        
        if array[num-1] > array[num-2] {
            return num-1
        }
        
        var left = 0
        var right = num-1
        
        while (right-left > 0) {
            let mid = left + (right - left)/2
            if array[mid] > array[mid+1] {
                // 降序，结果在mid左边
                right = mid
            }else {
                // 升序，结果在mid右边
                left = mid + 1
            }
        }
        return left
    }
    
    //编程实现两个正整数的除法，当然不能用除法操作
    func division(dividend: Int, divisor: Int) -> Int {
        
        var divend = dividend
        
        if dividend < divisor {
            return 0
        }
        
        var res = 0
        while divend >= divisor {
            
            var multi = 1
            while divisor*multi <= divend >> 1 {
                
                multi = multi << 1
            }
            res += multi
            divend = divend - divisor*multi
        }
        return res
    }
    
    //RLE算法，编写一个函数，实现统计字符次数的功能：
    //例如输入为aaabbccc，输出为a3b2c3
    func sumOfCharacters(str:String?) -> String? {
        
        guard let str = str else {
            return nil;
        }
        
        var countDic = [Character:Int]()
        
        for character in str {
            
            let arr = countDic.keys;
            if (arr.contains(character)) {
                let count = countDic[character]
                countDic[character] = (count ?? 0) + 1
            }else {
                countDic[character] = 1
            }
        }
        
        var resStr = ""
        let dic = countDic.sorted { (arg01, arg02) -> Bool in
            return arg01.key<arg02.key
        }
        for (key, value) in dic {
            let kv = "\(key)" + "\(value)"
            resStr.append(kv)
        }
        return resStr;
    }
    
    //柯里化
    func add(num:Int) -> (Int)->Int {
        
        func vvv(aaa:Int)->Int{
            return num+aaa
        }
        return vvv(aaa:)
    }
    
    //柯里化
    func addTwo(num:Int) -> (Int)->Int {
        
        return {value in
            return num+value
        }
    }

    //给定一个无序数组，找出某一元素后面第一个比它大的数字
    /*
     比如9 6 5 7 3 2 1 5 9 10，返回的是 10 7 7 9 5 5 5 9 10 N。
     思路：用栈来实现。
     * 从第一个元素开始进栈，每次对栈顶元素和序列的下一个元素进行比较，直至找到第一个比它大的数再出栈。
     * 若栈顶元素小于序列元素，此序列元素即为后面第一个比它大的数，栈顶元素出栈，继续进行比较；若栈顶元素大于等于序列元素，则继续将此序列元素压栈，再进行下一轮比较；若栈为空，则压入当前正在比较的序列元素。
     * 若比较到最后一个元素同时栈为空或者最后一个元素依然小于等于栈顶元素，则比较结束。
     */
    func getMaxArr(arr:[Int]) -> [Int] {
        
        //返回的结果数组
        var maxArr:[Int] = [Int](repeating: 0, count: arr.count)
        //模拟栈
        var stack:[Int] = []
        
        for (index, _) in arr.enumerated() {
            
            var top = stack.last ?? 0
            while (!stack.isEmpty && arr[index]>arr[top]) {
                maxArr[top] = arr[index]
                stack.removeLast()
                if (!stack.isEmpty) {
                    top = stack.last!
                }
            }
            stack.append(index)
        }
        while !stack.isEmpty {
            let top = stack.removeLast()
            maxArr[top] = -1
        }
        return maxArr
    }
    
    //无重复字符的最长子串长度
    /*
     输入: "abcabcbb"
     输出: 3
     解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
     
     输入: "bbbbb"
     输出: 1
     解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
     
     解答思路:
     1.把第一个位置的字符用一个尺框住
     2.尺右侧的字符如果在原尺中不存在
     3.尺每次往右伸长1个字符长度，把这个字符包入尺中
     4.如果尺右边的字符在尺中存在，记录尺的长度，把当前重复的字符设为尺的左端，继续往右
     如果出现重复的内容，永远只需要比对上一个字符串的长度并记录当前位置即可
     */
    func lengthOfLongestSubstring(content:String) -> Int {
        
        //长度<=1时直接返回长度
        guard content.count > 1 else {
            return content.count
        }
        
        //存储返回的最长长度
        var maxLength = 0
        //存储无重复字符
        var charDic:[Character:Int] = [:]
        //记录无重复字符最开始位置(如果没有重复 为0; 如果有重复 为重复的位置)
        var leftIndex = 0
        
        for (i, char) in content.enumerated() {
            
            if let index = charDic[char] {
                //记录leftIndex和index哪个大 取大的 (前面的扔掉)
                leftIndex = max(leftIndex, index)
            }
            //长度取之前记录的长度和当前头到重复位置的长度中较长的
            maxLength = max(maxLength, (i-leftIndex+1))
            
            //之所以把char(内容)作为key是为了方便查找是否有相同的key
            //而i+1则是因为进入下一次循环时 i = i + 1了 ，再找i已经过去了
            charDic[char] = i+1
        }
        return maxLength
    }
    
}
