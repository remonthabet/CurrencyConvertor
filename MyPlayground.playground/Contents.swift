import UIKit


///////////////////////////////  |.   //////////////////////////////////

func sumEqualTwelve() -> Int{
    return (3-1)*(-(3-9))
}

sumEqualTwelve()



///////////////////////////////  ||.   //////////////////////////////////

//string anagram
func checkForAnagram(firstString: String, secondString: String) -> Bool {
    guard firstString.count == secondString.count else { return false }
    return firstString.lowercased().sorted() == secondString.lowercased().sorted()
}

checkForAnagram(firstString: "debit card", secondString: "bad credit")



///////////////////////////////  |||.   //////////////////////////////////

//iterative Fibonacci
func iterativeFibonacci(n: Int) -> [Int] {

    guard n != 0 else { return [n] }

    var array = [0, 1]
    
    guard n != 1 else { return array }

    while array.count <= n {
        array.append(array[array.count - 1] + array[array.count - 2])
    }
    return array
}

iterativeFibonacci(n: 3)


//recursive Fibonacci
func recursiveFibonacci(n: Int) -> [Int] {

        var fibonacciArray = [Int]()

        for n in 0 ... n {

            if n == 0 {
                fibonacciArray.append(0)
            }
            else if n == 1 {
                fibonacciArray.append(1)
            }
            else {
                fibonacciArray.append (fibonacciArray[n-1] + fibonacciArray[n-2] )
            }
        }
        return fibonacciArray

}

recursiveFibonacci(n: 3)
