import 'package:flutter/material.dart';

class PoliciesAndPrivacy extends StatelessWidget {
  const PoliciesAndPrivacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Policies & Privacy'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Data Collection: Agri-tech360 collects user-submitted data including but not limited to images of plant leaves, geographical location, and user preferences. This data is used solely for the purpose of improving the app\'s functionality and user experience.',
              ),
              Text(
                'Data Usage: User data collected by Agri-tech360 is strictly used for internal purposes such as machine learning model training, improving diagnostic accuracy, and providing personalized recommendations. Data will not be shared with third parties without explicit user consent.',
              ),
              Text(
                'Data Security: Agri-tech360 employs industry-standard security measures to safeguard user data against unauthorized access, alteration, or disclosure. This includes encryption protocols, access controls, and regular security audits.',
              ),
              Text(
                'Opt-Out: Users have the option to opt-out of data collection and sharing by adjusting their privacy settings within the app. However, opting out may limit certain features and functionalities.',
              ),
              SizedBox(height: 16),
              Text(
                'Community Guidelines:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Respectful Communication: Users are expected to engage in respectful and constructive communication within the Agri-tech360 community. Harassment, hate speech, and abusive behavior will not be tolerated.',
              ),
              Text(
                'Accurate Information: Users should strive to provide accurate information when seeking assistance or sharing insights within the community. Misleading or false information may be subject to removal.',
              ),
              Text(
                'Intellectual Property: Respect intellectual property rights when sharing content within the Agri-tech360 community. Users should refrain from posting copyrighted material without proper authorization.',
              ),
              Text(
                'Supportive Environment: Agri-tech360 aims to foster a supportive environment where users can freely exchange ideas, seek advice, and collaborate on agricultural initiatives. Bullying or intimidating behavior will not be tolerated.',
              ),
              SizedBox(height: 16),
              Text(
                'Terms of Service:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Acceptance: By using Agri-tech360, users agree to abide by the app\'s Terms of Service, Privacy Policy, and Community Guidelines.',
              ),
              Text(
                'Liability: Agri-tech360 is not liable for any damages or losses resulting from the use of the app, including but not limited to crop damage, financial loss, or data breaches.',
              ),
              Text(
                'Intellectual Property Rights: All intellectual property rights related to Agri-tech360, including software, algorithms, and content, are owned by the app developer. Users are granted a limited, non-exclusive license to use the app for personal and non-commercial purposes.',
              ),
              Text(
                'Modification of Terms: Agri-tech360 reserves the right to modify or update the Terms of Service, Privacy Policy, and Community Guidelines at any time. Users will be notified of any changes, and continued use of the app constitutes acceptance of the revised terms.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
