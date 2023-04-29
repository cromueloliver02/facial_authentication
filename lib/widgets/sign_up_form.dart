import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final VoidCallback onCapture;

  const SignUpForm({
    super.key,
    required this.onCapture,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              hintText: 'Enter name',
              filled: true,
              fillColor: Colors.white54,
              hintStyle: TextStyle(color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: widget.onCapture,
              icon: const Icon(Icons.camera),
              label: const Text('Capture'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
