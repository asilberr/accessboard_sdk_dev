import 'package:cached_network_image/cached_network_image.dart';
import 'package:accessboard_sdk_24/src/core/widgets/animations/hero_animation.dart';
import 'package:accessboard_sdk_24/src/features/help_center/chat/chat_screen.dart';
import 'package:accessboard_sdk_24/src/features/help_center/contact/contact_screen.dart';
import 'package:accessboard_sdk_24/src/features/help_center/faq/faq_page.dart';
import 'package:flutter/material.dart';

/// HelpCenterScreen
class HelpCenterScreen extends StatelessWidget {
  /// HelpCenter
  const HelpCenterScreen({super.key, required this.uuid});
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/help_center2.png',
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ),
          Text(
            'Tell us how we can help you today.',
            style: TextStyle(color: Colors.grey[700]),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContactCard(
                  imagePath: 'assets/images/help_center_card1.png',
                  title: 'FAQ',
                  subtitle: 'Frequently Asked Questions, for $uuid',
                  onPressed: () {
                    heroAnimation(
                        destinationWidget: const FaqPage(), context: context);
                  },
                  heroTag: 'faq_page',
                ),
                ContactCard(
                  imagePath: 'assets/images/help_center_card2.png',
                  title: 'Chat',
                  subtitle: 'Chat with a support agent',
                  onPressed: () {
                    heroAnimation(
                        destinationWidget: const ChatScreen(),
                        context: context);
                  },
                  heroTag: 'chat_page',
                ),
                ContactCard(
                  imagePath: 'assets/images/help_center_card3.png',
                  title: 'Contact',
                  subtitle: 'Contact us for help',
                  onPressed: () {
                    heroAnimation(
                        destinationWidget: const ContactScreen(),
                        context: context);
                  },
                  heroTag: 'contact_page',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ContactCard
class ContactCard extends StatelessWidget {
  /// ContactCard
  const ContactCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.heroTag,
    super.key,
  });

  /// imagePath
  final String imagePath;

  /// title
  final String title;

  /// subtitle
  final String subtitle;

  /// onPressed
  final VoidCallback onPressed;

  /// heroTag
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          height: 75,
          child: Card(
            color: Colors.white,
            child: InkWell(
              onTap: onPressed,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
