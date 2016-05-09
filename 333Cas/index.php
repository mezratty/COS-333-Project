<?php
require 'CASClient.php';
$C = new CASClient();
$netid = $C->Authenticate();

//print "Hello from the other side, $netid.";
//echo "<P>Think of this as the main page of your application ";
//echo "after $netid has been authenticated.";
//echo "this is my code"


/*
echo '

  <form METHOD=GET ACTION="https://still-brushlands-47074.herokuapp.com/index1.php">
       <input type=submit value="Proceed as "$netid>
  </form>
  ';

*/
 echo "
  <META http-equiv='refresh' content='0;https://awojak.mycpanel2.princeton.edu/333/index1.php?id=$netid'>
";


?> 