/* eslint-disable import/no-default-export, @typescript-eslint/naming-convention */
export default {
  '*.{rb,rake}': (fileNames) => {
    const root = process.cwd();
    const relativePaths = getRelativePaths(fileNames, root);

    return [
      `bundle exec rubocop -a\n${relativePaths}`,
      `bundle exec stree write\n${relativePaths}`,
    ];
  },
  '**/*.{ts,tsx,js,mjs,css,scss,yml,yaml}': () => {
    return ['yarn lint:prettier:fix'];
  },
  '**/*.{ts,tsx,js,mjs}': () => {
    return ['yarn lint:eslint'];
  },
  '**/*.{ts,tsx}': () => {
    return ['tsc --noEmit --skipLibCheck --pretty'];
  },
};

const getRelativePaths = (fileNames, root) => {
  return fileNames.map((fileName) => fileName.replace(root, '.')).join('\n');
};
