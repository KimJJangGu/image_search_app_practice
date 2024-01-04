import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';


// Result<T>는 Success, Error, Loading 세 가지 하위 클래스를 가지는 Sealed Class
@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success; // 하위 클래스에 대한 생성자
  const factory Result.error(Exception e) = Error;
  const factory Result.loading() = Loading;
}

void main() {
  Result<int> result = getResult(true);

  switch(result) {
    case Success<int>(): // Success: 데이터 출력
      print(result.data);
    case Error<int>(): // Error: 에러(예외) 출력
      print(result.e.toString());
    case Loading<int>(): // 동작 안함
  }
}

Result<int> getResult(bool value) {
  // bool 값에 따라 Result<int> 반환하는 함수
  try {
    if (value) {
      return Result.success(1);
    } else {
      return Result.loading();
    }
  } catch (e) {
    return Result.error(Exception('ㅋ 에 러 발 생 ㅋ')); // 예외 발생 시 에러 출력
  }
}