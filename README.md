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

* useless files

  There are too many useless files exist in working dir, include `.DS_Store`, `Thumbs.db`, `Desktop.ini`, `desktop.ini`.
  They are generated occasionally by Operating System. These files are usually ignored in `.gitignore` file.
  Then Git treat containing directory didn't exist but Unity don't think so. Unity would generate corresponding `.meta` for directory.
  We need delete these useless ignored files.

## Test
You could run `hooks/testcase.sh` to build test directory structure.
And then you could run `hooks/post-checkout.sh` or `hooks/post-merge` to remove empty directories.

## Reference
* [3pjgames/unity-git-hooks: Git hooks for Unity3D project](https://github.com/3pjgames/unity-git-hooks)
