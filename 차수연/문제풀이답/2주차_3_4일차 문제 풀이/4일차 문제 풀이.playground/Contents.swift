
import Foundation


/***************************************************
 아래 두 클로저를 Syntax Optimization을 이용하여 코드를 최대한 줄여보기
 ***************************************************/

let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}

//let someClosure: (String, String) -> Bool = { (s1, s2) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}

//let someClosure: (String, String) -> Bool = { (s1, s2) in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}

//let someClosure: (String, String) -> Bool = { (s1, s2) in
//  let isAscending: Bool = s1 > s2
//  return isAscending
//}

//let someClosure: (String, String) -> Bool = { (s1, s2) in
//  return s1 > s2
//}

//let someClosure: (String, String) -> Bool = {
//  return $0 > $1
//}

//let someClosure: (String, String) -> Bool = { $0 > $1 }



let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  
  for _ in values {
    count += 1
  }
  return count
}


//let otherClosure: ([Int]) -> Int = { (values) -> Int in
//  var count: Int = 0
//
//  for _ in values {
//    count += 1
//  }
//  return count
//}

//let otherClosure: ([Int]) -> Int = { values in
//  var count: Int = 0
//
//  for _ in values {
//    count += 1
//  }
//  return count
//}

//let otherClosure: ([Int]) -> Int = { values in
//  var count: Int = values.count
//  return count
//}

//let otherClosure: ([Int]) -> Int = { values in
//  return values.count
//}

//let otherClosure: ([Int]) -> Int = {
//  return $0.count
//}

//let otherClosure: ([Int]) -> Int = { $0.count }




/***************************************************
 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
 ***************************************************/

func combineString1(str1: String?, str2: String?, str3: String?) -> String {
  var combinedString = ""
  if let unwrappedString = str1 {
    combinedString += unwrappedString
  }
  if let unwrappedString = str2 {
    combinedString += unwrappedString
  }
  if let unwrappedString = str3 {
    combinedString += unwrappedString
  }
  return combinedString
}

func combineString2(str1: String?, str2: String?, str3: String?) -> String {
  let string1 = str1 ?? ""
  let string2 = str2 ?? ""
  let string3 = str3 ?? ""
  return string1 + string2 + string3
}

combineString1(str1: "AB", str2: "CD", str3: "EF")
combineString1(str1: "AB", str2: nil, str3: "EF")
combineString2(str1: "AB", str2: "CD", str3: "EF")
combineString2(str1: "AB", str2: nil, str3: "EF")

