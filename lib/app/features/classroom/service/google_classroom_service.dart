import 'dart:convert';
import 'dart:io';

import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/features/classroom/model/classroom_context.dart';
import 'package:profile_challenge_app/app/features/classroom/model/classroom_failure.dart';
import 'package:profile_challenge_app/app/features/classroom/service/classroom_service.dart';

class GoogleClassroomService implements ClassroomService {
  static const String _courseId = '865036664004';
  static const String courseUrlCode = 'ODY1MDM2NjY0MDA0';
  static const String _baseUrl = 'https://classroom.googleapis.com/v1';

  @override
  Future<ClassroomContext> fetchTalkwareCourse({
    required Map<String, String> authHeaders,
  }) async {
    final course = await _getJson(
      '$_baseUrl/courses/$_courseId',
      authHeaders: authHeaders,
    );
    final courseWork = await _getOptionalList(
      '$_baseUrl/courses/$_courseId/courseWork',
      listKey: 'courseWork',
      authHeaders: authHeaders,
      unavailableMessage: AppString.classroomCourseWorkUnavailable,
    );
    final announcements = await _getOptionalList(
      '$_baseUrl/courses/$_courseId/announcements',
      listKey: 'announcements',
      authHeaders: authHeaders,
      unavailableMessage: AppString.classroomAnnouncementUnavailable,
    );

    final courseName = _stringValue(course['name']);
    final section = _stringValue(course['section']);
    final description =
        _stringValue(course['descriptionHeading']) ??
        _stringValue(course['description']);
    final latestCourseWork = _firstItem(courseWork.items);
    final latestAnnouncement = _firstItem(announcements.items);

    return ClassroomContext(
      courseName: courseName ?? AppString.classroomCourseNameUnavailable,
      courseDetails: _joinDetails(section, description),
      courseWorkTitle:
          _stringValue(latestCourseWork?['title']) ?? courseWork.message,
      courseWorkStatus: courseWork.message,
      announcementText:
          _stringValue(latestAnnouncement?['text']) ?? announcements.message,
    );
  }

  Future<Map<String, dynamic>> _getJson(
    String url, {
    required Map<String, String> authHeaders,
  }) async {
    final response = await _get(url, authHeaders: authHeaders);

    if (response.statusCode == HttpStatus.ok) {
      return _decodeObject(response.body);
    }

    throw ClassroomFailure(
      _messageForStatus(response.statusCode, body: response.body),
    );
  }

  Future<_OptionalClassroomItems> _getOptionalList(
    String url, {
    required String listKey,
    required Map<String, String> authHeaders,
    required String unavailableMessage,
  }) async {
    final response = await _get(url, authHeaders: authHeaders);

    if (response.statusCode != HttpStatus.ok) {
      return _OptionalClassroomItems(message: unavailableMessage);
    }

    final data = _decodeObject(response.body);
    final rawItems = data[listKey];

    if (rawItems is! List || rawItems.isEmpty) {
      return const _OptionalClassroomItems(
        message: AppString.classroomNoRecentAcademicContext,
      );
    }

    return _OptionalClassroomItems(
      items: rawItems.whereType<Map<String, dynamic>>().toList(),
    );
  }

  Future<_ClassroomResponse> _get(
    String url, {
    required Map<String, String> authHeaders,
  }) async {
    try {
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(url));

      for (final header in authHeaders.entries) {
        request.headers.set(header.key, header.value);
      }

      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      client.close();

      return _ClassroomResponse(statusCode: response.statusCode, body: body);
    } catch (_) {
      throw const ClassroomFailure(AppString.classroomTemporaryUnavailable);
    }
  }

  Map<String, dynamic> _decodeObject(String body) {
    final decoded = jsonDecode(body);

    if (decoded is Map<String, dynamic>) {
      return decoded;
    }

    throw const ClassroomFailure(AppString.classroomTemporaryUnavailable);
  }

  String _messageForStatus(int statusCode, {required String body}) {
    if (statusCode == HttpStatus.unauthorized) {
      return AppString.classroomPermissionNotGranted;
    }

    if (statusCode == HttpStatus.forbidden && _isPermissionError(body)) {
      return AppString.classroomPermissionNotGranted;
    }

    if (statusCode == HttpStatus.forbidden ||
        statusCode == HttpStatus.notFound) {
      return AppString.classroomNoCourseAccess;
    }

    return AppString.classroomTemporaryUnavailable;
  }

  bool _isPermissionError(String body) {
    return body.contains('insufficientPermissions') ||
        body.contains('ACCESS_TOKEN_SCOPE_INSUFFICIENT') ||
        body.contains('Request had insufficient authentication scopes');
  }

  String? _stringValue(Object? value) {
    if (value is! String) {
      return null;
    }

    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  String? _joinDetails(String? section, String? description) {
    final details = [section, description]
        .where((value) => value != null && value.isNotEmpty)
        .cast<String>()
        .toList();

    return details.isEmpty ? null : details.join('\n');
  }

  Map<String, dynamic>? _firstItem(List<Map<String, dynamic>> items) {
    return items.isEmpty ? null : items.first;
  }
}

class _ClassroomResponse {
  const _ClassroomResponse({required this.statusCode, required this.body});

  final int statusCode;
  final String body;
}

class _OptionalClassroomItems {
  const _OptionalClassroomItems({this.items = const [], this.message});

  final List<Map<String, dynamic>> items;
  final String? message;
}
