const String talkBaseUrl = 'https://qa.habibapp.com';
const String baseAddress = "https://habibapp.com";
const String uploadTmpMedia = '$baseAddress/upload-tmp-media/';

String talkVoiceUrl(String? audioUrl) {
  return '$talkBaseUrl$audioUrl';
}
