import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(MaterialApp(home: SideNav()));
}

class SideNav extends StatefulWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  String selectedNavItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Title', style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Color(0xFF2E3192),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            UserHeader(),
            Divider(),
            NavItem(
              text: 'Home',
              icon: 'images/1.png',
              isSelected: selectedNavItem == 'Home',
              onTap: () {
                setState(() {
                  selectedNavItem = 'Home';
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeBlankPage()));
                });
              },
            ),
            NavItem(
              text: 'Attendance',
              icon: 'images/2.png',
              isSelected: selectedNavItem == 'Attendance',
              onTap: () {
                setState(() {
                  selectedNavItem = 'Attendance';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttendanceBlankPage()));
                });
              },
            ),
            NavItem(
              text: 'Notification',
              icon: 'images/not.png',
              isSelected: selectedNavItem == 'Notification',
              onTap: () {
                setState(() {
                  selectedNavItem = 'Notification';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationBlankPage()));
                });
              },
            ),
            NavItem(
              text: 'Apply Leave',
              icon: 'images/5.png',
              isSelected: selectedNavItem == 'Apply Leave',
              onTap: () {
                setState(() {
                  selectedNavItem = 'Apply Leave';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApplyLeaveBlankPage()));
                });
              },
            ),
            NavItem(
              text: 'Send Feedback',
              icon: 'images/4.png',
              isSelected: selectedNavItem == 'Send Feedback',
              onTap: () {
                setState(() {
                  selectedNavItem = 'Send Feedback';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SendFeedbackBlankPage()));
                });
              },
            ),
            NavItem(
              text: 'Settings',
              icon: 'images/6.png',
              isSelected: selectedNavItem == 'Settings',
              onTap: () {
                setState(() {
                  selectedNavItem = 'Settings';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsBlankPage()));
                });
              },
            ),
            Spacer(flex: 1),
            AppVersion(),
          ],
        ),
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      accountName: Text(
        'Company Name',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('View More'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Text(
          "View More",
          style: TextStyle(
            color: Color.fromRGBO(46, 49, 146, 1),
            fontFamily: 'Poppins',
          ),
        ),
      ),
      currentAccountPicture: CircleAvatar(
        child: Image.asset(
          'images/bus.png',
          color: Color(0xFF2E3192),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  NavItem({
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? Color(0xFF2E3192) : Colors.transparent,
            width: isSelected ? 1 : 0,
          ),
          color: isSelected ? Colors.white : null,
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(2), // Add this line
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              child: Image.asset(
                icon,
                color: Color(0xFF2E3192),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: isSelected ? Color(0xFF2E3192) : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppVersion extends StatefulWidget {
  @override
  _AppVersionState createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  String version = '';

  @override
  void initState() {
    super.initState();
    getVersion();
  }

  Future<void> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 0),
        ListTile(
          leading: Image.asset(
            'images/mukham_logo 1.png',
            width: 100,
            height: 100,
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'V$version',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF2E3192),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HomeBlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'This is the Home page',
          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF2E3192)),
        ),
      ),
    );
  }
}

class AttendanceBlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Page'),
      ),
      body: Center(
        child: Text(
          'This is the Attendance page',
          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF2E3192)),
        ),
      ),
    );
  }
}

class NotificationBlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Page'),
      ),
      body: Center(
        child: Text(
          'This is the Notification page',
          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF2E3192)),
        ),
      ),
    );
  }
}

class ApplyLeaveBlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Leave Page'),
      ),
      body: Center(
        child: Text(
          'This is the Apply Leave page',
          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF2E3192)),
        ),
      ),
    );
  }
}

class SendFeedbackBlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Feedback Page'),
      ),
      body: Center(
        child: Text(
          'This is the Send Feedback page',
          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF2E3192)),
        ),
      ),
    );
  }
}

class SettingsBlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Text(
          'This is the Settings page',
          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF2E3192)),
        ),
      ),
    );
  }
}
