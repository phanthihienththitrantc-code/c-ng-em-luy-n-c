import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, process.cwd(), '');
    const config = {
        plugins: [react()],
        base: '/',
        resolve: {
            alias: {
                '@': path.resolve(process.cwd(), './'),
            }
        },
        define: {
            'process.env.GEMINI_API_KEY': JSON.stringify(env.GEMINI_API_KEY)
        }
    };
    return config;
});
