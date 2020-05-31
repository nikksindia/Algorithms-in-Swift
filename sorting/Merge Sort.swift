import UIKit

//var array = [6,5,12,10,9,1]
var array = [14,7,3,12,9,11,6,2]

func mergeSort( ary: inout [Int], p: Int, r: Int) {
    if p < r {
        let q: Int = (p+r)/2
        // recursively break left half into subarrays untill left and right array sizes become 1
        mergeSort(ary: &ary, p: p, r: q)
         // recursively break right half into subarrays untill left and right array sizes become 1
        mergeSort(ary: &ary, p: q+1, r: r)
        //merge left and right sorted arrays
        merge(ary: &ary, p: p, q: q, r: r)
    }
}

func merge( ary: inout [Int], p: Int, q: Int, r: Int) {
    //left half array
    var aryLH: [Int] = []
    for temp in p...q {
        aryLH.append(ary[temp])
    }
    //right half array
    var aryRH: [Int] = []
    for temp in q+1...r {
        aryRH.append(ary[temp])
    }
    //current index of left half array
    var i = 0
    //current index of right half array
    var j = 0
    //current index of merged array in previous iteration
    var k = p

    //iterate untill any of the array from left or right half vanishes
    while i<aryLH.count && j<aryRH.count {
        //pick the smaller element from left and right half array
        // and put it at correct place in merged array in previous iteration
        if aryLH[i] <= aryRH[j] {
            ary[k] = aryLH[i]
            i += 1
        }else {
            ary[k] = aryRH[j]
            j += 1
        }
        k += 1
    }

    //check if left half array is not finished yet
    //pick the smaller element and put it at correct place in merged array in previous iteration
    while i < aryLH.count {
        ary[k] = aryLH[i]
        i += 1
        k += 1
    }
    //check if right half array is not finished yet
    //pick the smaller element and put it at correct place in merged array in previous iteration
    while j < aryRH.count {
        ary[k] = aryRH[j]
        j += 1
        k += 1
    }
}

mergeSort(ary: &array, p: 0, r: array.count-1)
print(array)



/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////Time Complexity Analysis////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
//Worst Case Time Complexity [ Big-O ]: O(n*log n)
//Best Case Time Complexity [Big-omega]: O(n*log n)
//Average Time Complexity [Big-theta]: O(n*log n)

//As we have already learned in Binary Search that whenever we divide a number into half in every stpe, it can be represented using a logarithmic function, which is log n.
//And to merge the subarrays, made by dividing the original array of n elements, a running time of O(n) will be required.
//Hence the total time for mergeSort function will become n(log n + 1), which gives us a time complexity of O(n*log n).

/////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Space Complexity Analysis////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
//Space Complexity: O(n)

//It requires equal amount of additional space as the unsorted array. Hence its not at all recommended for searching large unsorted arrays.
//It is the best Sorting technique used for sorting Linked Lists.










//    //number of elemnts in left half array
//    let n1 = (q-p)+1
//    //number of elements in right half array
//    let n2 = (r-(q+1))+1
