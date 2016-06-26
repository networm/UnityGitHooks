# Unity Git hooks
Git won't tracked directory changes so you need remove them yourself after checkout.
Unity would generate `.meta` file for every file and directory.
So these hooks use to remove empty directory and its `.meta` file for consistency.

## Usage
Just copy `install-hooks.sh` and `hooks` directory to your git repository, then run `install-hooks.sh`.

## Notes
* file mode

  `hooks/post-checkout` and `hooks/post-merge` don't set executable attribute but set when run `install-hooks.sh`.
  It's because of `Git for Windows`. `Git for Windows` doesn't set `core.filemode` to `true`.
  So every file is always `644`.

* depth first

  When find empty directories, we need find to perform depth-first traversal.
  And we need delete every empty directory when encountered.
  So that we could remove nested empty directories.

## Reference
* [3pjgames/unity-git-hooks: Git hooks for Unity3D project](https://github.com/3pjgames/unity-git-hooks)
