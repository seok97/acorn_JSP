<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
<script>
	// 주어진 작업을 수행하는 함수
	// 첫번째 인자로 작업의 내용이 전달되고 두번째 인자로는
	// 작업이 종료되면 호출할 함수를 전달한다.
	
	const work = (job, callback) =>{
		//작업을 마치는데 5초가 걸린다고 가정
		setTimeout(() => {
			console.log(job+"을 수행 완료");
			// 작업이 끝나면 callback 함수 호출
			callback();
		}, 5000);
	}
	
	
	new Promise((resol)=>{
		work("run",resol);
	}).then(()=>{
		return new Promise((resolve)=>{
			work("drink",resolve);
		})
	}).then(()=>{
		return new Promise((resolve)=>{
			work("drink",resolve);
		})
	})
	
	.then(()=>{
		console.log("all done");
	})
	
	
	
	//Promise 객체를 생성하면서 함수를 전달한다.
	let p = new Promise((resolve, reject)=>{
		// 작업을 완료했다면 resolve 함수를 호출한다.
		resolve();
		
		// 작업이 실패했거나 종료를 해야할때 reject를 호출한다.
		reject();
	})
	// resolve가 호출되면 
	p.then(()=>{
		console.log("then 실행")
	})
	// reject 함수가 호출되면
	p.catch(()=>{
		console.log("cathc 실행")
	})
	
	
	
	
	
</script>
</body>
</html>