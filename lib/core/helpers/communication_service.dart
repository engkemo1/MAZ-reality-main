import 'package:url_launcher/url_launcher.dart' as url_launcher; // Alias for clarity

class CommunicationService {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');
    if (await url_launcher.canLaunchUrl(url)) {
      await url_launcher.launchUrl(url);
    } else {
      throw Exception('Could not launch phone call');
    }
  }

  static Future<void> openWhatsAppChat(String phoneNumber, String message) async {
    final encodedMessage = Uri.encodeComponent(message);
    final url = Uri.parse('https://wa.me/$phoneNumber/?text=$encodedMessage');
    if (await url_launcher.canLaunchUrl(url)) {
      await url_launcher.launchUrl(url);
    } else {
      throw Exception('Could not launch WhatsApp chat');
    }
  }
}
