# create package:todos_api under packages/todos_api
very_good create dart_package todos_api --desc "The interface and models for an API providing access to todos." -o packages

# create package:local_storage_todos_api under packages/local_storage_todos_api
very_good create flutter_package local_storage_todos_api --desc "A Flutter implementation of the TodosApi that uses local storage." -o packages

# create package:todos_repository under packages/todos_repository
very_good create dart_package todos_repository --desc "A repository that handles todo related requests." -o packages

# install all the dependencies:
very_good packages get --recursive