import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Bottom Sheet'),
          onPressed: (){
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20)
                  )
                ),
                builder: (context)=> Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: SizedBox(
                            height: 100,
                            child: Image.network("https://images.pexels.com/photos/1921336/pexels-photo-1921336.jpeg?auto=compress&cs=tinysrgb&w=600",
                            fit: BoxFit.contain,)),
                      ),
                      const Divider(),
                      const Text("""
                        Dörtnala gelip Uzak Asya'dan,\n
                        Akdeniz'e bir kısrak başı gibi uzanan bu memleket, bizim.\n
                        Bilekler kan içinde, dişler kenetli, ayaklar çıplak.\n
                        Ve ipek bir halıya benzeyen toprak bu cehennem, bu cennet bizim.\n
                        Kapansın el kapıları, bir daha açılmasın.\n
                        Yok edin insanın insana kulluğunu, bu dâvet bizim...\n
                        Yaşamak bir ağaç gibi tek ve hür ve bir orman gibi kardeşçesine,\n
                        bu hasret bizim...\n
                        """,
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                      const Center(
                        child: Text("Nazım Hikmet",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          child: const Text('Close'),
                          onPressed: ()=> Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}
