import 'package:cleaningapp/utils/color_scheme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedType = 'initial';
  String selectedFrequency = 'monthly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your Plan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Selected Cleaning',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cleaningDetail(
                          title: 'Initial Cleaning',
                          assetUrl: 'assets/img1.png',
                          type: 'initial',
                        ),
                        cleaningDetail(
                          title: 'Upkeep Cleaning',
                          assetUrl: 'assets/img2.png',
                          type: 'upkeep',
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Selected Frequency',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        frecuencyDetail(title: 'Weekly', frecuency: 'weekly'),
                        frecuencyDetail(
                            title: 'Bi-Weekly', frecuency: 'biweekly'),
                        frecuencyDetail(title: 'Monthly', frecuency: 'monthly'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Selected Extras',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        extraWidget('fridge', 'Inside Fridge', true),
                        extraWidget('organise', 'Organise', false),
                        extraWidget('blind', 'Small Blinds', false),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        extraWidget('garden', 'Patio', false),
                        extraWidget('organise', 'Grocery', true),
                        extraWidget('blind', 'Curtains', false),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: openCalendarScreen,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: purple,
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeSelectedType(String type) {
    setState(() => selectedType = type);
  }

  void changeFrequency(String frequency) {
    setState(() => selectedFrequency = frequency);
  }

  void openCalendarScreen() => Navigator.pushNamed(context, '/CalendarScreen');

  Widget cleaningDetail({
    String title,
    String type,
    String assetUrl,
  }) {
    return InkWell(
      onTap: () => changeSelectedType(type),
      child: Column(
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
              color: Color(0xFFDFDEFF),
              image: DecorationImage(
                image: AssetImage(assetUrl),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEDEDED),
            ),
            child: selectedType == type
                ? Icon(
                    Icons.check_circle,
                    color: pink,
                    size: 30,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget frecuencyDetail({String title, String frecuency}) {
    return InkWell(
      onTap: () => changeFrequency(frecuency),
      child: Container(
        height: 50,
        width: 110,
        decoration: (selectedFrequency == frecuency)
            ? BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.circular(10),
              )
            : BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(10),
              ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: (selectedFrequency == frecuency)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Column extraWidget(String img, String name, bool isSelected) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: purple,
              ),
              child: Container(
                margin: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/$img.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: isSelected
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: pink,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
