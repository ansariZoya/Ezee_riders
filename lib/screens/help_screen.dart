import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 353,
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
            padding: EdgeInsets.only(left: 20,top: 30),
            child: Text(
              "How can we help?",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black,fontFamily: 'ProductSans'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const SizedBox(
                width: 15,
                height: 15,
                child: Icon(
                  Icons.help_outline_rounded,
                  color: Colors.blue,
                )),
            title: const Text(
              'Help Centre',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,fontFamily: 'ProductSans'),
            ),
            subtitle: const Text(
              'Find answers to your queries and raise tickets',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,fontFamily: 'ProductSans'),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                )),
          ),
          ListTile(
            leading: const SizedBox(
                width: 15,
                height: 15,
                child: Icon(
                  Icons.confirmation_number,
                  color: Colors.blue,
                )),
            title: const Text(
              'Support Tickets',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,fontFamily: 'ProductSans'),
            ),
            subtitle: const Text(
              'Find answers to your queries and raise tickets',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,fontFamily: 'ProductSans'),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                )),
          ),
          ListTile(
            leading: const SizedBox(
                width: 15,
                height: 15,
                child: Icon(
                  Icons.language,
                  color: Colors.grey,
                )),
                
              title: Row(
                children: [
                  const Text(
                    'Change Language',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,fontFamily: 'ProductSans'),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    height: 21,
                    width: 80,
                    child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        child: const Text(
                          'COMING SOON',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,fontFamily: 'ProductSans'),
                        )),
                  )
                ],
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right))
          
            ),
          
          ListTile(
              leading: const SizedBox(
                  width: 15,
                  height: 15,
                  child: Icon(
                    Icons.cloudy_snowing,
                    color: Colors.grey,
                  )),
              title: Row(
                children: [
                  const Text(
                    'Report Rain',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,fontFamily: 'ProductSans'),
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  SizedBox(
                    height: 21,
                    width: 80,
                    child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        child: const Text(
                          'COMING SOON',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,fontFamily: 'ProductSans'),
                        )),
                  )
                ],
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)))
        ],
      ),
    );
  }
}
