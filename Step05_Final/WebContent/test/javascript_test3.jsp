<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>/test/javascript_test.jsp</title>
  </head>
  <body>
    <script>
      const util = {
        readPromise: function () {
          const p = new Promise((resolve, reject) => {
            //5초 뒤에 호출
            setTimeout(() => {
              resolve("resolve 호출")
            }, 3000)
          })
          return p
        },
        read: async function (callback) {
          const result = await this.readPromise()
          console.log("result 함수 작업 완료")

          callback(result)
        },
      }

      util.read((d) => {
        alert(d)
      })

      console.log("페이지 로딩중...")
    </script>
  </body>
</html>
