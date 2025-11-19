import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> ResumeLink()async{
  final resumeLink=Uri.parse("https://drive.google.com/file/d/1ipWFJTILbIBjKt5-plp46k5ckir3hUIR/view?usp=drivesdk");
  try{
    if (await canLaunchUrl(resumeLink)){
    await launchUrl(resumeLink,mode: LaunchMode.externalApplication);
  }
  else
     Get.snackbar("Error", "Something went wrong");
}
catch(e){
    print(e);
}
}
Future<void> FaceBookLink()async{
  final faceBookLink=Uri.parse("https://www.facebook.com/share/19AXJkg3iQ/");
  try{
    if(await canLaunchUrl(faceBookLink)) {
      await launchUrl(faceBookLink, mode: LaunchMode.externalApplication);
    }
    else
      Get.snackbar("Error", "Something went wrong");
  }
      catch(e){
    print(e);
      }
}
