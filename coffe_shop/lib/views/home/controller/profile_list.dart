import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/views/home/models/prfile_model.dart';

class ProfileList {
  static const List<ProfileModel> profileList = [
    ProfileModel(
      title: 'Your Profile',
      iconPath: Assets.imagesProfileIcon,
    ),
    ProfileModel(
      title: 'My Orders',
      iconPath: Assets.imagesOrdersIcon,
    ),
    ProfileModel(
      title: 'Setting',
      iconPath: Assets.imagesSettingsIcon,
    ),
    ProfileModel(
      title: 'Privacy policy',
      iconPath: Assets.imagesPrivacyIcon,
    ),
    ProfileModel(
      title: 'Invite Friend',
      iconPath: Assets.imagesInviteFreindIcon,
    ),
    /* ProfileModel(
      title: 'Logout',
      iconPath: Assets.imagesLogoutIcon,
    ),*/
  ];
}
