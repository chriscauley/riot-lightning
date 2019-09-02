function getPasswordError(value) {
  if (!value || value.length > 20 || value.length < 8) {
    return "Password must be 8-20 characters"
  }
  if (!value.match(/[0-9]/)) {
    return "Password must contain at least one number";
  }
  if (value.toUpperCase() == value || value.toLowerCase == value) {
    return "Password must contain both upper and lower case letters";
  }
}
