<?php

if($_POST['submit']) { 


  $name = $_POST['name'];
  $company = $_POST['company'];
  $email = $_POST['email'];


///////////////SERVER SIDE FORM VALIDATION ///////////////////////////////////////////////////

 $SERVER_SIDE_FORM_VALIDATION = true  ;
 
 $VALIDATION_ERROR['name'] = false ;
 $VALIDATION_ERROR['email'] = false ;


    if( ($name == "") || (strlen($name ) > 50)  )
    {
             $SERVER_SIDE_FORM_VALIDATION = false ;
             $VALIDATION_ERROR['name'] = true ;
    }


    if(  !ereg("^(.+)@(.+)\\.(.+)$"  , $email ) )
    {
            $SERVER_SIDE_FORM_VALIDATION = false ;
            $VALIDATION_ERROR['email'] = true ;
    }


 if($SERVER_SIDE_FORM_VALIDATION == true ) {
 
    // add record to database ...
	include_once("use_database.inc");
	
	
    $SQL = "INSERT INTO video_contests ( name,company,email)  VALUES ( '$name','$company','$email') ";

    @mysql_query($SQL) or die("Couldn't execute query @mysql_query($SQL).");


    }else{
	       
     // die ; 
		
       }


}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Mozilla Firefox Flicks : Ad-Contest</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="../css/base.css" media="all" />
		<link rel="stylesheet" type="text/css" href="../css/blog.css" media="all" />
		<link rel="stylesheet" type="text/css" href="../css/firefoxflicks.css" media="all" />
		
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

	<body id="developer-mozilla-org">
		<div id="container">
			<p class="skipLink"><a href="#content" accesskey="2">Skip to main content</a></p>

			<div id="mozilla-org"><a href="http://www.mozilla.org/">Visit Mozilla.org</a></div>

			<div id="header">
				<h1><a href="../" title="Return to home page" accesskey="1">Firefox Flicks</a></h1>

		  </div>

			<div id="navigation">
				<div id="bar">
					<div>
						<ul id="personal">
					        <li>&nbsp;</li>
						</ul>
		
						<ul id="contenttypes">

							<li class=""><a href="http://www.spreadfirefox.com">Spread Firefox</a></li>
							<li class="selected"><a href="../advertcontest/">Ad-Contest</a></li>
							<li class=""><a href="../testimonials/">Testimonials</a></li>
							<li class=""><a href="../">Home</a></li>
										
														

						</ul>
					</div>
				</div>
			</div>


            <div id="page">

<div id="breadcrumbs">
	<a href="../">Home</a>

</div>

<div id="sidebar">

Example Firefox Ads<br />
<br />
<img src="../images/ad-vid1.jpg" width="210" height="168" border="0" usemap="#Map" />
<map name="Map" id="Map">
  <area shape="rect" coords="5,139,25,162" href="http://video.google.com/videoplay?docid=5553375459677145292&q=funnyfox" target="_self" alt="Example Firefox Ad" />
</map>
<br />
<img src="../images/ad-vid2.jpg" width="210" height="167" border="0" usemap="#Map2" />
<map name="Map2" id="Map2">
  <area shape="rect" coords="4,140,29,163" href="http://video.google.com/videoplay?docid=-4864774555918805740&q=funnyfox" target="_self" alt="Example Firefox Ad" />
</map>
<br />

<img src="../images/ad-vid3.jpg" width="210" height="168" border="0" usemap="#Map3" />
<map name="Map3" id="Map3">
  <area shape="rect" coords="5,140,25,162" href="http://video.google.com/videoplay?docid=2708620300388281400&q=funnyfox" target="_self" alt="Example Firefox Ad" />
</map>
<br />
<br />






	<div id="related">
		<div>
			<h3>Important Links</h3>
			<ul>
			  <li><a href="http://video.spreadfirefox.com/testimonials/tool" target="_self">Testimonial online-tool </a><br />
              </li>
			  <li><a href="http://www.mozilla.com/firefox/" target="_self">Get Firefox 1.5</a></li>
			  <li><a href="http://www.spreadfirefox.com" target="_self">Spread Firefox Site </a></li>
			  <li><a href="http://developer.mozilla.org/contests/extendfirefox/" target="_self">Extend Firefox Contest </a></li>
		  </ul>
		</div>
	</div>
 
	<div class="stickers">	    
	  <h3>Host</h3>
	  <a href="http://www.mozilla.com"><img src="../images/mozilla-corp.png" alt="Mozilla Corporation" width="150" height="46" /></a>
      <h3>&nbsp; </h3>
      <br />
      </div>
 
</div>

<div id="content">
<div class="post">


<h2><span style="font-weight: bold;">Firefox Flicks</span> Ad Contest </h2>
<p> <strong> </strong><span>Create an ad about Firefox.  </span><span> Show your peers what you can do.  Get  your work in front of a panel of media pros and earn a chance to win great prizes. Sounds exciting? Stay tuned!  Full details will  be released in mid-December, 2005. .</span></p>
<p class="entry"><br /> 
    <strong>Sign up now to get the scoop first!
  </strong></p>

<form onsubmit="return validateForm(this);" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
  <table width="100%" height="0" border="0" cellpadding="4" cellspacing="0">
   
	
	 <tr>
      <td width="451"><strong>Name </strong>(required) <br />
        <input type="text" name="name"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($name) ; ?>"  <?php } ?>  />
         <?php if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['name'] == true )  ) echo "Please enter your name."; ?>  
        </td>
    </tr>
	
	 <tr>
      <td width="451"><strong>Company / Organization</strong><br />
        <input type="text" name="company"   <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($company) ; ?>"  <?php } ?> />
		</td>
    </tr>
	
     <tr>
      <td width="451"><strong>Email </strong>(required) <br />
        <input type="text" name="email"    <?php if( $SERVER_SIDE_FORM_VALIDATION == false ) { ?> value="<?php echo stripslashes($email) ; ?>"  <?php } ?> />    
          <? if( ($SERVER_SIDE_FORM_VALIDATION == false ) && ($VALIDATION_ERROR['email'] == true )  ) echo "Please enter a valid email."; ?>
        </td>
    </tr>
	
	<tr>
      <td width="451"><input type="submit" name="submit" value="Submit "> 
        <span></span><strong>
        </strong></span><?php if( $SERVER_SIDE_FORM_VALIDATION == true  ) echo "Thankyou for submitting .."; ?></td>
    </tr>
  </table>
 </form>


</p>
<div class="entry">
  <p>&nbsp;</p>
</div>

<div class="entry">  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />

<div class="trademark">
</div>

</div>

</div>
</div>

            <div id="footer">
				<div class="trademark">Mozilla, Firefox, and the Mozilla and Firefox Logos are trademarks or registered trademarks of the Mozilla Foundation. <br />
  All other trademarks are property of their respective owners. </div>
				<a href="http://www.spreadfirefox.com" target="_self">Spread Firefox </a> | <a href="http://www.mozilla.org">Mozilla.org</a> </div>

			</div>
        </div>
    </body>
</html>

