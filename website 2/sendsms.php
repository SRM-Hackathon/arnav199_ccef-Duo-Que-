<?php
// api to send sms to the mobile numbers through twillio API
//code from twillio https://www.twilio.com/docs/sms/send-messages
require_once '/path/to/vendor/autoload.php';// Loads the library where the packages and the vendor folder, along with the autoload script is created.
use Twilio\Rest\Client;


$sid    = "AC75192fc06029131e19657a4d8b898b48";// account sid we got from twilio
$token  = "a79ac74c180a0a654cfbc5c39dc483ef";// account tokken we got from twilio
$twilio = new Client($sid, $token);

$message = $twilio->messages
                  ->create("+15558675310", // to
                           array(
                               "body" => "edbd4965729aaf3bcee24fe128feb141",// md5 encryted text
                               "from" => "+15017122661"// number provided by twilio
                           )
                  );

print($message->sid);
echo "The message has been sent. Please move forward to Receive sms to get the location";
$target ="receivesms.php";
	$linkname = "Receive SMS"
	link($target,$linkname);
?>
