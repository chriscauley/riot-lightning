var human = new Human();

Human.goToSite();

for (let pw of GOOD_PASSWORDS) {
  human.clickLogin()
  human.typePassword()
  human.clickSubmit()
  human.realizePasswordWontValidateWithoutUsernameEnteredAsWell()
  human.enterAUserName()
  human.clickSubmit()
  human.getDistracted()
  human.tryToRememberIfPasswordWasMeantToPassOrFail()
  human.questionLifeChoices()

 ...

}
