describe("Good passwords return no error message", function() {
  for (let pw in GOOD_PASSWORDS) {
    it("expects "+pw+"to return no error",function() {
      expect(getPasswordError(pw)).toBeUndefined()
    })
  }
})

describe("Bad passwords return an error message", function() {
  for (let pw in BAD_PASSWORDS) {
    it("expects "+pw+"to return an error message",function() {
      expect(getPasswordError(pw)).toBeTruthy()
    })
  }
})
