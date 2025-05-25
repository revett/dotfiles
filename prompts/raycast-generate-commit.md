# Input

{clipboard}

# Instructions

Generate a Git commit message using the input above. The input is made up of the branch name, all
commits on this feature branch (compared to main), and the git diff of staged changes. Follow the
formatting rules outlined below.

Review the existing commits on this feature branch and ensure the new commit adds distinct value and
doesn't repeat similar work.

Return only the commit message.

## Format

<subject>

- <bullet_1> (if required)
- <bullet_2> (if required)
- <bullet_3> (if required)
- <bullet_4> (if required)

### Subject

- Required
- Imperative mood
- MUST be under 60 characters
- No period at end
- Example: "Add user authentication to login form"

### Body

- Optional
- One blank line after summary
- 0-4 bullet points ONLY if changes need explanation beyond the summary
- Use "- " prefix, wrap at 72 characters
- Focus on what changed and why it matters

### Critical Rules

1. The summary line must be under 60 characters, count the characters carefully.
1. Only include bullet points when necessary to explain complex changes. The 4 bullet limit is a
   cap, not a target, so avoid adding bullets just to fill space.

## Examples

### Large Change

Refactor user authentication system

- Replace JWT tokens with session-based auth for better security
- Add password reset functionality with email verification
- Update login form to handle new authentication flow
- Add comprehensive error handling for auth failures

### Medium Change

Fix memory leak in image processing

- Release bitmap resources after thumbnail generation
- Add proper disposal of graphics objects in resize method

### Small Change

Fix typo in error message
