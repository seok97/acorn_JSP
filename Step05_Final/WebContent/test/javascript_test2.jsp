<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/javascript_test.jsp</title>
</head>
<body>
<script>
	/* javascirpt 비동기 작업 테스트 */
	// promise 객체를 리턴하는 함수
	const readPromise = () =>{
		const p = new Promise((resolve,reject)=>{
			//5초 뒤에 호출
			setTimeout(()=>{
				resolve('resolve 호출')
			},3000);
			
		});
		return p;
	}
	
	const read = async (callback) => {
		const result = await readPromise();
		console.log("result 함수 작업 완료")

		callback(result)
	}
	
		 read(
			 (data)=>{
			 	alert(data)
		 	}
		 )
	
	console.log('페이지 로딩중...')
</script>
</body>
</html>