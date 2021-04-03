class InvalidEmailAddressOrPasswordError extends Error {}

class InvalidEmailAddressError extends Error {}
class EmptyEmailAddressError extends Error {}

class InvalidUsernameError extends Error {}
class EmptyUsernameError extends Error {}
class UsernameToShortError extends Error {}
class UsernameToLongError extends Error {}

class InvalidPasswordError extends Error {}
class EmptyPasswordError extends Error {}

class EmptyPasswordAgainError extends Error {}

class PasswordNotEqualPasswordAgainError extends Error {}
class PasswordToShortError extends Error {}
class PasswordToLongError extends Error {}

class NetworkError extends Error {}

class EmailAddressAlreadyInUseError extends Error {}

class UsernameAlreadyInUseError extends Error {}
