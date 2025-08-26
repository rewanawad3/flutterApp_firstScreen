import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.5, // ✅ line-height 150%
      ),
      decoration: InputDecoration(
        hintText: "What are you looking for...",
        hintStyle: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF4F5663), // ✅ background-style color
        ),
        prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF5F5F5), // ✅ grey background
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
