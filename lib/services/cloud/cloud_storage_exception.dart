class CloudStorageException implements Exception {
  const CloudStorageException();
}

// C in CRUD
class CouldNotCreateException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllCategoryException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdateCategoryException extends CloudStorageException {}

// D in CRUD
class CouldNotDeleteCategoryException extends CloudStorageException {}
