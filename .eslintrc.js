module.exports = {
    "env": {
        "browser": true,
        "es2021": true
    },
    "ignorePatterns": ['.eslintrc.js', 'node_modules/', 'dist/', 'build/'],
    "extends": "standard-with-typescript",
    "overrides": [
        {
            "env": {
                "node": true
            },
            "files": [
                ".eslintrc.{js,cjs}"
            ],
            "parserOptions": {
                "sourceType": "script"
            }
        }
    ],
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module"
    },
    "rules": {
    }
}
