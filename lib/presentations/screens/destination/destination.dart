import 'package:flutter/material.dart';
import 'package:yollararo/presentations/widgets/greet_guide.dart';
import 'package:yollararo/presentations/widgets/service_buttons.dart';
import 'package:yollararo/presentations/widgets/sliding_up_panel_handle.dart';
import 'package:yollararo/presentations/screens/destination/widgets/destination_input_row.dart';

class DestinationPanel extends StatelessWidget {
  const DestinationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Handle
          const YSlidingUpPanelHandle(),
          const SizedBox(height: 16),

          /// Greet & Guide Row
          const YGreetGuide(),
          const SizedBox(height: 16),

          /// Transport Service Buttons
          const YServiceButtons(),
          const SizedBox(height: 10),

          /// Divider
          Divider(thickness: .3, color: Colors.grey[300]),

          /// Destination Input
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// From-To icon
              Image.asset('assets/images/frame.png'),
              const SizedBox(width: 12),

              const Column(
                children: [
                  /// From
                  YDestinationInputRow(hintText: "Qayerdan jo'namoqchisiz?"),
                  SizedBox(height: 12),

                  /// To
                  YDestinationInputRow(hintText: "Qayerga bormoqchisiz?"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Divider
          Divider(thickness: .3, color: Colors.grey[300]),
          const SizedBox(height: 12),

          ElevatedButton(onPressed: () {}, child: const Text('Keyingi', style: TextStyle(fontSize: 16.0))),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
