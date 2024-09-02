import react from '@vitejs/plugin-react';
import { ConfigEnv, defineConfig, loadEnv } from 'vite';
import FullReload from 'vite-plugin-full-reload';
import RubyPlugin from 'vite-plugin-ruby';
import tsconfigPaths from 'vite-tsconfig-paths';

const envStringToBoolean = () => ({
  name: 'env-string-to-boolean',
  configResolved: (config) => {
    const entries = Object.entries(config.env as Record<string, string>).map(([key, value]) => {
      const target = typeof value === 'string' ? value.toLowerCase() : value;
      const results = {
        true: true,
        false: false,
        null: null,
      };
      return [key, results[target] === undefined ? value : results[target]];
    });
    config.env = Object.fromEntries(entries);
    return config;
  },
});

export default defineConfig(({ mode }: ConfigEnv) => {
  const env = loadEnv(mode, process.cwd(), '');

  return {
    plugins: [
      envStringToBoolean(),
      react({
        babel: {
          plugins: ['babel-plugin-styled-components'],
        },
      }),
      RubyPlugin(),
      FullReload(['config/routes.rb', 'app/view/**/*', 'config/locale/**/*'], { delay: 100 }),
      tsconfigPaths({ root: process.cwd() }),
    ],
    build: {
      outDir: env.BUILD_PATH,
      emptyOutDir: true,
      modulePreload: false,
      rollupOptions: {
        input: {
          application: `${process.cwd()}/app/frontend/entrypoints/application.tsx`,
        },
      },
    },
    envDir: `${process.cwd()}/app/frontend`,
  };
});
