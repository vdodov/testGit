//: [Previous](@previous)

import Foundation


/***************************************************
 학점을 입력받아 각각의 등급을 반환해주는 함수
 (등급 예시 : 4.5 = A+,  < 4.5 = A,  < 4.0 = B+,  < 3.5 = B,   < 3.0 = F)
 ***************************************************/

func calculateGrade(score: Double) -> String {
  switch score {
  case 4.5: return "A+"
  case 4.0 ..< 4.5: return "A"
  case 3.5 ..< 4.0: return "B+"
  case 3.0 ..< 3.5: return "B"
  default:
    return "F"
  }
}

calculateGrade(score: 2.00)
calculateGrade(score: 3.42)
calculateGrade(score: 3.999)
calculateGrade(score: 4.5)



/***************************************************
 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb")
 ***************************************************/

func num2str(month: Int) -> String {
  switch month {
  case 1: return "Jan"
  case 2: return "Feb"
  case 3: return "Mar"
  case 4: return "Apr"
  case 5: return "May"
  case 6: return "Jun"
  case 7: return "Jul"
  case 8: return "Aug"
  case 9: return "Sep"
  case 10: return "Oct"
  case 11: return "Nov"
  case 12: return "Dec"
  default:
    return "Error"
  }
}

num2str(month: 1)
num2str(month: 5)
num2str(month: 8)
num2str(month: 12)
num2str(month: 13)



/***************************************************
 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
 (where clause로 풀 수 있다면 해보기)
 ***************************************************/

func isPositiveNumber(first: Int, second: Int, third: Int) -> Bool {
  // 1)
  let number = first * second * third
  switch number {
  case let x where x > 0:
     print(x)
    return true
  default:
    return false
  }

  // 2) 또 다른 방식
//  let num = (first, second, third)
//  switch num {
//  case let (x, y, z) where x * y * z > 0:
//    return true
//  default:
//    return false
//  }
}

isPositiveNumber(first: 1, second: 2, third: 3)
isPositiveNumber(first: -1, second: 2, third: 3)
isPositiveNumber(first: -1, second: -2, third: 3)
isPositiveNumber(first: -1, second: -2, third: -3)



/***************************************************
 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
 (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
     윤년X 예시 - 200, 300, 500, 600, 1900, 2100
 ***************************************************/

func isLeapYear(_ year: Int) -> Bool {
  // switch
//  switch year {
//  case _ where year % 400 == 0:
//    return true
//  case _ where year % 100 == 0:
//    return false
//  default:
//    return year % 4 == 0
//  }

  // if 문
  if year % 400 == 0 {
    return true
  } else if year % 100 == 0 {
    return false
  } else {
    return year % 4 == 0
  }
  
  // 1줄짜리
//  return (year % 400 == 0) || (year % 100 != 0) && (year % 4 == 0)
}

isLeapYear(2000)
isLeapYear(2004)

isLeapYear(1000)
isLeapYear(1970)
isLeapYear(2002)


//: [Next](@next)
