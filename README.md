# Objective-C performSelector Crash with Delayed Invocation

This repository demonstrates a common yet subtle bug in Objective-C related to the use of `performSelector:withObject:afterDelay:` and object deallocation.  The bug occurs when an object scheduled for a delayed message is deallocated before the delay expires, leading to a crash when the selector is invoked on a deallocated object.

The `bug.m` file shows the problematic code, and `bugSolution.m` presents a corrected approach using blocks and weak references, preventing the crash.

## Bug Description
The core issue lies in the timing mismatch between object lifetime and the delayed invocation of a selector. If the object is deallocated (e.g., due to leaving the scope or memory management issues), calling a method on this deallocated object leads to a crash.

## Solution
The solution involves avoiding `performSelector:withObject:afterDelay:` in favor of Grand Central Dispatch (GCD) timers or blocks with weak references to prevent crashes.