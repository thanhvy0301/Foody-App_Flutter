import 'package:flutter/material.dart';

class CheckOutCart extends StatelessWidget {
  double sum;
  CheckOutCart({super.key, required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildSum(),
        _buildCheckOut(),
      ],
    );
  }

  Widget _buildSum() {
    return Expanded(
      child: SizedBox(
        height: 50.0,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Sum: $sum',
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckOut() {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Check out'.toUpperCase(),
            style: const TextStyle(fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
