import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppVersionInfo {
  final int versionCode;
  final String versionName;
  final String downloadUrl;
  final String releaseNotes;

  AppVersionInfo({
    required this.versionCode,
    required this.versionName,
    required this.downloadUrl,
    required this.releaseNotes,
  });
}

class AppUpdateService {
  final SupabaseClient _client;

  AppUpdateService(this._client);

  /// Checks if a newer version is available.
  /// Returns [AppVersionInfo] if update available, null otherwise.
  Future<AppVersionInfo?> checkForUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentBuild = int.tryParse(packageInfo.buildNumber) ?? 0;

    final response = await _client
        .from('app_versions')
        .select()
        .eq('is_active', true)
        .order('version_code', ascending: false)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;

    final remoteCode = response['version_code'] as int;
    if (remoteCode <= currentBuild) return null;

    return AppVersionInfo(
      versionCode: remoteCode,
      versionName: response['version_name'] as String,
      downloadUrl: response['download_url'] as String,
      releaseNotes: (response['release_notes'] as String?) ?? '',
    );
  }

  /// Downloads APK to a temporary file. [onProgress] receives 0.0–1.0.
  Future<String> downloadApk(
    String url, {
    void Function(double progress)? onProgress,
  }) async {
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/appbuelito_update.apk';

    await Dio().download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total > 0 && onProgress != null) {
          onProgress(received / total);
        }
      },
    );

    return filePath;
  }

  /// Opens the downloaded APK for installation.
  Future<void> installApk(String filePath) async {
    await OpenFilex.open(filePath, type: 'application/vnd.android.package-archive');
  }
}
