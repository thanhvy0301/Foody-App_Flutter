import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: Colors.orange.shade400),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                "Account info",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                showLoadingDialog(context); // Show the loading dialog
                final pref = await SharedPreferences.getInstance();
                await pref.remove('username');
                await Future.delayed(
                    const Duration(seconds: 2)); // Delay for 2 seconds
                // ignore: use_build_context_synchronously
                hideLoadingDialog(context); // Hide the loading dialog
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(
                    context, '/signIn_page'); // Navigate to the sign-in page
              },
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
