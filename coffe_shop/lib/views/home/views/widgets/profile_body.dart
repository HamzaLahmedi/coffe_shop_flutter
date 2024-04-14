import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_profile_list_view.dart';
import 'package:coffe_shop/views/home/views/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileHeader(),
            Text(
              'Shahzaib R.',
              style: AppStyles.styleSemiBold24,
            ),
            CustomProfileListView()
          ],
        ),
      ),
    );
  }
}
