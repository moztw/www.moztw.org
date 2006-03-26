<?  
session_start(); 
$allow_vote='Y'; //前面加 // 就會停止投票
?>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>MozTW 擴充套件票選活動</title>
<script src="js/sorttable.js"></script>
<style type='text/css'>
/* Sortable tables */
table.sortable a.sortheader {
    background-color:#eee;
    color:#666666;
    font-weight: bold;
    text-decoration: none;
    display: block;
}
table.sortable span.sortarrow {
    color: black;
    text-decoration: none;
}
</style>
</head>
<body>
<?
function checkVoted($userid)
{
    if (file_exists("vote/voteuser"))
    {
        $data=file("vote/voteuser");

        foreach($data as $chk)
        {
            $e=explode(',',$chk);
            if(trim($e[0])==$userid) return true;
        }
    }

    return false;
}

if (isset($_COOKIE['phpbb4moztw_data']) && $_COOKIE['phpbb4moztw_data'] != '')
{	//echo $_COOKIE['phpbb4moztw_data']."<br>";
        //userid";i:100088;}
        //取得userid
        $userid=explode(":", $_COOKIE['phpbb4moztw_data']);
        $userid=$userid[(count($userid)-1)];
        $userid=str_replace('"', "", substr($userid, 0, (strrchr($userid,';')-2)));
        if ($userid=="{}") $userid="";
}

//判斷是否投過票了
$voted = (checkVoted($userid))? "Y":"N";
//echo $voted;

if ($userid!='')
{
	$crlf=chr(13).chr(10);


	//處理使用者投票
	    if ($_POST['submit']=="Vote" && $voted!="Y")
	    {

	        $data=file("vote/vote.dat");        //讀入投票資訊

	        //判斷錯誤
	        if (count($_POST['myvote']) == 0)
	        {
	            $err="不可以投廢票！！";
	        }
	        elseif (count($_POST['myvote'])>trim($data[2]))
	        {
	            $err="每人最多只能投".trim($data[2])."票！";
	        }
	        else
	        {

	            $r=rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);

	            $yourvote=$userid.',';   //電郵
	            $yourvote.=$r.',';  //亂數認證
	            $yourvote.='0,';        //認證旗標

	            $url=$chkurl.'?mail='.$userid.'&code='.$r;

	            for($i=1; $i<= trim($data[3]); $i++) //項目
	            {
	                if($_POST['myvote'][$i] != 1)
	                {
	                    $_POST['myvote'][$i]='0';
	                }
	                $yourvote.=$_POST['myvote'][$i];    //記錄
	                if ($i != trim($data[3]))
	                {
	                    $yourvote.=',';
	                }
	            }

	            $file=fopen("vote/voteuser","a");
	            fputs($file,$yourvote.$crlf);
	            fclose($file);
	            //echo $yourvote;

	            /*
	            **************寄信*************
	            */

	            ?>
	            投好票了 ^__^<br><br>
	            謝謝您願意讓我們知道你的寶貴意見。<br><br>
	            要不要<a href=?look=vote>看看</a>投票狀況？
	            <?
	            $psok="Y";
	        }
	    }

	//觀看投票狀況
	    if ($_GET['look']=="vote" && $voted=="Y")
	    {
	        $data=file("vote/vote.dat");          //投票資料
	        $all_vote=trim($data[3]);        //項目
	        for ($i=1; $i<=$data[3]; $i++)   //名稱
	        {
	            $item[$i]=$data[3+$i];
	        }
		//echo $data[0]."<br>".$data[1]."<br>".$data[2]."<br>".$data[3]."<br>";
	        $data=file("vote/voteuser"); //讀取記錄
		
	        foreach($data as $d)
	        {
	            $e=explode(',',$d); //分解
	            
	            //if ($e[2]!='0')   //已經認證
	            {
	            	$total++; //有多少人投票
	                for($i=1; $i<=$all_vote; $i++)
	                {
	                    if(trim($e[2+$i])=='1')
	                    {
	                        $vote[$i]++;
	                    }
	                    //if ($i>53) echo "$i=".$e[2+$i].", \$vote[$i]=".$vote[$i]."<br>";
	                }
	            }
	        }
	        //計算 100%
	        for ($i=1; $i<=$all_vote; $i++)
	        {
	            if ($vote[$i]!=0)
	            {
	                $votep[$i]=($vote[$i] / $total) * 100;
	            }
	            else
	            {
	                $votep[$i]=0;
	            }
	        }

	        //輸出
	        $votehtml= "<table width=\"100%\" border=\"0\" class=\"sortable\" id=\"sort\"><tr><th>套件名稱</th><th>得票數</th><th></th><th style='width: 60%;'></th></tr>";

	        for ($i=1; $i<=$all_vote; $i++)
	        {
	            if ($vote[$i]==0)
	            {
	                $vote[$i]='0';
	            }
	            $votehtml.= "<tr><td>".$item[$i]."</td>
	            <td>".$vote[$i]."</td>
	            <td>".number_format($votep[$i],2)."%</td><td><div style='width: ".number_format($votep[$i],2)."%; background: blue;'>&nbsp;</div><td>";

	            
	//            $votehtml.= "<tr><td colspan=101>&nbsp;</td></tr>";
	        }
	        $votehtml.= "</table><p>共 $total 人投票</p>";

	        echo $votehtml;

	        $psok="Y";
	    }


	//主畫面

	    if($psok != "Y")
	    {
            if($allow_vote!='Y')
            {
	            echo "<br><font color=red>投票已經停止了。<br></font><br>
	                 你可以<a href=?look=vote>看看</a>投票狀況
	            ";
            }
	        elseif ($voted=='Y')
	        {
	            //已經投過了。
	            echo "<br><font color=red>您已經投過票了，一人只能投一次，機會相等。<br></font><br>
	                 你可以<a href=?look=vote>看看</a>投票狀況
	            ";
	        }
            else
            {

	            if (file_exists("vote/vote.dat"))
	            {
	                $data=file("vote/vote.dat");
	                echo "<font color=blue><b>".trim($data[1])."</b></font><br><br>";

	                    //$data=file("vote/vote.dat");

	                    if ($err != "")
	                    {
	                        echo '<big style="color:#ff0000;"><b>'.$err.'</b></big><br><br>';
	                    }
	                    ?><form action="" method="post">
	                    請投下神聖的選票，您最多可以勾選<font color=red><? echo trim($data[2]); ?></font>個套件：<br><br>
	                    <font color="#8000FF">
	                    <?

	                    for($i=1; $i <= $data[3]; $i++)
	                    {
	                        if ($_POST['myvote'][$i]==1)
	                        {
	                            echo "<input type=\"checkbox\" name=\"myvote[$i]\" value=\"1\" checked>".$data[3+$i]."<br>";
	                        }
	                        else
	                        {
	                            echo "<input type=\"checkbox\" name=\"myvote[$i]\" value=\"1\">".$data[3+$i]."<br>";
	                        }
	                    }

	                    echo "</font>";

	                    echo "<br><input type=\"submit\" name=\"submit\" value=\"Vote\">";
	            }
	            else
	            {
	                echo "抱歉，目前沒有投票舉行。";
	            }
			}
	    }
	    else
	    {
	    ?>
	    	<br><br><center>[ <a href="http://forum.moztw.org">回討論區</a> | <a href=?>回投票首頁</a>]</center>
	    <?
	    }
	?>
	</form>
    <?
}else { echo '請先登入 <a href="/">Mozilla@Taiwan</a> 討論區喔！';}
?>
