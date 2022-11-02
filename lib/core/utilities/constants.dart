import 'package:duka/core/utilities/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'color_asset.dart';

InputDecoration kFormTextDecoration = InputDecoration(
  hintStyle: const TextStyle(
    color: Palette.inactiveGrey,
  ),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      SizeMg.radius(10),
    ),
    borderSide: BorderSide(
      width: SizeMg.width(2),
      color: Palette.inactiveGrey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      SizeMg.radius(10),
    ),
    borderSide: BorderSide(
      width: SizeMg.width(2),
      color: Palette.staleBlue,
    ),
  ),
);

NumberFormat kNumberFormat = NumberFormat('0,000.00');

InputDecoration kProfileInputDecoration = InputDecoration(
  filled: true,
  fillColor: Palette.offWhite,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(SizeMg.radius(15),),
  ),
);