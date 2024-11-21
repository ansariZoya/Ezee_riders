import 'package:driver_app/commons/app_text_styles.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 353,
      color: const Color(0xFFFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: SizedBox(
              width: 60,
              child: Divider(
                thickness: 2,
                endIndent: 2,
                indent: 2,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              "How can we help?",
              style: AppTextStyles.baseStyle),
            
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD9D9D9),
                ),
                child: const Icon(
                  Icons.help_outline_rounded,
                  color: Color(0xFF4257D3),
                )),
            title: const Text(
              'Help Centre',
              style: AppTextStyles.baseStyle
            ),
            subtitle:  Text(
              'Find answers to your queries and raise tickets',
              style: AppTextStyles.smalltitle
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                )),
          ),
          ListTile(
            leading: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color:  Color(0xFFD9D9D9),
                ),
                child: const Icon(
                  Icons.confirmation_num_outlined,
                  color: Color(0xFF4257D3),
                )),
            title: const Text(
              'Support Tickets',
              style: AppTextStyles.baseStyle
            ),
            subtitle:  Text(
              'Find answers to your queries and raise tickets',
              style: AppTextStyles.subtitle
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                )),
          ),
          ListTile(
              leading: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD9D9D9),
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Color(0xFFC8C8C8),
                  )),
              title: Row(
                children: [
                  const Text(
                    'Change Language',
                    style:AppTextStyles.baseStyle,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 21,
                      width: 90,
                      child: Container(
                          decoration: const BoxDecoration(color: Color(0xFF4257D3),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                          child:  Text(
                            'COMING SOON',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subtitle
                          )),
                    ),
                  )
                ],
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_right))),
          ListTile(
              leading: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD9D9D9),
                  ),
                  child: const Icon(
                    Icons.cloudy_snowing,
                    color:  Color(0xFFC8C8C8),
                  )),
              title: Row(
                children: [
                  const Text(
                    'Report Rain',
                    style: AppTextStyles.baseStyle,
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 21,
                      width: 90,
                      child: Container(
                          decoration: const BoxDecoration(color: Color(0xFF4257D3),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                          child: Text(
                            'COMING SOON',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subtitle,
                          )),
                    ),
                  )
                ],
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_right)))
        ],
      ),
    );
  }
}
