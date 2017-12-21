#!/usr/bin/perl -w

# plans sensing operations, replans based on sensing operations

# eventually, control emacs

# emacs function that executes, calls planner, generates emacs
# commands, interactive evals and returns error conditions, replans if
# error condition, models everything in PDDL.

# first write the planner for movements

(goal (sense-directory dir1))
(goal (replan))

(sense-directory dir1)
(next (replan))

# handle timeouts

(pos 1)
(pos 2)
(pos 3)

(has-length string3 ?len)

(concat string1 string2 string3)
  (forall ?pos
   (and
    (pos ?pos)
    (has-char string1 ?pos ?char))))

  (assign (has-length string3 ?len) (+ (has-length string1) (has-length string2)))

