$(document).ready(function(){  
	 $('#avatar').load(function() {  
   		var pos = initValue();  
     $('#avatar').imgAreaSelect({aspectRatio: '1:1',  
       x1: pos.x1,  
       y1: pos.y1,  
       x2: pos.x2,  
       y2: pos.y2,  
       handles: true,  
       onSelectChange: preview, 
       onSelectEnd: function (img, selection) {  
         $('input[name=x1]').val(selection.x1);  
         $('input[name=y1]').val(selection.y1);  
         $('input[name=x2]').val(selection.x2);  
         $('input[name=y2]').val(selection.y2);  
				
       },
     });
			$('input[name=x1]').val(pos.x1);  
       $('input[name=y1]').val(pos.y1);  
       $('input[name=x2]').val(pos.x2);  
       $('input[name=y2]').val(pos.y2);
   
   });
});
      
  
    function initValue(){  
      var o    = new Object();  
      var x    = $("#avatar").width();  
      var y    = $("#avatar").height();  
      var size = x >= y ? y : x;  
      size     = size >= 200 ? 200 : size;  
      o.x1 = (x - size) / 2;  
      o.y1 = (y - size) / 2;  
      o.x2 = o.x1 + size;  
      o.y2 = o.y1 + size;  
      return o;  
    }  
  
    function checkImage(){  
      var image_name = $("#photo").val();  
      var reg = /\.png|jpeg|jpg|bmp|gif$/i  
      if (reg.test(image_name)){  
        return true;  
      }else if(image_name == "") {  
        alert("没有选择图片！");  
        return false;  
      }else{  
        alert("图片格式不正确！");  
        return false;  
      }  
    }

		function preview(img, selection) {
		    if (!selection.width || !selection.height)
		        return;

		    var scaleX = 100 / selection.width;
		    var scaleY = 100 / selection.height;

		    $('#preview img').css({
		        width: Math.round(scaleX * 300),
		        height: Math.round(scaleY * 300),
		        marginLeft: -Math.round(scaleX * selection.x1),
		        marginTop: -Math.round(scaleY * selection.y1)
		    });

		    $('#x1').val(selection.x1);
		    $('#y1').val(selection.y1);
		    $('#x2').val(selection.x2);
		    $('#y2').val(selection.y2);
		    $('#w').val(selection.width);
		    $('#h').val(selection.height);    
		}
