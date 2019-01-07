import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:flutter_redux_boilerplate/services/github_repository.dart';
import 'package:flutter_redux_boilerplate/services/github_web_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  group('The GithubRepository', () {
    GithubRepository uut;
    GithubWebClient mockGithubWebClient;

    setUp(() {
      mockGithubWebClient = MockGithubWebClient();

      uut = GithubRepository(
        githubWebClient: mockGithubWebClient,
      );
    });

    group('when loadRepoResult', () {
      Future<GithubRepoResult> result;
      String givenQuery = 'some query';
      GithubRepoResult givenResponse = GithubRepoResult();

      setUp(() {
        when(mockGithubWebClient.fetchRepoResult(givenQuery)).thenAnswer((_) => Future.value(givenResponse));

        result = uut.loadRepoResult(givenQuery);
      });

      test('should return the result of the fetch', () async {
        expect(await result, givenResponse);
      });
    });
  });
}