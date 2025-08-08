import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_dialog_plugin_platform_interface.dart';

/// An implementation of [BaseDialogPluginPlatform] that uses method channels.
class MethodChannelBaseDialogPlugin extends BaseDialogPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_dialog_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
