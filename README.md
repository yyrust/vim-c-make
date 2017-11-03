# Vim-C-Make

If you are working on cmake-based projects and tired of switching between source and build directories, this plugin is for you.

# Features

1. Use `:make` to compile your cmake project from within vim in your source directory.
2. A shell script `c` that helps you compile, test, run and debug executables from your source directory.

# Installing

1. I recommend using [Vundle][vundle] to install this plugin:

```viml
Bundle 'yyrust/vim-c-make'
```

2. Add the following lines to your `.vimrc`:

```viml
if filereadable("./CMakeLists.txt")
    compiler c_make
endif
```

3. Add `~/.vim/bundle/vim-c-make/bin` to your `PATH` environment variable.

# Usage

## The compiler plugin

1. `cd` to any of your source directories.
2. Open any source file with vim.
3. Use `:make` to compile. If there are no existing build directories, the plugin will try to create one in the project's root directory and configure it.

## The `c` command

1. Compiling project:
```bash
c make   # use CMake "Unix Makefiles" backend
c ninja  # use CMake "Ninja" backend
```

If there are no existing build directories, the script will try to create one in the project's root directory and configure it.

To use custom compilers to configure it, set `CXX` and `CC`. For example:
```bash
CXX=g++72 CC=gcc72 c make
```

2. Running tests:
```bash
c test [arbitrary-ctest-args]
```

The script merely invokes `ctest` in corresponding build directry and forward the arguments to `ctest`.

3. Running/debugging executables:
```bash
c run [pattern] [args]
# what it does: cd <build_dir>; ./<matched_executable> <args>

c debug [pattern] [args]
# what it does: cd <build_dir>; gdb --args ./<matched_executable> <args>
```

If there is only one executable target in the current directory, and the executable runs without arguments, using `c run` is enough.

If the executable needs arguments, use `c run <pattern> <args>`, where the `pattern` is either the target name or a substring of it.

If there are multiple executable targets in the current directory, use a pattern which can distinguish your expected executable from others.
