# Looker Spoke Default
Mozilla Looker Models. Creates explores from views defined in the hub [0].

Most of the code here is edited inside Looker and pushed, via the UI, to the associated branch. The dev workflow is:
1. Edit LookML in Looker. Ensure explores, definitions, and views are correct for how end users should see them. Pull in definitions from looker-hub when possible.
2. Commit the code in Looker (Add a relevant commit message!) and open a PR.
3. Request review from another developer. They should not only look over your LookML code, but should also inspect the explores and generated queries for correctness and readability.
4. Once changes are approved, merge to `main`. CI will push the changes to production.

[0] https://github.com/mozilla/looker-hub
