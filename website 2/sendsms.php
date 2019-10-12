<?php

require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;


$sid    = "AC75192fc06029131e19657a4d8b898b48";
$token  = "a79ac74c180a0a654cfbc5c39dc483ef";
$twilio = new Client($sid, $token);

$message = $twilio->messages
                  ->create("+15558675310", // to
                           array(
                               "body" => "edbd4965729aaf3bcee24fe128feb141",
                               "from" => "+15017122661"
                           )
                  );

print($message->sid);
