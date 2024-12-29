class TApiConstants {
  static const String baseUrl = 'https://sourcesafe.tahamove.com/api/';

  static const String signin = "login";
  static const String signup = "register";
  static const String refresh = "refresh";

  static const String createGroup = "group/create";
  static const String usersOutGroup = "group/users_out_group";
  static const String usersInGroup = "group/users_in_group";
  static const String groupInvitation = "group_invitation/create";
  static const String getGroups = "group/get";
  static const String addUser = "group_invitation/create";
  static const String getFiles = "file/get";
  static const String addFiles = "file/add";
  static const String checkInFiles = "file/check_in";
  static const String editFiles = "file/edit";
  static const String deleteFiles = "file/destroy";
  static const String downloadFiles = "file/download";
  //
  static const String getGroupInvitations = "group_invitation/get";
  static const String groupResponse = "group_invitation/invitation_response";
  //
  static const String getFileRequest = "add_file_request/get";
  static const String fileResponse = "add_file_request/response";
  static const String getFileOperations = "file_operation/get_file_operations";
  static const String getUserOperations = "file_operation/get_user_operations";
  static const String getFileVersions = "file/get_file_versions";
  //
  static const String fileOperations = "file_operation/get_file_operations";
  static const String userOperations = "file_operation/get_user_operations";

  static const String exportFileOperations = "file_operation/export_file_operations";
  static const String exportUserOperations = "file_operation/export_user_operations";

}
