/***************************************************
 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 반환하기
 ex) 5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
 ***************************************************/
print("\n---------- [  ] ----------\n")

func sumNumbers(_ num: Int) -> Int {
  let lowerBound = min(1, num)
  let upperBound = max(1, num)
  var sum = 0
  for i in lowerBound...upperBound {
    sum += i
  }
  return sum
}

sumNumbers(5)
sumNumbers(-2)
sumNumbers(-5)

/***************************************************
 입력받은 숫자의 모든 자리 숫자 합계를 반환하기
 e.g. 123 -> 6 ,  5678 -> 26
 ***************************************************/
print("\n---------- [  ] ----------\n")

func sumAllDigits(_ num: Int) -> Int {
  var currentState = num
  var sum = 0

  while currentState != 0 {
    sum += currentState % 10
    currentState /= 10
  }
  return sum
}

sumAllDigits(123)
sumAllDigits(5678)


/***************************************************
 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
 e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
 ***************************************************/
print("\n---------- [ ] ----------\n")

func 삼육구삼육구(num: Int) {
  for i in 1...num {
    let strNum = String(i)
    let has369 = strNum.contains { ["3", "6", "9"].contains($0) }
    print(has369 ? "*" : strNum, terminator: " ")
  }
    print()
}

삼육구삼육구(num: 10)


/***************************************************
 어떤 자연수를 입력했을 때 그 수가 하샤드 수인지 아닌지 여부를 반환하기
 - 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수 (10, 12, 18, 20, 21, 24 등이 해당됨)
 e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수
 ***************************************************/

func isHarshadNumber(num: Int) -> Bool {
  guard num > 0 else { return false }
  let sumDigits = sumAllDigits(num)
  return num % sumDigits == 0
}

// 하샤드 수 O
isHarshadNumber(num: 10)
isHarshadNumber(num: 12)
isHarshadNumber(num: 18)

// 하샤드 수 X
isHarshadNumber(num: 15)
isHarshadNumber(num: 22)


/***************************************************
 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
 Input : 6, 9
 Output : 18, 3
 ***************************************************/
print("\n---------- [  ] ----------\n")

// 최대공약수
// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

// 최소 공배수
// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수

func commonMultipleAndDenominator(num1: Int, num2: Int) -> (Int, Int) {
  var op1 = num1, op2 = num2
  if op1 < op2 {
    swap(&op1, &op2)
  }
  
  while true {
    let r = op1 % op2
    (op1, op2) = (op2, r)
    if r == 0 { break }
  }
  let commonDenominator = op1
  let commonMultiple = num1 * num2 / commonDenominator
  return (commonMultiple, commonDenominator)
}

commonMultipleAndDenominator(num1: 12, num2: 15)
commonMultipleAndDenominator(num1: 18, num2: 9)
commonMultipleAndDenominator(num1: 8, num2: 12)
