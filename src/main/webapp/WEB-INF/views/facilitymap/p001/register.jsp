<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>
</head>
<body>
    <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="row">
            <div class="col-lg-12 col-lg-offset-2 ">
                <div class="cotainer">
                    <div class="row justify-content-center pt-3 aos-init aos-animate" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-4">시설 상세 정보 입력</h2>
                        </div>
                    </div>
                    
                    <div class="row justify-content-center">
                        <div class="col-md-10  pb-5">
                            <div class="card">
                                <div class="card-body pd40">
                                    <form role="form" action="/facilitymap/p001/register" method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설명</label>
                                            <div class="col-md-7">
                                                <input type="text" id="place_name" class="form-control" name="place_name">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">주소</label>
                                            <div class="col-md-7">
                                                <input type="text" id="adress_name" class="form-control" name="address_name">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설 종류</label>
                                            <div class="col-md-7">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <select class="form-control" name="category_name">
                                                        <optgroup label="시설 종류" >
                                                            <option value="hospital">동물병원</option>
                                                            <option value="medicenter">동물약국</option>
                                                            <option value="restaurant">동반식당</option>
                                                            <option value="dog_cafe">애견카페</option>
                                                            <option value="hotel">호텔</option>
                                                        </optgroup>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">휴대전화</label>
                                            <div class="col-md-7">
                                                <input type="text" id="phone" class="form-control" name="phone">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">위도</label>
                                            <div class="col-md-7">
                                                <input type="text" id="Latitude" class="form-control" name="X">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">경도</label>
                                            <div class="col-md-7">
                                            	<input type="text" id="longitude" class="form-control" name="Y">
                                            	<input type="hidden" id="place_url" class="form-control" name="place_url" value="https://www.dingpet.shop/facilitymap/p001/mapinfo?site_id=">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설 소개</label>
                                            <div class="col-md-7">
                                                <textarea id="place_text" name="place_text" class="form-control" rows="4" ></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설사진</label>
                                            <div class="col-md-7">
                                                <div id='View_area' class="img_up"></div>                                               
                                                <input type="file" name="placePic" id="placePic"  accept="image/*" maxlength="5" onchange="previewImage(this,'View_area')">       
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">상세소개사진</label>
                                            <div class="col-md-7">
                                                <div class="form-group uploadDiv">
									            <input type="file" name='uploadFile' multiple>
									        	</div>									        
									        	<div class='uploadResult'>
									          	<ul>									          
									          	</ul>
									        	</div>
                                            </div>
                                        </div>
                                        
                                        <div class="text-center pd40">
                                            <button type="submit" class="btn btn-primary">등록</button>
                                        </div>
                                </form></div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====-->
<script>
$(document).ready(function(){

	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
	    
	    e.preventDefault();
	    
	    console.log("submit clicked");
	    
	    var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
	    
	  });

	  
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      return false;
	    }
	    
	    if(regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      return false;
	    }
	    return true;
	  }	  
	  $("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/facilitymap/p001/upload/uploadAjaxAction',
	      processData: false, 
	      contentType: false,
	      data:formData,
	      type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 

	      }
	    }); //$.ajax
	    
	  });  
	  
	  function showUploadResult(uploadResultArr){
		    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
	    	if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				console.log(fileCallPath);
				console.log(obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/facilitymap/p001/upload/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}

	    });
	    
	    uploadUL.append(str);
	  }

	  $(".uploadResult").on("click", "button", function(e){
		    
	    console.log("delete file");
	      
	    var targetFile = $(this).data("file");
	    var type = $(this).data("type");
	    
	    var targetLi = $(this).closest("li");
	    
	    $.ajax({
	      url: '/facilitymap/p001/upload/deleteFile',
	      data: {fileName: targetFile, type:type},
	      dataType:'text',
	      type: 'POST',
	        success: function(result){
	           alert(result);
	           
	           targetLi.remove();
	         }
	    }); //$.ajax
	   });


	  
	});

</script> 
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>