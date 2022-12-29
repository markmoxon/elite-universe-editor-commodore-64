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

NI%         = 37
NOSH        = 10
NTY         = 33
MSL         = 1
SST         = 2

VE          = $57

YELLOW2     = %10101010
GREEN2      = %11111111

T1          = $0006
SC          = $0007
SCH         = $0008
INWK        = $0009
NEWB        = $002D
P           = $002E
XC          = $0031
YC          = $0033
QQ17        = $0034
K3          = $0035
XX0         = $0057
INF         = $0059
V           = $005B
BETA        = $0063
BET1        = $0064
ECMA        = $0067
ALP1        = $0068
ALP2        = $0069
K           = $0077
KL          = $007D
QQ15        = $007F
DELTA       = $0096
A           = $009A
U           = $0099
Q           = $009A
R           = $009B
S           = $009C
QQ11        = $00A0
MCNT        = $00A3
TYPE        = $00A5
QQ12        = $00A7
RAT2        = $00B1
T           = $00BB

FRIN        = $0452
MANY        = $045D
JUNK        = $047F
auto        = $0480     \ LDX #(de-auto) in PlayUniverse
CABTMP      = $0483
VIEW        = $0486
GNTMP       = $0488
DLY         = $048B
de          = $048C     \ LDX #(de-auto) in PlayUniverse
JSTX        = $048D
JSTY        = $048E
NAME        = $0491
QQ0         = $049A
QQ1         = $049B
QQ21        = $049C
ESCP        = $04C7
NOMSL       = $04CC
FSH         = $04E7
ASH         = $04E8
ENERGY      = $04E9
QQ28        = $04EE
gov         = $04F0
tek         = $04F1
SLSP        = $04F2
QQ2         = $04F4
QQ14        = $04A6
CHK2        = $04E3
CHK         = $04E4
QQ25        = $04ED
QQ3         = $0500
QQ4         = $0501
QQ5         = $0502
ALTIT       = $06F3

DETOK       = $2390
DTEN        = $23A0
MT19        = $24ED
S1%         = $25A6
NA%         = $25AB
UNIV        = $28A4
NLIN4       = $28DC
MVT3        = $2D69
MVS5        = $2DC5
pr2         = $2E55
BEEP        = $2FEE
DIALS       = $2FF3
GINF        = $3E87
ping        = $3E95
DELAY       = $3EA1
DOXC        = $6A25
DOYC        = $6A28
DOVDU19     = $6A2E
TRADEMODE   = $6A2F
TT67        = $6A8E
BAY2        = $6DBF
gnum        = $6DC9
TT111       = $70AB
G1          = $71E8     \ JSR G1-13 in DrawCharts
zZ          = $71F2
jmp         = $7217
ee3         = $7224
pr6         = $7234
prq         = $723C
TT162       = $72C5
TT114       = $7452
DOEXP       = $7866     \ STA DOEXP in ApplyExplosionMod/RevertExplosionMod
PTCLS       = $78D6
SOLAR       = $7AC2
NWSTARS     = $7AF3
WPSHPS      = $7B1A
WS1         = $7B41     \ STA WS1-3 in ApplyMods/RevertMods
SP2         = $7BAB
NWSPS       = $7C24     \ JSR NWSPS+3 in SwapStationSun
NWSHP       = $7C6B
NwS1        = $7D03
WPLS        = $80FF
GETYN       = $81EE
TT17        = $81FB
KS4         = $82A4
KILLSHP     = $82F3
RESET       = $83CA
RES2        = $83DF
yu          = $8437     \ STA yu+3 in PlayUniverse
ZINF        = $8447
msblob      = $845C
SAL8        = $846C     \ STY SAL8+1 in UpdateDashboard
TT100       = $84ED
TT102       = $86B1     \ JSR TT102+7 in DrawCharts
TT92        = $86D0     \ STA TT92-7 in ApplyMods/RevertMods
NWDAV5      = $872C     \ LDA #NWDAV5-TT92+6 in ApplyMods
BR1         = $8882
DFAULT      = $88F0
TITLE       = $8920
CHECK       = $89EB
GTL2        = $8A2F     \ STA GTL2+1 in ShowDiscMenu/RevertDiscMods
GTNMEW      = $8A38
MT26        = $8A5B
U%          = $8C6D
TAS2        = $8C8A
RDKEY       = $8D53
CTRL        = $8E92
TT217       = $8FEA
t           = $8FEC
TIDY        = $9105
LL9         = $9A86
LL74        = $9F35     \ STA LL74+16 in ApplyMods/RevertMods
MV5         = $A434
PLUT        = $A626
LOOK1       = $A6BA
SIGHT       = $A6D4
TT66        = $A72F
NOISE       = $A858
DOT         = $B09D
ECBLB       = $B0FD
SPBLB       = $B10E
SCAN        = $B410
XX21        = $D000
K%          = $F900

keyLog      = $8D0C     \ Key logger table, which is distinct from KL

GTDRV = 0   \ Not used in C64? Used in SaveLoadFile in UE
CATS = 0    \ Not used in C64? Used in DeleteUniverse and ReturnToDiscMenu in UE
stack = 0   \ Not used in C64? Used in ShowDiscMenu in UE

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

 CMP #f0                \ Did we press f1/f2? If not, skip the following
 BNE P%+5               \ instruction

 JMP UniverseEditor     \ We pressed f1/f2, so jump to UniverseEditor to start the
                        \ universe editor

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: TITLE
\       Type: Subroutine
\   Category: Start and end
\    Summary: Show the "Universe Editor" subtitle
\
\ ******************************************************************************

.PATCH2

 LDA #8                 \ Move the text cursor to column 8
 JSR DOXC

 LDA #6                 \ Print extended token 6 ("UNIVERSE EDITOR")
 JSR PrintToken

 JMP MT19               \ Call MT19 to capitalise the next letter (i.e. set
                        \ Sentence Case for this word only) and return from the
                        \ subroutine using a tail call

\ ******************************************************************************
\
\       Name: SkipModifierKeys
\       Type: Subroutine
\   Category: Universe Editor
\    Summary: Patch to stop RDKEY from storing modifier keys in KL, and to
\             implement SHIFT-cursor keys
\
\ ******************************************************************************

.SkipModifierKeys

 CPX #keyShiftL         \ If this is a modifier key, jump to smod1 to skip the
 BEQ smod1              \ following, so we do not store the key in KL
 CPX #keyShiftR
 BEQ smod1
 CPX #keyCtrl
 BEQ smod1
 CPX #keyC64
 BEQ smod1

 STX KL                 \ Store the key pressed in KL

.smod1

 SEC                    \ Set the C flag, as in the original

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ShiftCursorKeys
\       Type: Subroutine
\   Category: Universe Editor
\    Summary: Patch to implement the SHIFT-cursor keys in RDKEY
\
\ ******************************************************************************

.ShiftCursorKeys

 PHA                    \ Store A on the stack, so we can implement the code
                        \ below that the patch replaces

 LDX KL                 \ Fetch the key press

 CPX #keyDown           \ If the down arrow is not being pressed, jump to scur2
 BNE scur2              \ to keep checking

                        \ If we get here then the down arrow is being pressed, so
                        \ we need to check whether SHIFT is also being pressed

 BIT keyLog+keyShiftL   \ If the left SHIFT is being pressed, jump to scur1 to
 BMI scur1              \ set KL to the up arrow (i.e. SHIFT-down arrow)

 BIT keyLog+keyShiftR   \ If the right SHIFT is being pressed, jump to scur1 to
 BMI scur1              \ set KL to the up arrow (i.e. SHIFT-down arrow)

 BPL scur4              \ SHIFT is not being pressed, so jump to scur4 to return
                        \ from the subroutine

.scur1

 PHA                    \ SHIFT-down arrow is being pressed, so set KL to the up
 LDA #keyUp             \ arrow
 STA KL
 PLA

 JMP scur4              \ Jump to scur4 to return from the subroutine

.scur2

 CPX #keyRight          \ If the right arrow is not being pressed, jump to scur4
 BNE scur4              \ to keep checking

 BIT keyLog+keyShiftL   \ If the left SHIFT is being pressed, jump to scur3 to
 BMI scur3              \ set KL to the right arrow (i.e. SHIFT-left arrow)

 BIT keyLog+keyShiftR   \ If the left SHIFT is being pressed, jump to scur3 to
 BMI scur3              \ set KL to the right arrow (i.e. SHIFT-left arrow)

 BPL scur4              \ SHIFT is not being pressed, so jump to scur4 to return
                        \ from the subroutine

.scur3

 PHA                    \ SHIFT-right arrow is being pressed, so set KL to the
 LDA #keyLeft           \ left arrow
 STA KL
 PLA

.scur4

 PLA                    \ Fetch the value of A from the stack, so it is the same
                        \ as when we jumped to the patch

 STA $DC00              \ Implement the instruction that the patch replaces

 RTS                    \ Return from the subroutine

 INCLUDE "../src/elite-universe-editor-variables.asm"
 INCLUDE "../src/elite-universe-editor-3.asm"
 INCLUDE "../src/elite-universe-editor-1.asm"
 INCLUDE "../src/elite-universe-editor-2.asm"
 INCLUDE "../src/elite-universe-editor-4.asm"
 INCLUDE "../src/elite-universe-editor-z.asm"

SAVE "editor.bin", CODE%, P%, LOAD%
