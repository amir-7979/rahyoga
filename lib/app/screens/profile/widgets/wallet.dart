import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../../../core/languages/translator.dart';
import '../../../data/models/profile.dart';

class Wallet extends StatelessWidget {
   Wallet(this.profile, {Key? key}) : super(key: key);
  Profile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsetsDirectional.all(14),
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadiusDirectional.all(Radius.circular(12))
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/profile/wallet.svg'),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                        child: Text(
                          Translator.balance.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: profilePurple2),
                        ),
                      ),
                    ],
                  ),
                  //todo add balance to user
                  Text(
                    '${profile.phoneNumber} ${Translator.toman.tr}',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: white),
                  ),],
              ),
              const Divider(color: profilePurple2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){},
                    child: Row(children: [
                      const Icon(Icons.add_circle_outline, color: white),
                      const SizedBox(width: 4),
                      Text('${Translator.addBalance.tr}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                            color: white),),

                    ],),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
