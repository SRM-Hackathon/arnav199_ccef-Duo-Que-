

<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
//https://www.twilio.com/docs/sms/tutorials/how-to-receive-and-reply-php
require_once 'vendor/autoload.php'; // Loads the library where the packages and the vendor folder, along with the autoload script is created.
use Twilio\Twiml\MessagingResponse;

$response = new MessagingResponse();
$response->message("Here is the location for the phone");
print $response;