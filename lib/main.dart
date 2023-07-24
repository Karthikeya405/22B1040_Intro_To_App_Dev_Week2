import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Transform.scale(
                  scale: 0.6,
                  child: Image.asset(
                    'assets/icons/arrow.png',
                    color: Colors.deepPurpleAccent[100],
                  ),
                ),
              ),

            const SizedBox(width: 40),

            const Text(
              'Budget Tracker',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent[100],
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: const AssetImage(
                      'assets/images/user.png',
                  ),
                  backgroundColor: Colors.deepPurpleAccent[100],
                )
            ),
            const SizedBox(height: 30),
            const Center(
              child: Column(
                children: [
                  Text(
                      'Welcome',
                    style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 2.0,
                      fontFamily: 'Lobster',
                    ),
                  ),
                  Text(
                    'Back!',
                    style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 2.0,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                      return Expenses();
                     })
                );
              },
              child: const TotalCard(),
            ),
          ],
        ),
      ),
    );
  }
  }

class TotalCard extends StatefulWidget {
  const TotalCard({Key? key}): super(key: key);

  @override
  State<TotalCard> createState() => _TotalCardState();
}

class _TotalCardState extends State<TotalCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 365,
      height: 70,
        child: Card(
          color: Colors.purple[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 10.0, 15.0, 10.0),
            child: Row(
              children: [
                 const Expanded(
                  flex: 2,
                  child: Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                 const Expanded(
                  flex: 1,
                  child: Text(
                      '48700',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    'assets/icons/double-down-arrow.png',
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class ExpenseCard extends StatefulWidget {
  const ExpenseCard({Key? key, required this.category, required this.cost}): super(key: key);

  final String category;
  final int cost;

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23),
      child: Row(
        children: [
           SizedBox(
              height: 60,
              width: 315,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.purple[50],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 15.0, 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            widget.category,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent[100],
                          ),
                        ),
                      ),
                       if(widget.cost>=0)
                         Text(
                           '+${widget.cost}',
                           style:const TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),
                         )
                      else
                         Text(
                           '${widget.cost}',
                           style:const TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              )
          ),
          SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('assets/icons/trash.png')
          ),
        ],
      ),
    );
  }
}


class Expenses extends StatelessWidget {
  Expenses({super.key});
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future openDialog(){
      return showDialog(
        barrierColor: Colors.white.withOpacity(0.0),
          context: context,
          builder: (context){
            return AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0),
                  actionsPadding: const EdgeInsets.all(20),
                  titlePadding: const EdgeInsets.all(20),
                  backgroundColor: Colors.purple[800],
                  title: const Center(
                        child: Text(
                            'New Entry',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: 170,
                                  child: TextField(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                    controller: controller1,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                         Row(
                          children: [
                             const Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                              const SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: 190,
                                  child: TextField(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                    controller: controller2,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  actions: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: GestureDetector(
                          onTap: (){
                            String category = controller1.text;
                            int price = int.parse(controller2.text);
                            debugPrint('$category : $price');
                            controller1.clear();
                            controller2.clear();
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/icons/check.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
            );
          });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },

              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Transform.scale(
                  scale: 0.7,
                  child: Image.asset(
                    'assets/icons/arrow.png',
                    color: Colors.deepPurpleAccent[100],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 40),

            const Text(
              'Budget Tracker',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent[100],
        centerTitle: true,
      ),
      body:const Center(
        child: Column(
          children: [
            SizedBox(height: 90),
            TotalCard(),
            SizedBox(height: 70),
            ExpenseCard(category: 'Groceries',cost: -300),
            SizedBox(height: 40),
            ExpenseCard(category: 'Bills', cost: -1000),
            SizedBox(height: 40),
            ExpenseCard(category: 'Salary', cost: 50000),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: (){
            openDialog();
          },
          backgroundColor: Colors.white,
          elevation: 0,
          child: Icon(
              Icons.add,
            color: Colors.deepPurpleAccent[100],
            size: 40,
          ),
        ),
      ),
    );
  }
}