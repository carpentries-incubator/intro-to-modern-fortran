---
title: Setup
---

## Learning Outcomes

This course provides an introduction to writing Modern Fortran.
It covers everything from basic syntax and variables, to functions, arrays, and modules.
Common Fortran idioms will be introduced and compared to C++.

Within the first hour you will have:

- written a hello world program
- compiled your first program
- done basics maths in a program

At the end of the course you should be able to:

- understand many Fortran programs
- write well-structured Fortran
- write portable Fortran modules

Fortran is a rather "large" language,
so it is not possible to cover all its features in this course.
We focus on features used to write modern HPC code.
Other features you might encounter in legacy code are explained in spoilers:

::: spoiler

### Legacy Fortran

You will see spoilers like this in the lesson.
They contain features more commonly used in legacy code.
These spoilers explain why the feature
is not used often in modern code.

:::

The follow on lesson **Object Orientated Fortran**
(coming soon) contains further advanced topics.

## Data Sets

Download the [tar file](../episodes/data/exercises.tar.gz)
and extract the contents in your Desktop.
This file contains template code and data for some exercises.
It also contains solutions for all exercises.

The following code with create the correct directories
and download and extract the tar file:

```bash
$ mkdir ~/Desktop/intro-to-modern-fortran
$ cd ~/Desktop/intro-to-modern-fortran
$ curl -sSLO https://www.astropython.com/intro-to-modern-fortran/data/exercises.tar.gz
$ tar -xzf ./exercises.tar.gz --strip-components=1
```

::: spoiler

### Alternative Download Method

If the tar file download fails, the exercises and data sets
are in this lessons GitHub repository:

```bash
$ cd ~/Desktop
$ git clone git@github.com:carpentries-incubator/intro-to-modern-fortran.git
```

The [tar file](https://github.com/carpentries-incubator/intro-to-modern-fortran/blob/main/exercises.tar.gz) is in the root directory.
Alternatively the exercises are in the top level `exercises/` directory.

:::

## Compiler Setup

Fortran is a compiled language.
You have to translate your Fortran code to machine code
before running the program.
We do this with a Fortran compiler.
You should test your code with multiple compilers,
as some are better at debugging certain errors than others.

### Installing a Compiler

Your instructor may provide different instructions for installing
a suitable compiler or have installed one for you.
If you need to install a compiler yourself follow the instructions below.
We recommend installing **GFortran** as your first compiler.

::: group-tab

### GFortran

GFortran is a free open-source compiler.
It is part of the Gnu Compiler Collection (GCC).
Comprehensive installation instructions are on the
[GFortran install page on fortran-lang][install-gfortran].

Check whether GFortran is already installed:

```bash 
$ gfortran --version
```

If GFortran is installed, this should print GFortran's version number and license.
If you get the `Command not found` message, install GFortran via your system's package manager.
For example on Debian or Ubuntu (note that this requires root access):

```bash
$ sudo apt install gfortran
```

See [the website][install-gfortran] for instructions for other operating systems. 

Without root access, 
you can install GFortran locally with [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html):

```bash
$ conda install conda-forge::gfortran
```

### Intel

The Intel Fortran compiler is free through their oneAPI toolkit.
You can download only the compiler or
the oneAPI Fortran Essentials toolkit.

- [Compiler Only Install Instructions - Linux and Windows](https://www.intel.com/content/www/us/en/developer/tools/oneapi/fortran-compiler-download.html)
- [Linux oneAPI Fortran Essentials Install Instructions](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2025-0/intel-fortran-essentials.html#GUID-E8EA92E5-84BC-4550-9988-4A9147A1B769)
- [Windows oneAPI Fortran Essentials Install Instructions](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-windows/2025-0/intel-fortran-essentials.html)

Note: The Intel compiler is not available for macOS.

### Flang

LLVM Flang is another open source compiler
based on the LLVM compiler toolkit.
Flang is installed from the LLVM source code.
If you have not built programs from source before
we recommended choosing another compiler
or installing Flang via conda.
[Link to the Flang Getting Started page](https://flang.llvm.org/docs/GettingStarted.html)

### Cray

The [HPE Cray Fortran compiler](https://cpe.ext.hpe.com/docs/latest/cce/index.html)
is proprietary but highly optimised.
Your organisation may have a license for the Cray compiler.

:::

### Testing your compiler

Now you have a compiler installed you can compile a simple program.
The [exercise and data file](./setup.md#data-sets)
you downloaded contains `setup/hello_world.f90`.
This is a simple Fortran program:

```fortran
program hello_world

    implicit none

    print *, 'Hello world!'

end program hello_world

```

Enter the setup directory:

```bash
$ cd setup
$ ls
```

```output
hello_world.f90
```

To compile the program run:

::: group-tab

### GFortran

```bash
$ gfortran hello_world.f90
```

### Intel

```bash
$ ifx hello_world.f90
```

### Flang

```bash
$ flang hello_world.f90
```

### Cray

```bash
$ ftn hello_world.f90
```

:::

You should see a new file in the directory:

```bash
$ ls
```

```output
a.out hello_world.f90
```

The `a.out` file is your compiled program.
To run the program:

```bash
$ ./a.out
```

```output
Hello world!
```

You have compiled your first Fortran program!
The first episode in this lesson will
cover compiling in more detail.

## Text Editors and Integrated Development Environments (IDEs)

Fortran files are plain text and can be edited with any plain text editor.
We recommend you use an editor that is capable of ***syntax highlighting***.
Setup instructions for some editors are available below.

Editor Setup Quick Links:

- [Emacs](#emacs)
- [VS Code](#vs-code)

### Emacs

[Emacs][emacs-link] is a cross-platform text editor available for Linux, macOS, and Windows.
Emacs applies syntax highlighting for most Fortran files.
Emacs ***f90-mode*** mode lets you tab complete Fortran statements.
It also adds a drop-down menu providing additional Fortran-related options.

Fortran files with different extensions, such as `.X90`, will not be picked up in this mode.
Files can be manually set to ***f90-mode*** using `M-x f90-mode`.
File extensions can be added to your [Emacs initialization file][emacs-init-link]
so they are recognised as Fortran when opened.
To add this to your initialisation file:

```lisp
(setq auto-mode-alist
      (append '(("\\.mf90" . f90-mode)
                ("\\.X90" . f90-mode)
        ) auto-mode-alist))
```

::::::::::::::::: tab

### Windows and macOS

From your home directory, initialization settings are placed in your `.emacs.d/init.el` file.

### Linux

Initialization settings are placed in your `~/.config/emacs/init.el` file.
This location follows the Linux desktop environment guidelines.

### Legacy (cross platform)

The `.emacs` or `.emacs.el` file is an older method of configuring Emacs.
This file is stored in your home directory.

:::::::::::::::::::::::::

### VS Code

[Visual Studio Code (VS Code)][vscode-link] is another powerful cross-platform IDE.
To use VS Code with Fortran we recommend two additions:

- The [Modern Fortran extension][vscode-modern-fortran] provides syntax highlighting,
  IntelliSense for Fortran statements, and debugging capabilities.
  It also adds customization options to improve the coding experience for Fortran developers.
- The Modern Fortran extension depends on `fortls`: a language server that interfaces VS Code.

`fortls` must be installed before the Modern Fortran extension.

::::::::::::::::: tab

### PyPI

```bash
$ pip install fortls
```

### Anaconda

```bash
$ conda install -c conda-forge fortls
```

### Brew

```bash
$ brew install fortls
```

### Source

The development version of `fortls` can be installed from GitHub:

```bash
$ pip install --user --upgrade git+git://github.com/fortran-lang/fortls
```

:::::::::::::::::::::::::

Once `fortls` is installed, install the [Modern Fortran extension][vscode-modern-fortran].

#### Adding a ruler

We recommend adding a ruler.
This is a vertical line in the editor after a set number of characters.
Rulers help avoid long lines that are hard to read.

To add a ruler at 80 characters:

1. Open the Command Palette (Press `Cmd+Shift+P`, or `Ctrl+Shift+P`)
2. Type 'settings'. Then select the option which says "Preferences: Open User Settings (JSON)"
3. This will open the `settings.json` file in your editor.
4. Add the `editor.rulers` property to the JSON file, e.g.

```json
{
    other.settings: "already here",
    editor.rulers: [80]
}
```

Save the file.
You should see a vertical line appear in your editor.

## Getting Help

There are many ways you can get help when stuck:

- Search the internet: paste the last line of your error message and a short description of what you want to do into your favourite search engine.
  You will usually find several examples where other people have encountered the same problem and came looking for help.
  - [StackOverflow](https://stackoverflow.com/questions) has answers to questions which are presented with the most useful at the top.
    You can search questions using the `[fortran]` tag in the search bar.
  - Fortran-lang has a [discourse group](https://fortran-lang.discourse.group/) where you can ask questions.
  - **Take care** copying and pasting code written by somebody else. This is risky unless you understand exactly what it is doing!
- Ask somebody “in the real world”.
  If you have a colleague or friend with more expertise than you have, show them the problem you are having and ask them for help.
- Sometimes, the act of articulating your question can help you to identify what is going wrong.
  This is known as [“rubber duck debugging”](https://en.wikipedia.org/wiki/Rubber_duck_debugging) among programmers.

### Formulating your question

The StackOverflow page on [how to ask a good question](https://stackoverflow.com/help/how-to-ask) has tips on what information to include when posting a question on StackOverflow. Some of these are specific to StackOverflow but others are also relevant if you're asking a colleague or friend for help, or even if just articulating your question to yourself.

Ensure you include your compiler version in your question and full compiler output.

### Generative AI

::::::::::::::::::::::::::::: instructor

### Choose how to include this section

The section on generative AI is intended to be concise but Instructors may choose to devote more time to the topic in a workshop.

Depending on your own level of experience and comfort with talking about and using these tools, you could choose to do any of the following:

- Explain how large language models work and are trained, and/or the difference between generative AI, other forms of AI that currently exist, and the limits of what LLMs can do (e.g., they can't "reason").

- Demonstrate how you recommend that learners use generative AI.

- Discuss the ethical concerns listed below, as well as others that you are aware of, to help learners make an informed choice about whether or not to use generative AI tools.

This is a fast-moving technology.
If you are preparing to teach this section and you feel it has become outdated, please open an issue on the lesson repository to let the Maintainers know and/or a pull request to suggest updates and improvements.

All instructors teaching this lesson ***should*** emphasise that AI
is trained mainly on legacy Fortran and in many cases does not output useful answers.

::::::::::::::::::::::::::::::::::::::::

It is increasingly common for people to use ***generative AI*** chatbots such as ChatGPT to get help while coding.
You will probably receive some useful guidance by presenting your error message to the chatbot and asking it what went wrong.
However, the way this help is provided by the chatbot is different.
Answers on StackOverflow have (probably) been given by a human as a direct response to the question asked.
But generative AI chatbots, which are based on an advanced statistical model, respond by generating the ***most likely*** sequence of text that would follow the prompt they are given.

While responses from generative AI tools can often be helpful, they are not always reliable.
These tools sometimes generate plausible but incorrect or misleading information, so (just as with an answer found on the internet) it is essential to verify their accuracy.
You need the knowledge and skills to be able to understand these responses, to judge whether or not they are accurate, and to fix any errors in the code it offers you.

In addition to asking for help, programmers can use generative AI tools to generate code from scratch; extend, improve and reorganise existing code; translate code between programming languages; figure out what terms to use in a search of the internet; and more.
However, there are drawbacks that you should be aware of.

The models used by these tools have been “trained” on very large volumes of data, much of it taken from the internet, and the responses they produce reflect that training data, and may recapitulate its inaccuracies or biases.
The environmental costs (energy and water use) of LLMs are a lot higher than other technologies, both during development (known as training) and when an individual user uses one (also called inference).
For more information see the [AI Environmental Impact Primer](https://huggingface.co/blog/sasha/ai-environment-primer) developed by researchers at HuggingFace, an AI hosting platform.
Concerns also exist about the way the data for this training was obtained, with questions raised about whether the people developing the LLMs had permission to use it.
Other ethical concerns have also been raised, such as reports that workers were exploited during the training process.

**We recommend that you avoid getting help from generative AI during the workshop** for several reasons:

1. For most problems you will encounter at this stage, help and answers can be found among the first results returned by searching the internet.
2. The foundational knowledge and skills you will learn in this lesson by writing and fixing your own programs are essential to be able to evaluate the correctness and safety of any code you receive from online help or a generative AI chatbot.
  If you choose to use these tools in the future, the expertise you gain from learning and practising these fundamentals on your own will help you use them more effectively.
3. As you start out with programming, the mistakes you make will be the kinds that have also been made – and overcome! – by everybody else who learned to program before you.
   Since these mistakes and the questions you are likely to have at this stage are common, they are also better represented than other, more specialised problems and tasks in the data that was used to train generative AI tools.
  This means that a generative AI chatbot is ***more likely to produce accurate responses*** to questions that novices ask, which could give you a false impression of how reliable they will be when you are ready to do things that are more advanced.
4. The amount of modern Fortran code these tools are trained on is tiny compared to languages such as Python.
   This means the tools will not be able to accurately generate modern Fortran.
