import 'package:flutter/material.dart';
// import 'package:vegytably_merchant/views/discount_page.dart';
// import 'package:vegytably_merchant/views/order_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  final void Function(int index) setSelectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    this.initialIndex = 0,
    required this.setSelectedIndex,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState(initialIndex);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  _CustomBottomNavigationBarState(int initialIndex) {
    _selectedIndex = initialIndex;
  }
  double Size = 35;
  List<String> _iconNames = ['home', 'menu', 'order', 'profile'];
  List<Widget> _icons = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _iconNames.length; i++) {
      _icons.add(Image.asset(
        'assets/images/${_iconNames[i]}_inactive.png',
        width: Size,
        height: Size,
      ));
    }
    _icons[_selectedIndex] = Image.asset(
      'assets/images/${_iconNames[_selectedIndex]}_active.png',
      width: Size,
      height: Size,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _icons[_selectedIndex] = Image.asset(
        'assets/images/${_iconNames[_selectedIndex]}_inactive.png',
        width: Size,
        height: Size,
      );
      _selectedIndex = index;
      _icons[_selectedIndex] = Image.asset(
        'assets/images/${_iconNames[_selectedIndex]}_active.png',
        width: Size,
        height: Size,
      );
    });
    widget.setSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: List.generate(
        _icons.length,
        (index) => BottomNavigationBarItem(
          icon: _icons[index],
          label: '',
        ),
      ),
    );
  }
}
