\ ******************************************************************************
\
\ ELITE UNIVERSE EDITOR (PART 1)
\
\ The Universe Editor is an extended version of BBC Micro Elite by Mark Moxon
\
\ The original Commodore 64 Elite was written by Ian Bell and David Braben and
\ is copyright Firebird 1985
\
\ The extra code in the Universe Editor is copyright Mark Moxon
\
\ ******************************************************************************

_6502SP_VERSION = FALSE
_MASTER_VERSION = FALSE
_C64_VERSION    = TRUE

\ ******************************************************************************
\
\ Configuration variables
\
\ The addresses in the following are from when the game binary is loaded into
\ memory. They were calculated by analysing a memory dump of the running game,
\ searching for patterns in the bytes to match them with the corrsponding code
\ from the BBC Micro version (which is very similar, if you ignore any different
\ addresses).
\
\ ******************************************************************************

ECMA = $0067

BEEP = $2FEE
BR1 = $8882
TITLE = $8920

\ ******************************************************************************
\
\ Save EDITOR.unprot.bin
\
\ ******************************************************************************

CODE% = &B72D
LOAD% = &B72D

ORG CODE%

\ ******************************************************************************
\
\       Name: BR1 (Part 1 of 2)
\       Type: Subroutine
\   Category: Start and end
\    Summary: Show the "Load New Commander (Y/N)?" screen and start the game
\
\ ******************************************************************************

.PATCH1

                        \ We replace the JSR TITLE in BR1 with JSR PATCH1, so we
                        \ start with this instruction to ensure that it still
                        \ gets done

 JSR TITLE              \ Call TITLE to show the rotating Cobra Mk III and "Load
                        \ New Commander?" prompt

 CMP #f1                \ Did we press f1? If not, skip the following
 BNE P%+5               \ instruction

 JMP UniverseEditor     \ We pressed f1, so jump to UniverseEditor to start the
                        \ universe editor

 RTS                    \ Return from the subroutine

.UniverseEditor

 JSR BEEP               \ Skeleton UE code for testing, remove when we uncomment
 JMP BR1                \ the following

 INCLUDE "../src/elite-universe-editor-variables.asm"
\INCLUDE "../src/elite-universe-editor-3.asm"
\INCLUDE "../src/elite-universe-editor-1.asm"
\INCLUDE "../src/elite-universe-editor-2.asm"
\INCLUDE "../src/elite-universe-editor-4.asm"
\INCLUDE "../src/elite-universe-editor-z.asm"

SAVE "editor.bin", CODE%, P%, LOAD%
