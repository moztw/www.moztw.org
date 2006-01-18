<?php

session_start();

if($_POST['submit']) {

  $user_id = 1;

  $name = $_POST['name'];
  $company = $_POST['company'];
  $email = $_POST['email'];
  $phone = $_POST['phone'];
  $address = $_POST['address'];
  $town = $_POST['town'];
  $region = $_POST['region'];
  $postcode = $_POST['postcode'];
  $country = $_POST['country'];
  $title = $_POST['title'];
  $technology = $_POST['technology'];
  $information = $_POST['information'];




  if(!isset($_SESSION['video']))  $_SESSION['video'] = array();


  if(!empty($_FILES['video']['tmp_name'] ))  {

   $_SESSION['video']['tmp_name']= $_FILES['video']['tmp_name'] ;
   $_SESSION['video']['name']= $_FILES['video']['name'] ;

   // move the image
       copy($_SESSION['video']['tmp_name'],"/tmp/".$_SESSION['video']['name']);

  }




///////////////SERVER SIDE FORM VALIDATION ///////////////////////////////////////////////////

 $SERVER_SIDE_FORM_VALIDATION = true  ;



    if( ($name == "") || (strlen($name ) > 50)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['name'] = true ;
    }


    if(  !ereg("^(.+)@(.+)\\.(.+)$"  , $email )  || (strlen($email ) > 100)    )
    {
            $SERVER_SIDE_FORM_VALIDATION = false ;
            $VALIDATION_ERROR['email'] = true ;
    }

	 if( ($phone == "") || (strlen($phone ) > 20)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['phone'] = true ;
    }

	 if( ($address == "") || (strlen($address ) > 250)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['address'] = true ;
    }

	 if( ($town == "") || (strlen($town ) > 250)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['town'] = true ;
    }

	 if( ($region == "") || (strlen($region ) > 250)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['region'] = true ;
    }

	 if( ($postcode == "") || (strlen($postcode ) > 10)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['postcode'] = true ;
    }

	 if( ($country == "") || (strlen($country ) > 250)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['country'] = true ;
    }


	 if( ($title == "") || (strlen($title ) > 100)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['title'] = true ;
    }


	 if( (empty($_FILES['video']['tmp_name'] ))   && (!isset($_SESSION['video']['tmp_name']))  ){

		 // any moderation

             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['video'] = true ;

    }

	 if($_POST['terms'] <> 'acceptable'){

		 // any moderation
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['acceptable'] = true ;

    }




  if($SERVER_SIDE_FORM_VALIDATION == true ) {


	include_once("use_database.inc");
    include_once("videos.inc");
	include_once("filetypes_ignored.php");
    use_database( $host, $username,$password,$database) ;

	$video_name = $_SESSION['video']['name'] ;


    $SQL = "INSERT INTO video_contests ( user_id,name,company,email,phone,address,title,technology,information,video_name,video_contest_id)
	              VALUES ('$user_id','$name','$company','$email','$phone','$address','$title','$technology','$information','$video_name',NULL) ";

    @mysql_query($SQL) or die("Couldn't execute query @mysql_query($SQL).");

	 //  video
	 gs_upload_video($_SESSION['video']['name']) ;


	 $video_contest_id = gs_last_insert_id('video_contest_id') ;


	 // send email ..
	 $to =  $email;
     $subject = "Thanks for entering the Firefox Flicks Ad Contest!";
     $message = "

Thank you for your Firefox Flicks Ad Contest submission.
Your contest entry receipt number is ".$video_contest_id."

This email is to confirm that we have received your upload and to
provide instructions for mailing your high-resolution,
broadcast-ready media to Mozilla.

After a preliminary review, your submission will appear with
other entries at
http://www.firefoxflicks.com/adcontest/entries.html. Feel
free to share this link, and the direct link to your video as
soon as it is available.

In order to complete the submission process, please mail your
full-sized media (on CD or DVD) to the address below:

Mozilla Corporation
c/o Firefox Flicks
1981 Landings Drive
Mountain View, CA 94043

If you have any questions about your entry or the submission
process, please email us at ad-support@mozilla.com
<mailto:ad-support@mozilla.com>

Thank you again for participating in the Firefox Flicks Ad
Contest. Stay tuned to
http://www.firefoxflicks.com/adcontest/updates.html for updates and
the announcement of winners on April 15, 2006.


_________________________________________
Confirmation of the details received.

  Name:".$name."
  Company:".$company."
  Email:".$email."
  Phone:".$phone."
  Address:".$address."
  Town:".$town."
  Region:".$region."
  Postcode:".$postcode."
  Country:".$country."
  Title:".$title."
  Technology:".$technology."
  Information:".$information ;

     mail($to,$subject,$message,'From:ad-support@mozilla.com');

	unset($_SESSION['video']) ;
    session_unregister("video");
    session_destroy();



    }



}


function  gs_upload_video( $video_name) {


   if( gs_moderate_video( $video_name)  ){

		$video_contest_id = gs_last_insert_id('video_contest_id') ;

                $directory = "contestdata/".$video_contest_id   ;

                  if(!is_dir($directory) )
                 {
                   umask(000);
                   mkdir("$directory",0770) ;     // make user directory
                 }


                 $filename = "/".$video_name;

                   copy("/tmp/".$video_name,$directory.$filename);


     }

}





function gs_moderate_video( $video_name ) {

  global $filetypes_ignored ;

 foreach ($filetypes_ignored as $key=>$value)
 {
    if( substr_count($video_name,  $value))  { return false; }
 }

   return true ;
 }



function gs_last_insert_id($primary) {

   $SQL = " SELECT LAST_INSERT_ID() AS  '".$primary."'";

   $table = @mysql_query($SQL) or die("Couldn't execute query @mysql_query($SQL).");

   $row =@mysql_fetch_array($table) ;

    return($row[$primary]);

}






?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>Firefox Flicks : Ad Contest : Submit Ad</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

      body           {width:100%; margin-right:0; margin-left:0; margin-top:0; font-family: verdana, san-serif;}
      table          {margin-left:auto;margin-right:auto;}
      td.header      {background-image: url('../images/header-adcontest2-bg.png'); background-repeat: repeat-x;}
      #nav           {color: rgb(222,224,229); padding-bottom:5px; padding-right: 6px; font-size: 13px;}
      #nav A:link    {text-decoration: none; color:rgb(222,224,229);}
      #nav A:visited {text-decoration: none; color:rgb(222,224,229);}
      #nav A:active  {text-decoration: none; color:rgb(222,224,229);}
      #nav A:hover   {text-decoration: none; color:white; background-color: #2f3d58;}

      #breadcrumbs           {color: #778397; font-size: 14px; font-weight:bold; margin-top: 11px; padding-left:1px;}
      #breadcrumbs A:link    {text-decoration: none; color:#2A3C79;}
      #breadcrumbs A:visited {text-decoration: none; color:#2A3C79;}
      #breadcrumbs A:hover   {text-decoration: underline;}

      img.bio {border: solid black 2px; float: right; margin: 0px 8px 15px 15px; width: 120px; height: 160px;}
      img.sponsor {border: none; float: right;	margin: 0 0 15px 15px;}
      p#footer  {text-align: center; font-size: x-small;}
      h2  {font-size: 14px; font-weight: bold; color:#000; margin-bottom: 0;}
      h3  {font-size: 14px; font-weight: bold; font-style: italic; color:#5D5D5D; margin-top:0;}
      .crunch   {font-size: small;}
      p {margin-top:0;}
      .post {text-align:left;}



    </style>

	 <script language="javascript">
<!--

function validateForm(form){

     if(form.name.value == "" ){
       alert("You must enter a name , please try again");
       form.name.focus();
       return false;
      }

	    if(!isEmailAddr(form.email.value)){
       alert("You must enter an email address , please try again");
       form.email.focus();
       return false;
      }

	   if(form.phone.value == "" ){
       alert("You must enter a phone number , please try again");
       form.phone.focus();
       return false;
      }

	   if(form.address.value == "" ){
       alert("You must enter an address , please try again");
       form.address.focus();
       return false;
      }


	   if(form.town.value == "" ){
       alert("You must enter a town , please try again");
       form.town.focus();
       return false;
      }

	   if(form.region.value == "" ){
       alert("You must enter a region , please try again");
       form.region.focus();
       return false;
      }

	    if(form.postcode.value == "" ){
       alert("You must enter a postcode , please try again");
       form.postcode.focus();
       return false;
      }

	    if(form.country.value == "" ){
       alert("You must enter a country , please try again");
       form.country.focus();
       return false;
      }



	   if(form.title.value == "" ){
       alert("You must enter a title , please try again");
       form.title.focus();
       return false;
      }

	  if(form.video.value == "" ){
       alert("You must select a video to upload , please try again");
       form.video.focus();
       return false;
      }

	  if(form.terms.checked == false ) {  // checkbox
      alert("You must accept the terms and conditions , please try again");
          return false ;
      }


	  window.document.getElementById('uploading').style.visibility='visible';


      return true ;

 }


function isEmailAddr(email){

    var validEmail = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;

              if (!validEmail.test(email))   return false;
              else  return true;

}

//-->
    </script>
	</head>

  <body>
    <div class="crunch">
    <table width="770" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="header">
          <img align="left" src="../images/header-adcontest2.png" width="317" height="71" alt="header" border="0" usemap="#Map">
            <map name="Map" id="Map">
              <area shape="rect" coords="3,3,335,68" href="../adcontest/" alt="Firefox Flicks Home">
            </map>
        </td>
        <td class="header" align="right" valign="bottom">
            <div id="nav">
            <a title="Ad Contest Home" href="../adcontest/">Home</a> | <a title="Judges" href="../adcontest/judges.html">Judges</a> | <a title="Creative Brief" href="../adcontest/brief.html">Creative Brief</a> | <a title="Contest Rules" href="../adcontest/rules.html">Contest Rules</a> | <a title="Frequently Asked Questions" href="../adcontest/faq.html">FAQ</a> | <a title="Submit your ad" href="../adcontest/submit.php">Submit Ad</a>
            </div>
        </td>
      </tr>
    </table>

    <table width="770" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <div id="breadcrumbs">
			<a href="../">Firefox Flicks</a> / <a href="../adcontest">Ad Contest</a> / Submit Ad </div>
          </div>
        </td>
      </tr>
    </table>
    <br>
    <br>
    <table width="770" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
			  <p>For initial consideration, you will need to upload a compressed, half- NTSC-resolution, full frame rate MPEG-4 video for entry into the contest. A QuickTime-compatible format for the Web version is preferred. Media uploaded should be less than 10 MB in size. When your entry is accepted, you will receive a confirmation email with instructions for mailing the full-size media to Mozilla.</p>
			  <p>Your information will remain confidential. <br />
  * = this information is required. </p>
			  <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this);">
                <table border="0" cellpadding="5" cellspacing="0" style="margin-left: 0;">
                  <tr>
                    <td colspan="2"><br><br><strong>About you:</strong></td>
                  </tr>
                  <tr>
                    <td width="200">Name: * </td>
                    <td><input type="text" name="name"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($name) ; ?>"  <?php } ?> />
                        <?php if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['name'] == true )  ) echo "Please enter your name."; ?>
                    </td>
                  </tr>
                  <tr>
                    <td>Company / Organization:</td>
                    <td><input type="text" name="company"   <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($company) ; ?>"  <?php } ?> /></td>
                  </tr>
                  <tr>
                    <td>Email:  * </td>
                    <td><input type="text" name="email"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($email) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['email'] == true )  ) echo "Please enter a valid email."; ?>
                        <div id="uploading" style="position:absolute; visibility:hidden; width:400px; height:152px; z-index:1; left: 217px; top: 768px;"> <img src="../img/uploading.jpg" width="400" height="152" border="0" /></div></td>
                  </tr>
                  <tr>
                    <td>Phone:  * </td>
                    <td><input type="text" name="phone"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($phone) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['phone'] == true )  ) echo "Please enter a phone number."; ?></td>
                  </tr>
                  <tr>
                    <td>Address:  * </td>
                    <td><input type="text" name="address"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($address) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['address'] == true )  ) echo "Please enter your address."; ?></td>
                  </tr>
                  <tr>
                    <td>City:  * </td>
                    <td><input type="text" name="town"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($town) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['town'] == true )  ) echo "Please enter your  town."; ?></td>
                  </tr>
                  <tr>
                    <td>State/Region:  * </td>
                    <td><input type="text" name="region"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($region) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['region'] == true )  ) echo "Please enter your region."; ?></td>
                  </tr>
                  <tr>
                    <td>Zip/Postal code:  * </td>
                    <td><input type="text" name="postcode"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($postcode) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['postcode'] == true )  ) echo "Please enter your postcode."; ?></td>
                  </tr>
                  <tr>
                    <td>Country:  * </td>
                    <td><input type="text" name="country"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($country) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['country'] == true )  ) echo "Please enter your country."; ?></td>
                  </tr>
                  <tr>
                    <td colspan="2"><br><br><strong> About this entry:</strong></td>
                  </tr>
                  <tr>
                    <td> Ad title:  * </td>
                    <td><input type="text" name="title"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($title) ; ?>"  <?php } ?> />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['title'] == true )  ) echo "Please enter a title."; ?></td>
                  </tr>
                  <tr>
                    <td> Technology used:</td>
                    <td><input type="text" name="technology"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($technology) ; ?>"  <?php } ?> />
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2"><br><br><strong>More about this ad: </strong><br>(Include cast and crew information here.)</td>
                  </tr>
                  <tr>
                    <td colspan="2"><textarea name="information" rows="5" cols="43"><?php if( $SERVER_SIDE_FORM_VALIDATION == false ) echo stripslashes($information) ;   ?>
              </textarea></td>
                  </tr>
                  <tr>
                    <td colspan="2"><br><br><strong> File: Upload the file from your computer. </strong></td>
                  </tr>
                  <tr>
                    <td colspan="2"><input name="video" type="file" size="45" />
                        <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['video'] == true )  ) echo "Please upload your video."; ?>
                        <? if( ( !empty($_SESSION['video']['tmp_name'])) && (  empty($_FILES['video']['tmp_name']))  ) echo "Thank you for uploading your video. The form needs completing"; ?>
                        <? if( ( !empty($_SESSION['video']['tmp_name'])) && (  !empty($_FILES['video']['tmp_name']))  ) echo "Thank you for uploading your new video. The form needs completing"; ?>
                    </td>
                  </tr>
                  <tr><td><br></td></tr>
                  <tr>
                    <td colspan="2" align="left" valign="top"><input type="checkbox" name="terms" value="acceptable" /><small> By submitting this entry, I am agreeing with the <a href="../adcontest/rules.html" target="_self">Contest Rules</a>.</small>
<br />
        <br />
        <input type="submit" name="submit" value="Submit " />
                    </td>
                    <td align="left" valign="top"><strong>
                      <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['acceptable'] == true )  ) echo " Details not sent, you need to first agree to the rules."; ?>
                    </strong></td>
                  </tr>
                </table>
                <table width="100%"  border="0" cellspacing="0" cellpadding="5">
                  <tr>
                    <td><?php if( $SERVER_SIDE_FORM_VALIDATION == true  ) echo "Thank you for submitting your entry. You will receive a competition receipt with entry number to the email address you have supplied."; ?></td>
                  </tr>
                </table>
		      </form>
        </td>

        <td valign="top" align="center">
          <h3>Contest Host</h3>
          <a href="http://mozilla.com"><img src="../images/mozilla-corp.png" width="150" height="46" border="0"></a><br><br>

          <br><br><h3>Prize Sponsor</h3>
    	    <a href="http://9xmedia.com"><img src="../images/9xmedia-expand.jpg" width="105" height="63" border="0" /></a><br>

    	    <br><br><br><h3>Grand Prizes</h3>
    	    <a href="../adcontest/prizes-sponsors.html"><img src="../images/bh-giftcards-small.gif" border="0"></a><br><br>
    	    <a href="../adcontest/prizes-sponsors.html"><img src="../images/9x-3-across-small.gif" border="0"></a><br><br>
    	    <a href="../adcontest/prizes-sponsors.html"><img src="../images/alienware-dhs5-small.jpg" border="0"></a><br>

    	     <br><br><br><h3>Friends of Flicks</h3>
    	    <a href="http://www.celtx.com/"><img src="../images/celtx-logo-small.png" border="0"></a>
    	    </td>
      </tr>
    </table>
    </div>


    <table width="" border="0" cellpadding="0" cellspacing="12">
      <tr>
        <td>
          <p id="footer">Mozilla, Firefox, and the Mozilla and Firefox Logos are
          trademarks or registered trademarks of the Mozilla Foundation. <br>
          All other trademarks are property of their respective owners.
          </p>
        </td>
      </tr>
    </table>




    </body>
</html>

