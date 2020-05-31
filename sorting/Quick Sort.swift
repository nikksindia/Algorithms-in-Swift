import UIKit

// Implementation of quick sort

var ary = [10, 80, 30, 90, 40, 50, 70]

func quickSort(array: inout [Int], low: Int, high:Int) {
    if low < high {
        //repeat these steps until low and high indexes don't cross each other
        let pivotIndex = partition(array: &array, low: low, high: high)
        //quick sort array from low to pivot (excluding pivot element)
        quickSort(array: &array, low: low, high: pivotIndex-1)
        //quick sort array from pivot to high (excluding pivot element)
        quickSort(array: &array, low: pivotIndex+1, high: high)
    }
}

func partition(array:inout [Int], low: Int, high: Int) -> Int {
    //take last element as pivot
    let pivot = array[high]
    //initialize i with low index
    var i = low
    for j in low...(high-1) {
        //swap when a[j] < pivot
        if array[j] < pivot {
            array.swapAt(i, j)
            i += 1
        }
    }
    //swap pivot element with elemnt at pivot index after this iteration
    array.swapAt(i, high)
    return i
}

quickSort(array: &ary, low: 0, high: ary.count-1)
print(ary)

///////////////////////////////////////////////////////////////////
////////////////////////////Iteration 1 ///////////////////////////
///////////////////////////////////////////////////////////////////
// low = 0, high = 6
// pivot = 70, i = 0, j = 0
// [10, 80, 30, 90, 40, 50, 70]
// i = 1, j = 1
// No Swap
//i = 1, j = 2
// [10, 30, 80, 90, 40, 50, 70]
//i = 2, j = 3
// No Swap
//i = 2, j = 4
//[10, 30, 40, 90, 80, 50, 70]
// i = 3, j = 5
//[10, 30, 40, 50, 80, 90, 70]
// i = 4 -------->>>> pivot index
//[10, 30, 40, 50, 70, 90, 80]
//<--Sort Left---><--><-Sort Right-->
//Exclude pivot element and keep that in same position
