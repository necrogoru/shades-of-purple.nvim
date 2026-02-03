module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'subject-empty': [2, 'never'],
    'scope-case': [2, 'always', ['pascal-case']]
  }
}
