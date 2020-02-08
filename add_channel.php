<?php 
    if(isset($_GET['id'])){ 
    $page_title= 'Edit Channel';
  }
  else{ 
    $page_title='Add Channel'; 
  }
  $active_page="channel";

  include("includes/header.php");
	require("includes/function.php");
	require("language/language.php");

	require_once("thumbnail_images.class.php");
	
	
	//Get all Category 
	$qry="SELECT * FROM tbl_category";
	$result=mysqli_query($mysqli,$qry);
	
	 	
	if(isset($_POST['submit']) and isset($_GET['add']))
	{	
		 
		// for movies poster
      $channel_poster=rand(0,99999)."_".$_FILES['channel_poster']['name'];
      $pic1=$_FILES['channel_poster']['tmp_name'];

            
      $tpath1='images/'.$channel_poster; 
      copy($pic1,$tpath1);

      $thumbpath='images/thumbs/'.$channel_poster;
        
      $obj_img = new thumbnail_images();
      $obj_img->PathImgOld = $tpath1;
      $obj_img->PathImgNew =$thumbpath;
      $obj_img->NewWidth = 270;
      $obj_img->NewHeight = 390;
      if (!$obj_img->create_thumbnail_images()) 
      {
        echo $_SESSION['msg']="Thumbnail not created... please upload image again";
        exit;
      }

      // for movies cover
      $channel_cover=rand(0,99999)."_".$_FILES['channel_cover']['name'];
      $pic1=$_FILES['channel_cover']['tmp_name'];

            
      $tpath1='images/'.$channel_cover; 
      copy($pic1,$tpath1);

      $thumbpath='images/thumbs/'.$channel_cover;
        
      $obj_img = new thumbnail_images();
      $obj_img->PathImgOld = $tpath1;
      $obj_img->PathImgNew =$thumbpath;
      $obj_img->NewWidth = 600;
      $obj_img->NewHeight = 350;
      if (!$obj_img->create_thumbnail_images()) 
      {
        echo $_SESSION['msg']="Thumbnail not created... please upload image again";
        exit;
      }
          
    $data = array( 
      'cat_id'  =>  $_POST['category_id'],
      'channel_type'  =>  $_POST['channel_type'],
      'channel_title'  =>  $_POST['channel_title'],
      'channel_url'  =>  $_POST['channel_url'],
      'channel_type_ios'  =>  $_POST['channel_type_ios'],
      'channel_url_ios'  =>  $_POST['channel_url_ios'],
      'channel_desc'  =>  addslashes($_POST['channel_desc']),
      'channel_poster'  =>  $channel_poster,
      'channel_thumbnail'  =>  $channel_cover
    );		

 		$qry = Insert('tbl_channels',$data);			

		$_SESSION['msg']="10"; 
		header( "Location:manage_channels.php");
		exit;	
 
	}	
	 
?>
   

       <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="page_title_block">
            <div class="col-md-5 col-xs-12">
              <div class="page_title">Add Channel</div>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="card-body mrg_bottom">
            <form class="form form-horizontal" action="" method="post"  enctype="multipart/form-data" onsubmit="return checkValidation(this);">
              <div class="section">
                <div class="section-body">
                  <div class="form-group">
                   <!-- <label class="col-md-3 control-label">Category : Entertainment</label>-->
                    <div class="col-md-6">
                    <!--  <select name="category_id" id="category_id" class="select2">
                        <option value="3">Entertainment</option>
          					
                      </select>-->
                      <input type="hidden" name="category_id" value="3"/>
                    </div>
                  </div>                  
                  <div class="form-group">
                    <label class="col-md-3 control-label">Channel Title :-</label>
                    <div class="col-md-6">
                      <input type="text" name="channel_title" id="channel_title" class="form-control">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Android Type :-</label>
                    <div class="col-md-6">
                      <select name="channel_type" id="channel_type" class="select2">
                        <option value="live_url">Live URL</option>
                        <option value="youtube">YouTube</option>
                        <option value="embedded_url">Embedded URL (Open Load, Very Stream, Daily motion, Vimeo)</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Android Channel Url :-</label>
                    <div class="col-md-6">
                      <input type="text" name="channel_url" id="channel_url" class="form-control">
                    </div>
                  </div>
                  <div class="or_link_item">
                  <h2>OR</h2>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">iOS Type :-</label>
                    <div class="col-md-6">
                      <select name="channel_type_ios" id="channel_type_ios" class="select2">
                        <option value="live_url">Live URL</option>
                        <option value="youtube">YouTube</option>
                        <option value="embedded_url">Embedded URL (Open Load, Very Stream, Daily motion, Vimeo)</option>
                         
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">iOS Channel Url :-
                      <p class="control-label-help">(M3u8,MP4)</p>
                    </label>
                    <div class="col-md-6">
                      <input type="text" name="channel_url_ios" id="channel_url_ios" class="form-control">
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-md-3 control-label">Channel Poster Image:-
                      <p class="control-label-help" id="square_lable_info">(Recommended resolution: 185x278 portrait)</p>
                    </label>
                    <div class="col-md-6">
                      <div class="fileupload_block">
                        <input type="file" name="channel_poster" value="" id="fileupload">
                        <div class="fileupload_img">
                          <?php 
                            $img_src='assets/images/series-poster.jpg';
                          ?>
                          <img type="image" src="<?=$img_src?>" alt="poster image" style="width: 80px;height: 115px" />
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-md-3 control-label">Channel Cover Image:-
                      <p class="control-label-help" id="square_lable_info">(Recommended resolution: 300x150 landscape)</p>
                    </label>
                    <div class="col-md-6">
                      <div class="fileupload_block">
                        <input type="file" name="channel_cover" value="" id="fileupload">
                        <div class="fileupload_img">
                          <?php 
                            $img_src='assets/images/series-cover.jpg';
                          ?>
                          <img type="image" src="<?=$img_src?>" alt="cover image" style="width: 150px;height: 86px" />
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-md-3">
                      <label class="control-label">Channel Description :-</label>
                    </div>
                    <div class="col-md-6">
                      <textarea name="channel_desc" id="channel_desc" rows="5" class="form-control"></textarea>
                      <script>                             
                        CKEDITOR.replace( 'channel_desc' );
                      </script>
                    </div>
                  </div>
                  <div class="form-group">&nbsp;</div>
                  <div class="form-group">
                    <div class="col-md-9 col-md-offset-3">
                      <button type="submit" name="submit" class="btn btn-primary">Save</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>           
                 
        
<?php include("includes/footer.php");?>   

<script type="text/javascript">
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function(e) {
        $("input[name='channel_poster']").next(".fileupload_img").find("img").attr('src', e.target.result);
      };
      
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("input[name='channel_poster']").change(function() { 
    readURL(this);
  });

  function readURL1(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function(e) {
        $("input[name='channel_cover']").next(".fileupload_img").find("img").attr('src', e.target.result);
      };
      
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("input[name='channel_cover']").change(function() { 
    readURL1(this);
  });
</script>    
