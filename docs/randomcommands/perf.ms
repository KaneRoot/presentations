.SECTION Perf
The
.COMMANDNAME perf
program can be used to get informations about a running program.
.SECTION_NO_NUMBER Common usage
I run a command 10 times and get its average performances.
.COMMAND1
perf stat -r 10 ./a.out
.COMMAND2
