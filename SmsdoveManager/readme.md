# SmsdoveManager
#### Before read
 + This is a docker auto buildable repository.
 + The core smsdove callback codes and core smsdove callback readme.md are in root direcotry: /SmsdoveManager
#### What are used for? 
 + Write callback for my account at smsdove.com, and save the messages into database.
#### How to use? 
 + Registe at https://www.smsdove.com, and login the web browser of pc.
 + Download and install android client of from below the android app:
   - https://play.google.com/store/apps/details?id=com.smsfafa.app.android   (English, named 'SMS DOVE')
   - https://a.app.qq.com/o/simple.jsp?pkgname=com.smsfafa.app.android (Chinese, named '短信发发')
 + Login the android client, set reference below step:
   - click the toggle icon, the android client would access the server of smsdove.com,
    and the toggle button will toggle, and the color of the toggle button would turn light,
    of course, make sure your android phone can connect the internet.
 + Access https://www.smsdove.com/device in your web browser of pc.
   - Look at the table (when I write this document,
    it with a title named 'My Devices'), there are two free devices set row (you can buy more if need),
    here config the first device.
   - Click the option button (when I write this document,
    it look like three little circle, aligned vertical.),
    and the click the setting area, you will be direct to the setting page of the android client.
   - Fill the Device ID number in to android client 'Device ID' textarea.
   - Fill the Access Code content (In my case is a 6 bit number) in to the 'authorization code' textarea.
   - If you want this service auto start when your android phone boot,
    click the toggle icon in three line.
   - Click the back button of your phone navigator.
    Now, the android client was jump to the home page of android client,
    and the Device Id would be updated and showing at the top of the home page.
   - Click the connect button, which is a toggle icon,
    to connect to the server smsdove.com, the color of the toggle icon will change into ligter.
    Of course, make sure your android phone can contact with internet.
 + Now, access https://www.smsdove.com/api in your web browser of pc,
  very good api document would be show to you, you can use any one you like.
 + I like the SMS Receive Callback api,
  so I set Sms Receive Callback URL by click the modify button,
  and edit and save callback url in the popup.
 + And I wrote a simple flask app,
  to defined the receive_callback function which is decorated by flask app.route method,
  with "/received" as the path argument,
  in order to enable the callback I set at the via form area of the api page.
 + Since the route /received would be accessed by the smsdove.com server,
  so this micro flask app must deploy at a machine who has a public ip,
  which can be find by the smsdove.com. 
###### PS. In fact the api is easy to implement, but my technology stack is php, node, python, so android apk development is my blind zone.
  Fortunately, I met smsdove.com, He helped me to improve my phone message auto handle work work flow. 
  Now I can find each old message, by the hand, I can fix the Annoying cell phone verification codes in crawl spiders developments..
##### ENJOY UPDATE!  
# Thanks to smsdove.com
#### Tel: 15823170299 Email: ivuex@yahoo.com  
