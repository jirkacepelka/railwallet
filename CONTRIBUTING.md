# Contributing to Railgun Vault Wallet

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to the project.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on the code, not the person
- Help others learn and grow

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/railgun-vault-wallet.git`
3. Create a feature branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test thoroughly
6. Commit with clear messages
7. Push to your fork
8. Create a Pull Request

## Development Setup

```bash
# Install dependencies
flutter pub get

# Run analysis
flutter analyze

# Run tests
flutter test

# Format code
dart format lib/
```

## Code Style

- Follow Dart style guide
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused
- Use type annotations

## Commit Messages

Use clear, descriptive commit messages:

```
feat: Add QR code scanning feature
fix: Resolve balance display issue
docs: Update README with setup instructions
refactor: Simplify transaction processing
test: Add unit tests for address validator
```

## Pull Request Process

1. Update documentation if needed
2. Add tests for new features
3. Ensure all tests pass: `flutter test`
4. Run analysis: `flutter analyze`
5. Format code: `dart format lib/`
6. Provide clear PR description
7. Link related issues

## Testing

- Write unit tests for utilities
- Write widget tests for UI components
- Test on both Android and iOS if possible
- Test on testnet before mainnet

## Security

- Never commit private keys or API keys
- Use environment variables for sensitive data
- Review security implications of changes
- Report security issues privately

## Documentation

- Update README for user-facing changes
- Add code comments for complex logic
- Document new functions and classes
- Keep CHANGELOG updated

## Questions?

- Open an issue for questions
- Check existing documentation
- Review similar implementations

Thank you for contributing!
