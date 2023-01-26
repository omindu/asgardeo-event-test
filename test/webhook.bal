import ballerinax/trigger.asgardeo;
import ballerina/http;

configurable asgardeo:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

service asgardeo:NotificationService on webhookListener {
  
    remote function onSmsOtp(asgardeo:SmsOtpNotificationEvent event ) returns error? {
      //asgardeo:SmsOtpNotificationData? eventData = event.eventData;
      //string toNumber = <string> check eventData.toJson().sendTo;
      //string message = <string> check eventData.toJson().messageBody;

      //string response = check sendSmsClient -> sendSms(toNumber, message);
      log:printInfo(event);
    }
}

service /ignore on httpListener {}
