class QueryMutation{
  String login(String email, String password){
  return """
                mutation login(){
                  login(email:\$email,password:\$password){
                    token
                  }
                }
                """;
} 
}

const String addStar = '''
  mutation AddStar(\$starrableId: ID!) {
    addStar(input: {starrableId: \$starrableId}) {
      starrable {
        viewerHasStarred
      }
    }
  }
''';
