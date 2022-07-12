class ConstantsAPI {
  ConstantsAPI._();

  static const baseUrl = 'https://api.igdb.com/v4';
  static const game = '$baseUrl/games';
  static const http = 'http:';

  static const clientId = 'lspi3s8jwrrfamheoymfxq4tyyckcu';
  static const token = 'tzf0d357zz1kblty0700whxtspxr3s';

  static queryData({
    required int idPlatform,
    required int limit,
    required int offset,
  }) {
    '''
      fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
      where platforms = $idPlatform;
      limit $limit;
      offset $offset;
    ''';
  }
}
