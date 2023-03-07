import 'package:shumpo_chaen/app_repository.dart';
import 'package:shumpo_chaen/app_common.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shumpo_chaen/instagram_model.dart';

class AppRepository {
  final _instagramAPI = InstagramApi();

  dynamic fetchInstagram(String text) async {
    return await _instagramAPI.fetchImage(text);
  }
}

class InstagramApi {
  dynamic _fetchHashTagId(String noum) async {
    var url = Uri.https(AppCommon.apiEndpoint, '/v12.0/ig_hashtag_search', {
      'user_id': AppCommon.userId,
      'access_token': AppCommon.accessToken,
      'q': noum
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // e.g. {'data': [{'id': '17842267372066786'}]}
      return body['data'][0]['id'] as String;
    }
    return '';
  }

  dynamic fetchImage(String text) async {
    var hashTagId = await _fetchHashTagId(text);
    if (hashTagId == '') return [];

    var url = Uri.https(AppCommon.apiEndpoint, '/v12.0/$hashTagId/top_media', {
      'user_id': AppCommon.userId,
      'access_token': AppCommon.accessToken,
      'fields': 'media_url',
      'limit': '20',
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // {'data': [{'media_url': 'https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/269652154_3074189952796578_8913276454060245461_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=8ae9d6&_nc_ohc=80WGvTFR-NsAX9KcHj4&_nc_ht=scontent-nrt1-1.cdninstagram.com&edm=APCawUEEAAAA&oh=00_AT8wKCXoLxU7BGBWXyValdJzMSizB74xWlaRFfPmvh3n0Q&oe=61C3B854', 'id': '17929805149909277'}], 'paging': {'cursors': {'after': 'ODc2OTU3OTcyYWU4NGUzMGE4NWFjMWEyOWZAmZAGQ0ZAWEZD'}, 'next': 'https://graph.facebook.com/v12.0/17842267372066786/top_media?access_token=EAAVvr4m3jlUBAJoc0FyQIptZCNMRUDCwbTXdEeSk0njdoCrOSLD6pATdsehI0x6lpfFI12SFS4ZBh8j15a6W3Db8ZCXdKnkYcqVwhZBQLilhdTRPZAjpgeUL8Ht7BQrb54CCZCHSipjSW4G6IbpTaPVpEFwQtueXGeJVqNXXEBDxqHKByscDxZAgV4qPVgQM6kZD&fields=media_url&user_id=17841403696078654&limit=1&after=ODc2OTU3OTcyYWU4NGUzMGE4NWFjMWEyOWZAmZAGQ0ZAWEZD'}}
      final res = InstagramModel.fromJson(json.decode(response.body));

      return res.data;
    }

    return [];
  }
}