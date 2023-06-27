<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <!-- 부트스트랩모드가 아닌 lite모드로-->
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/lang/summernote-ko-KR.min.js"></script>
            <!--한글지원-->


            <!-- Bootstrap - CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">
            <!-- Bootstrap - JavaScript Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
            <!-- Bootstrap - icon -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
            <!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
            <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
            <!-- awesome font -icon -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

            <!-- gnb css -->
            <link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">

            <style>
                * {
                    font-family: NanumSquareNeo;
                    box-sizing: border-box;
                }

                .container {
                    margin-top: 100px;
                }

                h2 {
                    text-align: center;
                }

                div>table {
                    width: 100%;
                    table-layout: fixed;
                }

                button {
                    margin-bottom: 10px;
                    border: 0;
                }

                #title {
                    width: 75%;
                }

                .body tr,
                td {
                    border: 1px solid black;
                    font-size: 20px;
                }


                #content {
                    width: 100%;
                    height: 600px;
                    overflow: auto;
                    word-break: break-all;

                }

                #write_reply {
                    width: 100%;
                    height: 150px;
                }

                .reply {
                    word-break: break-all;
                }

                .re_reply {
                    word-break: break-all;
                }

                .btn-primary {
                    margin-top: -15px;
                    font-size: small;
                }

                .button-container {
                    margin-top: 10px;
                }

                #button {
                    margin-right: 15px;
                    float: right;
                }

                .note-modal-footer>input {
                    margin-right: 20px;
                    margin-top: -15px;
                    font-size: small;
                }
            </style>

        </head>

        <body>
            <c:import url="../commons/gnb.jsp">
            </c:import>


            <c:choose>
                <c:when test="${user == result.memberCode}">
                    <div class="container">

                        <div class="row header">
                            <h2>자유게시판</h2>
                            <br>
                        </div>


                        <div class="row body">

                            <table>
                                <c:choose>
                                    <c:when test="${result.memberAuthGradeCode == 1002 }">
                                        <tr>
                                            <td>
                                                사업자회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>글번호 : ${result.code} | 작성자 : ${result.memberCompanyName} </td>
                                        </tr>
                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td>
                                                일반회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>글번호 : ${result.code} | 작성자 : ${result.memberNickName} </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>


                                <c:choose>
                                    <c:when test="${result.headLineCode == 2001 }">
                                        <tr>
                                            <td>
                                                카테고리 : <input id="headlinecode" type="text" value="일상" disabled>
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:when test="${result.headLineCode == 2002 }">
                                        <tr>
                                            <td>
                                                카테고리 : <input id="headlinecode" type="text" value="정보" disabled>
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td>
                                                카테고리 : <input id="headlinecode" type="text" value="질문" disabled>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>

                                <tr>
                                    <td>
                                        <input id="code" type="text" value="${result.code}" style="display:none">
                                    </td>
                                </tr>


                                <tr>
                                    <td>제목 :
                                        <input id="title" type="text" value="${result.title}" disabled>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div id="content">${result.content}</div>
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                        <div id="button" class="button-container">
                                            <button id="modi" class=" btn btn-outline-primary" type="button">수정</button>

                                            <button id="save" class=" btn btn-outline-primary" style="display:none"
                                                type="submit">완료</button>

                                            <button id="cancel" class=" btn btn-outline-primary" style="display:none"
                                                type="button">취소</button>

                                            <button id="del" class="btn btn btn-outline-primary"
                                                type="button">삭제</button>

                                             <a href="/board/free">
                                            <button id="list" type="button" class="btn btn-outline-secondary">목록</button>
                                            </a>
                                            
                                        </div>
                                    </td>
                                </tr>
                            </table>



                        </div>

                </c:when>
                <c:otherwise>
                    <div class="container">

                        <div class="row header">
                            <h2>자유게시판</h2>
                            <br>
                        </div>

                        <div class="row body">
                            <table>


                                <c:choose>
                                    <c:when test="${result.memberAuthGradeCode == 1002 }">
                                        <tr>
                                            <td>
                                                사업자회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>글번호 : ${result.code} | 작성자 : ${result.memberCompanyName} </td>
                                        </tr>
                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td>
                                                일반회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>글번호 : ${result.code} | 작성자 : ${result.memberNickName} </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>



                                <c:choose>
                                    <c:when test="${result.headLineCode == 2001 }">
                                        <tr>
                                            <td>
                                                카테고리 : 일상
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:when test="${result.headLineCode == 2002 }">
                                        <tr>
                                            <td>
                                                카테고리 : 정보
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td>
                                                카테고리 : 질문
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>



                                <tr>
                                    <td>제목 :
                                        ${result.title}
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                        <div id="content">${result.content}</div>
                                    </td>
                                </tr>

								<tr>
						            <td>
						                <div id="button" class="button-container">
						                
						                	<button id="report" type="button" class="btn btn-outline-danger">신고</button>
						                  
						
						                  	<button id="likecount" class=" btn btn-outline-primary" type="button">추천</button> 
						
						                    <a href="/board/free"> 
						                    <button id="list" type="button" class="btn btn-outline-secondary">목록</button>
						                    </a>
						                    
						                </div>
						            </td>
        						</tr>

                            </table>
                        </div>


                </c:otherwise>

            </c:choose>


            <div class="row footer">

                <table>
                    <tr>
                        <td>

                            <div class="card">

                                <div class="card-body" class="mt-5 ">

                                    <!-- Comment form-->
                                    <textarea id="write_reply" class="form-control mt-3" rows="3"
                                        placeholder="댓글을 작성해주세요!"></textarea>
                                    <a href="#" class="btn btn-primary btn-m mt-2 " style="float:right;">작성</a>
                                    <!-- Comment with nested comments-->

                                    <!-- Parent comment-->
                                    <div class="d-flex mt-5">
                                        <div class="flex-shrink-0"><img class="rounded-circle"
                                                src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                        </div>
                                        <div class="ms-3">
                                            <div class="fw-bold">작성자</div>
                                            <div class="reply">
                                                ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                <div class="button-container" style="float:right ; margin-top: 10px;">
                                                    <button class="btn btn-outline-primary btn-sm"
                                                        type="button">수정</button>
                                                    <button class="btn btn-outline-primary btn-sm"
                                                        type="button">취소</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <!-- child comment-->
                                    <div class="ms-5">

                                        <div class="d-flex mt-1">

                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container" style="float:right ;">
                                                        <button class="btn btn-outline-primary btn-sm" type="button"> <i
                                                                class="bi bi-hand-thumbs-up"></i>13</button>
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="button">신고</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- child comment-->
                                    <div class="ms-5">
                                        <div class="d-flex mt-1">

                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container"
                                                        style="float:right ; margin-top: 10px;">
                                                        <button class="btn btn-outline-primary btn-sm" type="button"> <i
                                                                class="bi bi-hand-thumbs-up"></i>13</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </td>
                    </tr>
                </table>


            </div>

            </div>

            <script>


                // 수정버튼


                $(document).ready(function () {



                    $("#modi").on("click", function () {

                        $("#modi").css("display", "none"); // 수정버튼 안보이게

                        $('#content').summernote({
                            placeholder: '글을 입력해주세요 (최대 2000자까지 가능합니다)',
                            height: 600,
                            focus: true,
                            maxHeight: 800,
                            minHeight: 200,
                            disableDragAndDrop: true,
                            lang: 'ko-KR',
                            toolbar: [
                                ['style', ['style']],
                                ['font', ['bold', 'underline', 'clear']],
                                ['color', ['color']],
                                ['para', ['ul', 'ol', 'paragraph']],
                                ['table', ['table']],
                                ['insert', ['video']],
                                ['view', ['codeview', 'help']]
                            ],
                            callbacks: {
                                onImageUpload: function (data) {
                                    data.pop();
                                },
                                onKeyup: function () {
                                    checkContentLength();
                                },
                                onPaste: function () {
                                    checkContentLength();
                                },
                                onChange: function (contents, $editable) {
                                    checkContentLength();
                                }
                            }
                        });


                        // 수정 버튼 클릭 시 headline 입력란을 <select> 태그로 변경
                        var headline = $("#headlinecode");
                        var headlineValue = headline.val();  //headline값 없애주기

                        var headlineSelect = document.createElement('select');
                        headlineSelect.id = 'headlinecode';

                        var options = [
                            { value: '2001', text: '일상' },
                            { value: '2002', text: '정보' },
                            { value: '2003', text: '질문' }
                        ];

                        options.forEach(function (option) {
                            var newOption = document.createElement('option');
                            newOption.value = option.value;
                            newOption.text = option.text;
                            headlineSelect.appendChild(newOption);
                        });

                        headline.replaceWith(headlineSelect); //headlinecode


                        $("#title").removeAttr("disabled"); // 제목버튼-활성화/ 고칠수있게
                        $("#save").css("display", "inline"); // 완료버튼보이게


                    });



                    // 완료
                    $("#save").on("click", function () {
                        console.log("adgyusg")

                        let result = confirm("수정하시겠습니까?");

                        if (result) {


                            let content = $('#content').summernote('code'); //태그있는거
                            var text = $('<div>').html(content).text(); //태그없는거


                            if ($("#title").val() == "" || $("#title").val().trim() == "") {
                                alert("제목을 작성해주세요.");
                                return false;
                            } else if (content == "") {
                                alert("내용을 입력해주세요.");
                                return false;
                            } else if (text.length == 0) {
                                alert("내용을 입력해주세요.");
                                return false;
                            }


                            let title = $("#title").val();
                            let headlinecode = $("select[id=headlinecode] option:selected").val();
                            let code = $("#code").val();


                            $.ajax({
                                url: "/board/updateFree",
                                type: "post",
                                dataType: "json",
                                data: {
                                    title: title,
                                    content: content,
                                    code: code,
                                    headLineCode: headlinecode
                                }
                            }).done(function (resp) {
                                if (resp == 1) {
                                    alert("수정되었습니다");
                                    location.reload();

                                } else {
                                    alert("수정에 실패했습니다");
                                    return false;
                                }
                            })


                        } else {
                            location.reload();
                        }



                    });



                    $("#title").on("input", function () {
                        var maxLength = 50;
                        var title = $(this).val();

                        if (title.length > maxLength) {
                            alert("제목은 최대 50자까지 입력할 수 있습니다.");
                            title = title.slice(0, maxLength - 1);
                            $(this).val(title);
                        }
                    }); // 제목 글자수 제한


                    function checkContentLength() {
                        var maxLength = 1000;
                        var content = $('#content').summernote('code');


                        var text = $('<div>').html(content).text();

                        var iframeTags = (content.match(/<iframe[^>]+>/g) || []);
                        var iframeCount = iframeTags.length; // 영상 개수

                        var imageTags = (content.match(/<img[^>]+>/g) || []);
                        var imageCount = imageTags.length; // 이미지 개수

                        var contentLength = text.length + (iframeCount * 100) + (imageCount * 100);

                        console.log("contentLength: " + contentLength);
                        console.log("Iframe Count: " + iframeCount);
                        console.log("Image Count: " + imageCount);

                        if (contentLength > maxLength) {
                            alert("내용은 최대 1000자까지 입력할 수 있습니다.");
                            $('#content').summernote('undo');
                        } else {
                            return;
                        }
                    } //유효성검사

                    
                    $("#del").on("click",function(){
                    	let result = confirm("삭제하시겠습니까?")
                    
                    	if(result){
                    		alert("삭제되었습니다");
                    		location.href = "/board/deleteFree?code=" + ${result.code};
                    	}else{
                    		return false;
                    	}
                    })
                    
                    
                    
                     $("#report").on("click",function(){
                    	let result = confirm("신고하겠습니까?")
                    
                    	if(result){
                    		 window.open("/board/freeReport?postcode="+ ${result.code}+"&boardKindCode=1002&reporterCode="+${user}+"&reporteeCode="+ ${result.memberCode}+"&authGradeCode="+${result.memberAuthGradeCode},"", "width=500px, height=600px");
                    	}else{
                    		return false;
                    	}
                    })
                    

                })
            </script>



        </body>

        </html>