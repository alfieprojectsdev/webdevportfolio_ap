#!/bin/bash
# Script to review Claude's changes and merge to main branch
# Usage: bash review-and-merge.sh

set -e  # Exit on error

CLAUDE_BRANCH="claude/onboard-repo-agents-011CUrDREZ2xwgcSF65fvMou"
MAIN_BRANCH="main"

echo "=========================================="
echo "Portfolio Enhancement Recommendations"
echo "Review and Merge Script"
echo "=========================================="
echo ""

# Step 1: Fetch latest from remote
echo "📥 Fetching latest changes from remote..."
git fetch origin "$CLAUDE_BRANCH"
echo "✅ Fetch complete"
echo ""

# Step 2: Show current branch
echo "📍 Current branch: $(git branch --show-current)"
echo ""

# Step 3: Checkout Claude's branch
echo "🔄 Checking out Claude's branch..."
git checkout "$CLAUDE_BRANCH"
echo "✅ Now on branch: $CLAUDE_BRANCH"
echo ""

# Step 4: Pull latest changes
echo "📥 Pulling latest changes..."
git pull origin "$CLAUDE_BRANCH"
echo "✅ Branch is up to date"
echo ""

# Step 5: Show what changed
echo "=========================================="
echo "📄 FILES CHANGED:"
echo "=========================================="
git diff "$MAIN_BRANCH"..."$CLAUDE_BRANCH" --name-status
echo ""

# Step 6: Show commit details
echo "=========================================="
echo "📝 COMMITS ON THIS BRANCH:"
echo "=========================================="
git log "$MAIN_BRANCH".."$CLAUDE_BRANCH" --oneline --decorate
echo ""

# Step 7: Show the RECOMMENDATIONS.md file
echo "=========================================="
echo "📖 PREVIEW: RECOMMENDATIONS.md"
echo "=========================================="
if [ -f "RECOMMENDATIONS.md" ]; then
    echo "File exists! Here are the first 50 lines:"
    echo ""
    head -n 50 RECOMMENDATIONS.md
    echo ""
    echo "... (file continues)"
    echo ""
    echo "📊 File stats:"
    wc -l RECOMMENDATIONS.md
    echo ""
else
    echo "⚠️  RECOMMENDATIONS.md not found in current directory"
fi

# Step 8: Instructions for review
echo "=========================================="
echo "👀 REVIEW INSTRUCTIONS"
echo "=========================================="
echo ""
echo "You are now on the Claude branch. To review the changes:"
echo ""
echo "  1. Read the full document:"
echo "     cat RECOMMENDATIONS.md"
echo "     # OR open in your editor:"
echo "     code RECOMMENDATIONS.md"
echo "     nano RECOMMENDATIONS.md"
echo ""
echo "  2. Review the diff vs main branch:"
echo "     git diff main...HEAD"
echo ""
echo "  3. If you approve the changes, merge to main:"
echo "     git checkout main"
echo "     git merge $CLAUDE_BRANCH --no-ff -m \"Merge: Add comprehensive portfolio enhancement recommendations\""
echo "     git push origin main"
echo ""
echo "  4. (Optional) Delete the Claude branch after merging:"
echo "     git branch -d $CLAUDE_BRANCH"
echo "     git push origin --delete $CLAUDE_BRANCH"
echo ""
echo "  5. If you DON'T approve, go back to main:"
echo "     git checkout main"
echo ""
echo "=========================================="
echo "✅ READY FOR REVIEW"
echo "=========================================="
