# Linux `Command Line` - Full Guide

## Table of Contents
# Table of Contents

1. [Introduction](#introduction)
2. [Basic Commands](#basic-commands)
3. [Working with Files](#working-with-files)
4. [Navigating Directories](#navigating-directories)
5. [Wildcard (*)](#wildcard-)
6. [File Permissions](#file-permissions)
   - [`chmod`](#chmod)
   - [Binaries and Octal](#binaries-and-octal)
   - [Combination of Octals and Rules](#combination-of-octals-and-rules)
   - [Easier Alternatives](#easier-alternative-good-to-know)
7. [User & Group Access](#user--group-access)
   - [Adding a New User](#adding-a-new-user)
   - [Groups](#groups)
   - [File/Directory Ownership](#filedirectory-ownership)
8. [Other Useful Commands](#other-useful-commands)
9. [Essential Terms](#lets-understand-some-essential-terms)
10. [The Linux File System](#the-linux-file-system)
11. [Brief Overview of Environment Variables](#next-step-environment-variables)
12. [Questions to Test Your Knowledge](#questions-to-test-your-knowledge)
13. [Vim Text Editor](#vim-text-editor-important-to-know)


## Introduction

Welcome to the world of Linux! This guide introduces essential commands and concepts you’ll need to start navigating the terminal and managing files. We’ll keep things simple and straightforward.

Before diving in, let’s define a few key terms:

- **Command**: The instruction you give to the terminal (e.g., `ls`, `cd`, `mkdir`).
- **File**: You all know what a file is!
- **Directory**: a folder containing different files or other folders like itself
- **Option**: A modifier used with a command to alter its behaviour. Options are usually preceded by a dash (`-`), like `-l` or `-r`.
- **Argument**: The item or target of the command. For example, in `ls folder_name`, `folder_name` is the argument.
- **Flag**: A specific type of option, typically a single letter, like `-r`, that alters how a command behaves.

---

## Basic Commands

These commands are your foundation for interacting with files and directories in Linux. You’ll use them regularly to get around.

| Command   | Description                                                       |
|-----------|-------------------------------------------------------------------|
| **ls**    | List all files and directories in the current directory.          |
| **mkdir** | Create a new directory (folder).                                  |
| **pwd**   | Display the current working directory.                            |
| **cd**    | Change the directory you're in.                                   |
| **touch** | Create a new, empty file.                                         |
| **cat**   | Display the contents of a file.                                   |
| **mv**    | Move or rename a file.                                            |
| **rm**    | Remove a file.                                                    |
| **echo**  | Add content to a file (e.g., `echo "hello world" > file.txt`).    |

---

## Working with Files

- **Create a new file**:  
  `touch filename.txt`  
  This creates an empty file called `filename.txt`.

- **View file contents**:  
  `cat filename.txt`  
  Displays the content of `filename.txt`.

- **Add content to a file**:  
  `echo "Hello, World!" > filename.txt`  
  This will overwrite the content of the file. Use `>>` to append instead.

- **Move or Rename a file**:  
  `mv file.txt /path/to/destination/`  
  This moves `file.txt` to the specified directory. If you want to rename, use `mv old_name.txt new_name.txt`.

- **Delete a file**:  
  `rm filename.txt`  
  Deletes the specified file permanently. Be careful!

---

## Navigating Directories

- **Check your current location**:  
  `pwd`  
  (Print Working Directory)

- **List files in a directory**:  
  `ls`  
  You can use flags like `ls -l` for detailed info or `ls -a` to show hidden files.

- **Move to another directory**:  
  `cd /path/to/directory`  
  Use `cd ..` to move up one level.

- **Create a new directory**:  
  `mkdir new_directory`  
  This creates a folder named `new_directory`.

- **Recursive directory listing**:  
  `ls -r`  
  This lists the contents of directories within directories (subdirectories) recursively.

## Wildcard (*)

- **You can use the asteriks (*) to specify the rest of a directory or file name or contents within a path of a directory**

#### For example:

We want to look at the contents of file: `78989e79f84h857hello.txt`
But we've got many files ending with hello.txt!

All you have to do is to specify the ending of the file **after** the asteriks since its at the ending, like this: `*7hello.txt` 
So with this in mind, if we wanted to look at its contents we would run:

```
cat *7hello.txt
```

Or in the case of specifying all or specific files within a directory we can type: 

e.g. `MY/PATH/*` or `MY/PATH/*.txt` or `MY/PATH/file*`





---

## File Permissions

## `chmod`

#### Essentially, this changes file permissions via the following letters:

| Letters          |Effect                                                              |
| ----------------- | ------------------------------------------------------------------ |
|**x** | if you allow permissions for users to **only** execute the file(s)|
|**r** | if you allow users to **only** read the files |
|**w** | if you allow users to **only** write within the file|
|**X**| permission for **some** users to execute|
|**s**| to set a user-group ID on execution|

#### This is a list of who these rules apply to:

| Mode         |Effect                                                              |
| ----------------- | ------------------------------------------------------------------ |
|**U** | Permission for file owner|
|**G**| Permission for users - members of the file group
|**O**| Anyone who doesnt belong to the above categories

#### Now Lets Combine these options:

```
chmod u=rwx  #File owner has read, write and execute permissions 
```
```
`chmod ug=rx o=r #File owner and other users in the file group have read and write permissions, but others can only read the file`
```
```
`chmod 400 #...Lets see what this means ⬇️`
```
### Binaries and Octal

#### Lets go back to Secondary School Computer science shall we...

This is the simplified way to understand binaries and octals:

|    Permissions         | Binary                | Octal      | Sum of Octal
|------------|-----------------------|------------------------|-------------
|**rwx**     | 1 1 1 | 4 2 1 | 7 (4+2+1)
|**r-x**     | 1 0 1 | 4 0 1 | 5
|**-wx**|0 1 1| 0 2 1| 3
|**---**|0 0 0| 0 0 0| 0 |

I hope you noticed a pattern here. No? here's whats going on:

So by now, we already know the meaning of r, w & x. In this case, binary numbers can either be 1 or 0 and it's arrangement is based on whether the letter (r,m or x) is used or not. 

1 = letter is visible 0 = letter is missing. 

The octal, in this case, is more specific by showing the assigned number from 1-9 based on **which** letter is being used:

r=4 w=2 x=1 -=0

The 'sum' section is simply the sum of the octal numbers used. 

### Combination of Octals and Rules 

As shown before U, G and O are used to determine who the rules determined in the permissions applies to. The permissions (rwx) are filled out in **three** sections (*e.g. rmx r-x -mx*) with the first section being U (user), second being G (group) and the third being O (others).

As shown in the last section, each of the letters (rmx) are assigned a number within an *Octal*. With this in mind, if we had 3 sections of `rmx rmx rmx` that would be translated to `421 421 421`. Now if we use the final step, *Octal Sum*, we would get `7 7 7`. 

*Now here's the 'aaaah' moment*

If we wanted to assign `file.txt` full permissions for a user, group **and** others (as shown in `rmx rmx rmx`) then we would run the command:
```
chmod 777 file.txt
```

You can now try to play around with these yourself and see the variation of combinations you can run to change file permissions!

### Easier Alternative (Good to know)

```
chmod u+x g+r o-w 
```
The plus here means to **add** file permissions to whoever the permission applies to
and the **minus** symbol means to remove a specific file permission to whoever it applies to.

### An Even Simpler way 

```
chmod ug=rw o=x
```
- Simply meaning that Users and Groups have the permission to read and write files whilst Others can only execute - this is only an example.

## User & Group Access

### Adding a new user

1. `sudo useradd firstuser`
2. `sudo passwd firstuser` - setup new password
3. `su firstuser` - 'su' stands for 'switch user' 
*Now you've successfully switched users*

To check that this has worked, run: `whomai`

But we have a problem - we no longer have access to the `sudo` command.

Here's what to run to make a normal user a **superuser**:

1. `exit` - to come back to admin
2. `sudo usermod -aG sudo firstuser`
3. `su -firstuser`
*To test it out, run: `sudo apt update`*

## Groups

#### everything we've done so far is was in the `root` group - there are many more!

#### To view a list of all the premade groups, run: `cat etc/group`

### Here's the cheatsheet ;)

1. We can add users to any of these groups using this command: `sudo usermod -aG <group> <user>` 
2. We can delete users from a group: `sudo gpasswd -d <user> <group>`
3. We can create a group: `sudo groupadd <group>`
4. We can remove a group: `sudo groupdel <group>`
5. We can add users to **more than one** group: `sudo usermod -aG <group1>,<group2> <user>`

## File/Directory ownership

#### We can change owner of a file or directory by simply running `sudo chown <user> <file>`
#### We can also change the group of a file or directory: `sudo chgrp <group> <file>`
#### These 2 commands can be combined by running: `sudo chown <user>:<group> <file>`
*Note: if you want to apply this to a directory use the `-R` flag after `chgrp` or `chown`*


**Why is this important? Because this will be the user and group that is refered to in the UGO permissions sequence (as talked about previously). So in this case, 'Others' refers to anybody else that isn't the user or isn't at least within the group.**




## Other Useful Commands

- **Clear terminal screen**:  
  `clear`  
  Clears the terminal window.

- **Search for a command or file**:  
  `grep "pattern" filename`  
  Search for a pattern inside a file.

- **Find files**:  
  `find /path/to/search -name "filename"`  
  Find a file by name within a directory.

- **Check disk usage**:  
  `df -h`  
  Display available disk space in a human-readable format.

- **Check system processes**:  
  `ps aux`  
  View the currently running processes on your system.

---

## Lets understand some essential terms: 

#### Shell - The layer between you and the core of the operating system (e.g. Windows, Linux, Mac)
#### Programs - written by developers to complete specified tasks e.g. ls, cat or echo
####  Binaries - The compiled version of these *programs* that the *shell* uses to know what to execute ~ these can be found in the `/bin` directory under root ( `/` )

## The Linux File system

#### `/dev` - holds device files e.g. disk player
#### `/etc` - if im thinking configuration, I go to `etc`. 
*It contains configuration files for your running shell, shell scripts, vim configuration and package manager configuration files like apt or yum* 
#### `/lib` - where the Network Manager could be found or most things that are network-related
#### `/usr` - where `/bin`, `/lib `and `/src` can be found (`/src` is where the raw code of installed applications are stored)

## Next Step: Environment Variables

Once you're comfortable with basic commands, it's time to move to environment variables. These are used to store settings that influence the behaviour of processes or the shell itself.

We’ll cover environment variables in more detail later, but here’s a brief preview:

- **View environment variables**:  
  `printenv`  
  or  
  `echo $VARIABLE_NAME`

- **Set an environment variable**:  
  `export MY_VAR="value"`

---

## Questions to Test Your Knowledge

1. What command shows your current directory?
2. How would you create a new directory called `projects`?
3. If you wanted to remove a file named `notes.txt`, what command would you use?
4. What does the `ls -a` command do?
5. How would you change into a directory named `work`?
6. How do you view the content of a file called `file.txt`?
7. What command lets you add text to a file?
8. How do you move a file from one directory to another?
9. What does `chmod 755 file.txt` do?
10. What does the `-r` flag do when used with `ls`?

---



## Vim Text Editor: Important to know

#### This can be run by using `vi` command ---> e.g. `vi file.txt`

Running this will let you see inside of the file. 

#### Navigation:

- **Insert Mode**: Press `i`
- **Visual Mode**: Press `v`
- **Quit without saving**: `:q!`
- **Save and Quit**: `:wq`

#### On INSERT - You can run these following commands:

|Action|Effect|
|---------------|---------------|
| 'w' | to move forward **each word**|
| 'B' | to move backwards **each word**
| '0' | to move to the **beginning** of a line
| '*' or '$' | to move to the **end** of a line

#### On Command mode (when you press 'esc') - You can run these following commands:

|Action|Effect
|-|-|
|`dd`| to **delete** a whole line
| `D`| to delete **up to** your cursor
| `yy`| to copy
| `p` | to paste
| `:`→`*line number*`| to move to a specific line 
| `:`→`/`→`*word you're looking for*`| to search for a word within the file

#### *We will revisit Vim in *Bash Scripting* AKA the less boring part of Linux so stay tuned!


## Conclusion

This is just the beginning! The more you practice, the more comfortable you’ll become with Linux commands. Use these basics to start navigating and managing your system, and continue learning to discover more advanced features as you go.

Happy learning!
