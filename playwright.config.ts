import { devices } from '@playwright/test';
import environmentVariables from "./environment-variables"

console.log(environmentVariables)

export default {
  // Specify the browsers to run the tests on
  browsers: ['chromium'],

  // Use the 'Desktop' device descriptor from Playwright's devices
  use: {
    headless: false,
    tsconfig: "tsconfig.json",
    ...devices['Desktop'],
  },

  // Set the base URL for the tests
  baseURL: environmentVariables.baseURL,

  // Global setup and teardown scripts
//   globalSetup: './global-setup.ts',
//   globalTeardown: './global-teardown.ts',

  // Other options...
};
