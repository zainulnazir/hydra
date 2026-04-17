# Contributing to Hydra

First off, thank you for considering contributing to Hydra! It's people like you that make Hydra such a powerful Stremio add-on.

## How Can I Contribute?

### 1. Reporting Bugs
This section guides you through submitting a bug report for Hydra.
- Ensure the bug was not already reported by searching on GitHub under [Issues](https://github.com/zainulnazir/hydra/issues).
- If you're unable to find an open issue addressing the problem, open a new one. Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or an **executable test case** demonstrating the expected behavior that is not occurring.

### 2. Suggesting Enhancements
This section guides you through submitting an enhancement suggestion for Hydra, including completely new features and minor improvements to existing functionality.
- Please open an issue using the `feature_request.md` template.
- Describe the current behavior and the behavior you expect to see.
- Explain why this enhancement would be useful to most Hydra users.

### 3. Pull Requests
The process described here has several goals:
- Maintain Hydra's quality.
- Fix problems that are important to users.
- Engage the community in working toward the best possible Hydra.

Please follow these steps to have your contribution considered by the maintainers:
1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
3. Create the PR and describe the changes you made. Ensure your code lints properly according to `eslint.config.mjs`.

## Setup for Development

1. **Clone the repository:**
   ```bash
   git clone https://github.com/zainulnazir/hydra.git
   cd hydra
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Run the server in development mode:**
   ```bash
   npm run dev
   ```
   *The server will typically start on port 51546.*

4. **Testing:**
   ```bash
   npm test
   ```

## Adding a New Extractor

1. Navigate to `src/extractor`.
2. Create a new `YourHost.ts` and `YourHost.test.ts`.
3. Implement the `Extractor` interface.
4. Export and register it in `src/extractor/index.ts`.
5. Run the test suite to verify your extractor parses DOM or API data correctly!

Happy Coding! 🐉
