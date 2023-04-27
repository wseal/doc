import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import path from "path"; // yarn add @types/node -D
import { createStyleImportPlugin, AntdResolve } from "vite-plugin-style-import";
// yarn add consola -D

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), createStyleImportPlugin({ resolves: [AntdResolve()] })],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
});
