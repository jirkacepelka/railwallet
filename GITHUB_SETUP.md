# GitHub Setup Guide

Complete guide to set up the project on GitHub and enable CI/CD.

## Prerequisites

- GitHub account
- Git installed locally
- Project files ready

## Step 1: Create GitHub Repository

### Option A: Via GitHub Web

1. Go to [github.com/new](https://github.com/new)
2. Repository name: `railgun-vault-wallet`
3. Description: `Railgun-Only Vault Wallet for Arbitrum L2`
4. Choose: Public or Private
5. **Do NOT** initialize with README (we have one)
6. Click "Create repository"

### Option B: Via GitHub CLI

```bash
gh repo create railgun-vault-wallet \
  --description "Railgun-Only Vault Wallet for Arbitrum L2" \
  --public \
  --source=. \
  --remote=origin \
  --push
```

## Step 2: Initialize Local Repository

```bash
cd railgun-vault-wallet

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Railgun Vault Wallet

- Complete Flutter project structure
- Dark mode UI with Railgun integration
- Blockchain services for Arbitrum L2
- Transaction history and QR code support
- Comprehensive documentation
- CI/CD pipeline ready"

# Add remote
git remote add origin https://github.com/YOUR_USERNAME/railgun-vault-wallet.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Configure GitHub Settings

### Branch Protection

1. Go to Settings → Branches
2. Add rule for `main` branch
3. Enable:
   - Require pull request reviews
   - Require status checks to pass
   - Require branches to be up to date

### Secrets (for CI/CD)

1. Go to Settings → Secrets and variables → Actions
2. Add secrets if needed:
   - `ALCHEMY_API_KEY` (optional for CI)
   - `INFURA_API_KEY` (optional for CI)

### Actions Permissions

1. Go to Settings → Actions → General
2. Allow all actions and reusable workflows

## Step 4: Enable GitHub Actions

The workflow file is already in place: `.github/workflows/build-apk.yml`

### Verify Workflow

1. Go to Actions tab
2. Should see "Build APK Release" workflow
3. Workflow triggers on:
   - Tag push (e.g., `v1.0.0`)
   - Manual trigger

## Step 5: Create First Release

### Create Release Tag

```bash
# Create annotated tag
git tag -a v1.0.0 -m "Release version 1.0.0

- Initial release
- Full Railgun Vault integration
- Dark mode UI
- Transaction history
- QR code support"

# Push tag to GitHub
git push origin v1.0.0
```

### GitHub Actions Builds APK

1. Go to Actions tab
2. Watch "Build APK Release" workflow
3. Workflow will:
   - Build release APK
   - Create GitHub Release
   - Upload APK as artifact

### Create Release Notes

1. Go to Releases
2. Click "Edit" on the release
3. Add release notes:

```markdown
# Railgun Vault Wallet v1.0.0

## Features
- Railgun Vault integration on Arbitrum One
- Dark mode UI with blue accents
- Send and receive ETH
- Transaction history
- QR code support
- Real-time price updates

## Installation
Download `app-release.apk` and install on Android device.

## Security
- No private key storage
- Address validation
- Secure local storage

## Documentation
- [README](README.md) - Setup guide
- [SECURITY](SECURITY.md) - Security guidelines
- [DEPLOYMENT](DEPLOYMENT.md) - Deployment guide

## Requirements
- Android 5.0+ (API 21)
- Internet connection
- Arbitrum One network access

## Support
- [Issues](../../issues)
- [Discussions](../../discussions)
```

## Step 6: Continuous Development

### Feature Development

```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make changes
# Commit regularly
git commit -m "feat: Add your feature"

# Push branch
git push origin feature/your-feature-name

# Create Pull Request on GitHub
```

### Code Review

1. Go to Pull Requests
2. Review changes
3. Request changes or approve
4. Merge to main

### Release New Version

```bash
# Update version in pubspec.yaml
# Update CHANGELOG.md

# Commit changes
git add pubspec.yaml CHANGELOG.md
git commit -m "chore: Bump version to 1.1.0"

# Create tag
git tag -a v1.1.0 -m "Release version 1.1.0"

# Push
git push origin main
git push origin v1.1.0

# GitHub Actions automatically builds and releases
```

## Step 7: Repository Structure

### Important Files

```
.github/workflows/build-apk.yml    # CI/CD pipeline
.env.example                        # Environment template
.gitignore                          # Git ignore rules
pubspec.yaml                        # Dependencies
README.md                           # Documentation
```

### Sensitive Files (Never Commit)

```
.env                                # API keys
*.keystore                          # Signing keys
*.jks                               # Java keystores
build/                              # Build artifacts
.dart_tool/                         # Dart cache
```

## Step 8: Collaboration

### Add Collaborators

1. Go to Settings → Collaborators
2. Click "Add people"
3. Search for GitHub username
4. Select permission level

### Teams (for organizations)

1. Create team in organization
2. Add members
3. Grant repository access

## Step 9: Documentation

### Update README

Ensure README.md includes:
- ✅ Project description
- ✅ Features list
- ✅ Installation steps
- ✅ Usage guide
- ✅ Contributing guidelines
- ✅ License

### Add Topics

1. Go to Settings → General
2. Add topics:
   - `flutter`
   - `blockchain`
   - `ethereum`
   - `arbitrum`
   - `railgun`
   - `wallet`

## Step 10: Monitoring

### GitHub Insights

1. **Insights → Network** - See commit history
2. **Insights → Traffic** - See clone/visit stats
3. **Insights → Pulse** - See activity summary
4. **Insights → Community** - See community metrics

### Issues Tracking

1. Create issue templates
2. Use labels for organization
3. Assign to team members
4. Track progress

### Discussions

1. Enable Discussions in Settings
2. Create categories:
   - Announcements
   - General
   - Ideas
   - Q&A

## Troubleshooting

### Workflow Not Running

```bash
# Check workflow syntax
git push origin main

# Go to Actions tab
# Check for errors in workflow logs
```

### Build Fails

1. Check workflow logs
2. Verify Flutter installation
3. Check dependencies
4. Review error messages

### Release Not Created

1. Verify tag format: `v1.0.0`
2. Check workflow permissions
3. Review GitHub Actions logs

## Best Practices

### Commit Messages

```
feat: Add new feature
fix: Fix bug
docs: Update documentation
refactor: Refactor code
test: Add tests
chore: Update dependencies
```

### Branch Naming

```
feature/feature-name
fix/bug-name
docs/documentation-name
refactor/refactor-name
```

### Pull Requests

1. Clear title and description
2. Link related issues
3. Request reviews
4. Wait for approval
5. Merge when ready

### Releases

1. Update version
2. Update CHANGELOG
3. Create tag
4. Write release notes
5. Distribute APK

## Security Checklist

- [ ] `.env` in `.gitignore`
- [ ] No API keys in code
- [ ] No private keys in repo
- [ ] Branch protection enabled
- [ ] Require reviews for PRs
- [ ] Secrets configured
- [ ] Actions permissions set

## Resources

- [GitHub Docs](https://docs.github.com)
- [GitHub Actions](https://github.com/features/actions)
- [Git Documentation](https://git-scm.com/doc)
- [Flutter CI/CD](https://flutter.dev/docs/deployment/cd)

## Next Steps

1. ✅ Create GitHub repository
2. ✅ Push code
3. ✅ Configure settings
4. ✅ Create first release
5. ✅ Share with users
6. ✅ Monitor and maintain

---

**Your project is now on GitHub and ready for collaboration!** 🎉
