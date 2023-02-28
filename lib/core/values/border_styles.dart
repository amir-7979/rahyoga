import 'package:flutter/material.dart';

import '../theme/colors.dart';

var focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
  borderSide: const BorderSide(
    color: white_bordre,
  ),
);
var enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
  borderSide: const BorderSide(
    color: white_bordre,
  ),
);
var border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
);
var errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
  borderSide: const BorderSide(
    color: redError,

  ),
);


var focusedBorder2 = OutlineInputBorder(
  borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12),),
  borderSide: const BorderSide(
    color: generalItemBorderGray
  ),
);
var enabledBorder2 = OutlineInputBorder(
  borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12),),
  borderSide: const BorderSide(
    color: generalItemBorderGray,
  ),
);
var border2 = OutlineInputBorder(
  borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12),),
);
var errorBorder2 = OutlineInputBorder(
  borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12),),
  borderSide: const BorderSide(
    color: generalItemBorderGray,

  ),
);