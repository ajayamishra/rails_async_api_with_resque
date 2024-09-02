// We can allow node syntax everywhere by setting it inside env.
// But it should only be allowed for this file, so this annotation is added instead.
/* eslint-env node */
module.exports = {
  env: {
    browser: true,
    es2021: true,
    es6: true,
  },
  extends: [
    'eslint:recommended',
    'plugin:react/recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/strict',
    'plugin:react-hooks/recommended',
    'plugin:prettier/recommended',
    'plugin:jsx-a11y/strict',
    'plugin:import/recommended',
    'plugin:import/typescript',
    'plugin:vitest/recommended',
    'plugin:jest-dom/recommended',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },

    ecmaVersion: 'latest',
    project: ['./tsconfig.json'],
    sourceType: 'module',
  },
  plugins: [
    'react',
    'react-hooks',
    '@typescript-eslint',
    'jsx-a11y',
    'prettier',
    'import',
    'unused-imports',
    'vitest',
    'jest-dom',
  ],
  rules: {
    '@typescript-eslint/default-param-last': 'error',
    '@typescript-eslint/dot-notation': 'off', // TEMPORARY for ES Modules
    '@typescript-eslint/naming-convention': [
      'error',
      {
        format: ['camelCase'],
        selector: 'default',
      },
      {
        format: ['camelCase', 'PascalCase', 'UPPER_CASE'],
        selector: 'enumMember',
      },
      {
        format: ['camelCase', 'PascalCase', 'UPPER_CASE'],
        selector: 'variable',
      },
      {
        format: ['strictCamelCase'],
        selector: 'function',
      },
      {
        custom: {
          match: false,
          regex: '^I[A-Z]',
        },
        format: ['PascalCase'],
        selector: 'interface',
      },
      {
        format: ['camelCase', 'PascalCase'],
        leadingUnderscore: 'allow',
        selector: 'parameter',
      },
      {
        format: ['camelCase', 'PascalCase'],
        selector: 'property',
      },
      {
        format: ['camelCase'],
        leadingUnderscore: 'require',
        modifiers: ['private'],
        selector: 'memberLike',
      },
      {
        format: ['PascalCase'],
        selector: 'typeLike',
      },
      {
        filter: { match: false, regex: '_' }, // Disallow only snake case
        format: null,
        selector: 'objectLiteralProperty',
      },
      {
        format: ['camelCase'],
        selector: 'objectLiteralMethod',
      },
      {
        format: ['camelCase', 'UPPER_CASE'],
        selector: 'enumMember',
      },
    ],
    '@typescript-eslint/no-empty-function': 'off', // TEMPORARY for ES Modules
    '@typescript-eslint/no-explicit-any': 'error', // DO NOT DISABLE
    '@typescript-eslint/no-non-null-assertion': 'error',
    '@typescript-eslint/no-shadow': 'error',
    '@typescript-eslint/no-unused-vars': [
      'error',
      {
        args: 'all',
        argsIgnorePattern: '^_',
        vars: 'all',
        varsIgnorePattern: '^_',
      },
    ],
    '@typescript-eslint/no-use-before-define': 'error',
    '@typescript-eslint/restrict-template-expressions': ['error', { allowNullish: true }],
    'block-scoped-var': 'error',
    curly: ['error', 'multi-line', 'consistent'],
    'default-case': 'error',
    'default-case-last': 'error',
    eqeqeq: ['error', 'always', { null: 'ignore' }],
    'import/no-default-export': 'error',
    'import/order': [
      'error',
      {
        alphabetize: {
          caseInsensitive: true,
          order: 'asc',
        },
        groups: ['builtin', 'external', 'internal', 'parent', 'sibling', 'index', 'object', 'type'],
        pathGroups: [
          {
            group: 'internal',
            pattern: '@/**',
            position: 'before',
          },
          {
            group: 'internal',
            pattern: '~/**',
            position: 'before',
          },
        ],
      },
    ],
    'no-alert': 'error',
    'no-console': 'error',
    'no-duplicate-imports': 'error',
    'no-else-return': 'error',
    'no-implicit-globals': 'error',
    'no-unneeded-ternary': 'error',
    'no-useless-return': 'error',
    'no-var': 'error',
    'object-shorthand': ['error', 'always'],
    'prefer-arrow-callback': 'error',
    'prefer-const': 'error',
    'prefer-destructuring': 'error',
    'prefer-object-spread': 'error',
    'prefer-promise-reject-errors': 'error',
    'react-hooks/exhaustive-deps': 'error',
    'react/jsx-sort-props': 'error',
    'react/jsx-uses-react': 'off',
    'react/no-unknown-property': ['error', { ignore: ['css'] }],
    'react/react-in-jsx-scope': 'off',
    'sort-keys': ['error', 'asc', { natural: false }],
    'sort-vars': 'error',
    'unused-imports/no-unused-imports': 'error',
    'unused-imports/no-unused-vars': [
      'error',
      {
        args: 'all',
        argsIgnorePattern: '^_',
        vars: 'all',
        varsIgnorePattern: '^_',
      },
    ],
  },
  settings: {
    'import/resolver': {
      node: {
        extensions: ['.ts', '.tsx', '.js', '.jsx', '.mjs', '.json', '.d.ts'],
      },
      typescript: {},
    },
  },
};
