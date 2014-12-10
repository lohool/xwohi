			 function previewLocalImage(obj, divPreviewId) {
                   
                    var allowExtention = ".jpg,.bmp,.gif,.png"; //,�����ϴ��ļ��ĺ�׺��
                    var extention = obj.value.substring(obj.value.lastIndexOf(".") + 1).toLowerCase();
                    var browserVersion = window.navigator.userAgent.toUpperCase();
                    if (allowExtention.indexOf(extention) > -1) {

                        if (browserVersion.indexOf("MSIE") > -1) {
                            if (browserVersion.indexOf("MSIE 6.0") > -1) {//ie6
                                //document.getElementById(imgPreviewId).setAttribute("src", obj.value);
								appendImg(divPreviewId)

                            }
							else {//ie[7-8]��ie9
                                obj.select();
                                var newPreview = document.getElementById(divPreviewId + "_Img_New");
                                if (newPreview == null) {
                                    newPreview = document.createElement("img");
                                    newPreview.setAttribute("id", divPreviewId + "_Img_New");
                                    newPreview.style.width = "270px";
                                    //newPreview.style.height = "160px";
                                    newPreview.style.border = "solid 1px #d2e2e2";
                                }

 								 if (browserVersion.indexOf("MSIE 10.0") > -1)//IE 10.0
								{
									var oFile = obj.files[0];  
									var oFReader = new FileReader();  
									oFReader.onload = function (oFREvent) {  
										newPreview.src = oFREvent.target.result;  
									};  
									oFReader.readAsDataURL(oFile);  

								}
								else
								{
                                newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";
								}

                               var tempDivPreview = document.getElementById(divPreviewId);
                                tempDivPreview.parentNode.insertBefore(newPreview, tempDivPreview);
                                tempDivPreview.style.display = "none";
								

                            }
                        } else if (browserVersion.indexOf("FIREFOX") > -1) {//firefox
                            var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
                            if (firefoxVersion < 7) {//firefox7���°汾
                                //document.getElementById(imgPreviewId).setAttribute("src", obj.files[0].getAsDataURL());
								appendImg(divPreviewId)

                            } else {//firefox7.0+                    
                                //document.getElementById(imgPreviewId).setAttribute("src", window.URL.createObjectURL(obj.files[0]));
								appendImg(divPreviewId)
								

                            }
                        } else if (obj.files) {
                            //����chrome������ȣ�HTML5��ȡ·��                   
                            if (typeof FileReader !== "undefined") {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                //    document.getElementById(imgPreviewId).setAttribute("src", e.target.result);
								appendImg(divPreviewId)
                                }
                                reader.readAsDataURL(obj.files[0]);
                            } else if (browserVersion.indexOf("SAFARI") > -1) {
                                alert("Safari is not supported yet!");
                            }
                        } else {
                            document.getElementById(divPreviewId).setAttribute("src", obj.value);
                        }
                    } else {
                        alert("Please choose image files:" + allowSuffix);
                        obj.value = ""; //���ѡ���ļ�
                        if (browserVersion.indexOf("MSIE") > -1) {
                            obj.select();
                            document.selection.clear();
                        }
                        obj.outerHTML = obj.outerHTML;
                    }
                }
				function appendImg(divPreviewId,e)
				{
								var img=document.createElement("img");      
								img.setAttribute("src",e.target.result); 
								img.setAttribute("width","150"); 
								img.setAttribute("height","120"); 
								img.setAttribute("id","img5"); 
								document.getElementById(divPreviewId).appendChild(img); 
				}
